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

    // Coordinator to handle interaction with the map
    class Coordinator: NSObject, GMSMapViewDelegate {
        var parent: MapView

        init(parent: MapView) {
            self.parent = parent
        }

        // Handle map tap to add points
        func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
            parent.viewModel.addPointToPolygon(coordinate)
            parent.updateMap(mapView)
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

    // Update map and draw polygon
    func updateMap(_ mapView: GMSMapView) {
        mapView.clear()

        // Draw the polygon when there are 4 or more points
        if viewModel.currentPolygon.count >= 4 {
            let path = GMSMutablePath()
            for point in viewModel.currentPolygon {
                path.add(point)
            }
            let polygon = GMSPolygon(path: path)
            polygon.fillColor = UIColor(red: 0, green: 1, blue: 0, alpha: 0.2)
            polygon.strokeColor = UIColor.green
            polygon.strokeWidth = 2
            polygon.map = mapView
        }

        // Add markers for each point
        for point in viewModel.currentPolygon {
            let marker = GMSMarker(position: point)
            marker.map = mapView
        }
    }
}
