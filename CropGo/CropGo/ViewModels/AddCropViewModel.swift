//
//  AddCropViewModel.swift
//  CropGo
//
//  Created by David Balleza Ayala on 23/10/24.
//

import Foundation
import CoreLocation
import SwiftUI

class AddCropViewModel: ObservableObject {
    @Published var crops: [Crop] = []  // List of all crops
    @Published var selectedCropType: CropType = .corn  // Default crop type
    @Published var currentPolygon: [CLLocationCoordinate2D] = []  // Points for crop area

    // Colors for each crop type
    let cropColors: [CropType: UIColor] = [
        .corn: UIColor.systemYellow,
        .lettuce: UIColor.systemGreen,
        .wheat: UIColor.brown
    ]

    // Add a crop to the list
    func addCrop() {
        let newCrop = Crop(name: selectedCropType.rawValue, type: selectedCropType, location: currentPolygon)  // Include crop type
        crops.append(newCrop)
        clearPolygon()  // Reset polygon after adding crop
    }

    // Add a point to the polygon
    func addPointToPolygon(_ point: CLLocationCoordinate2D) {
        currentPolygon.append(point)
    }

    // Clear the polygon points
    func clearPolygon() {
        currentPolygon.removeAll()
    }

    // Check if the polygon is valid (at least 4 points)
    func isValidPolygon() -> Bool {
        return currentPolygon.count >= 4
    }

    // Get color for each crop type
    func getCropColor(for type: CropType) -> UIColor {
        return cropColors[type] ?? UIColor.red
    }
}
