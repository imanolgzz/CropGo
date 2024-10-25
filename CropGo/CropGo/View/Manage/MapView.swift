//
//  MapView.swift
//  CropGo
//
//  Created by David Balleza Ayala on 23/10/24.
//

import SwiftUI
import GoogleMaps

struct MapView: UIViewRepresentable {
    @ObservedObject var viewModel: AddCropViewModel
    var isInteractive: Bool = true  // New flag to control interactivity
    
    class Coordinator: NSObject, GMSMapViewDelegate {
        var parent: MapView
        
        init(parent: MapView) {
            self.parent = parent
        }
        
        // Handle map tap to add points (only if the map is interactive)
        func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
            if parent.isInteractive {  // Check if map is in interactive mode
                parent.viewModel.addPointToPolygon(coordinate)
                parent.updateMap(mapView)
            }
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> GMSMapView {
        let camera = GMSCameraPosition.camera(withLatitude: 37.7749, longitude: -122.4194, zoom: 12.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.delegate = context.coordinator
        return mapView
    }
    
    func updateUIView(_ uiView: GMSMapView, context: Context) {
        updateMap(uiView)
    }
    
    // Update map and draw the polygons for the current crops and selected crop
    func updateMap(_ mapView: GMSMapView) {
        mapView.clear()  // Clear any previous markers and polygons

        // 1. Draw polygons for saved crops with specific colors for each crop type
        for crop in viewModel.crops {
            let path = GMSMutablePath()
            for point in crop.location {
                path.add(point)
            }

            let polygon = GMSPolygon(path: path)
            polygon.fillColor = viewModel.getCropColor(for: crop.type).withAlphaComponent(0.3)  // Get color based on crop type
            polygon.strokeColor = viewModel.getCropColor(for: crop.type)
            polygon.strokeWidth = 2
            polygon.map = mapView
        }

        // 2. Draw the current polygon (when adding a new crop) in a default blue color
        if viewModel.currentPolygon.count >= 4 {
            let path = GMSMutablePath()
            for point in viewModel.currentPolygon {
                path.add(point)
            }

            let polygon = GMSPolygon(path: path)
            polygon.fillColor = UIColor.blue.withAlphaComponent(0.3)  // For the new crop being added
            polygon.strokeColor = UIColor.blue
            polygon.strokeWidth = 2
            polygon.map = mapView
        }

        // 3. Add markers for each point in the current polygon (for adding a crop)
        for point in viewModel.currentPolygon {
            let marker = GMSMarker(position: point)
            marker.map = mapView
        }
    }
}
