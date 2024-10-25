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
    @Published var crops: [Crop] = [] // List of crops
    @Published var selectedCropType: CropType = .corn // Default crop type
    @Published var currentPolygon: [CLLocationCoordinate2D] = [] // Points for crop area

    // Add a crop
    func addCrop() {
        let newCrop = Crop(name: selectedCropType.rawValue, location: currentPolygon)
        crops.append(newCrop)
        clearPolygon() // Reset polygon after adding crop
    }

    // Add a point to the polygon (for defining the area)
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
}
