//
//  MapView.swift
//  CropGo
//
//  Created by David Balleza Ayala on 23/10/24.
//

import SwiftUI
import GoogleMaps

struct MapView: UIViewRepresentable {
    var crops: [Crop]

    // Coordinator to handle interaction with the GMSMapView
    class Coordinator: NSObject, GMSMapViewDelegate {
        var parent: MapView

        init(parent: MapView) {
            self.parent = parent
        }
    }

    // Create the Google Map view
    func makeUIView(context: Context) -> GMSMapView {
        let camera = GMSCameraPosition.camera(withLatitude: 37.7749, longitude: -122.4194, zoom: 12.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.delegate = context.coordinator
        return mapView
    }

    // Update the map view
    func updateUIView(_ uiView: GMSMapView, context: Context) {
        // Clear previous polygons
        uiView.clear()

        // Loop through crops and add polygons for each
        for crop in crops {
            let path = GMSMutablePath()
            for coordinate in crop.location {
                path.add(coordinate)
            }
            
            let polygon = GMSPolygon(path: path)
            polygon.fillColor = UIColor(red: 0, green: 1, blue: 0, alpha: 0.3) // Light green fill
            polygon.strokeColor = UIColor.green // Green border
            polygon.strokeWidth = 2
            polygon.map = uiView
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
}
