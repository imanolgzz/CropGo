//
//  CropLocationMapView.swift
//  CropGo
//
//  Created by David Balleza Ayala on 23/10/24.
//

import SwiftUI
import GoogleMaps

struct CropLocationMapView: UIViewRepresentable {
    @ObservedObject var viewModel: AddCropViewModel
    
    class Coordinator: NSObject, GMSMapViewDelegate {
        var parent: CropLocationMapView

        init(parent: CropLocationMapView) {
            self.parent = parent
        }

        // Handle adding points on tap
        func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
            parent.viewModel.addPointToPolygon(coordinate)
            
            // Clear any previous polygon
            mapView.clear()
            
            // Draw the new polygon
            let path = GMSMutablePath()
            for point in parent.viewModel.currentPolygon {
                path.add(point)
            }
            let polygon = GMSPolygon(path: path)
            polygon.fillColor = UIColor(red: 0, green: 1, blue: 0, alpha: 0.2)
            polygon.map = mapView
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }

    func makeUIView(context: Context) -> GMSMapView {
        let camera = GMSCameraPosition.camera(withLatitude: 37.7749, longitude: -122.4194, zoom: 10)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.delegate = context.coordinator
        return mapView
    }

    func updateUIView(_ uiView: GMSMapView, context: Context) {
        // Nothing needed here
    }
}
