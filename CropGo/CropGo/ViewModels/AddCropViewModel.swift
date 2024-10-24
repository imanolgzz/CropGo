//
//  AddCropViewModel.swift
//  CropGo
//
//  Created by David Balleza Ayala on 23/10/24.
//

import Foundation
import GoogleMaps

class AddCropViewModel: ObservableObject {
    @Published var crops: [Crop] = []
    @Published var selectedCropType: CropType = .corn // Default crop type
    @Published var currentPolygon: [CLLocationCoordinate2D] = [] // Holds the points for the polygon
    
    // Add a crop to the list of crops
    func addCrop() {
        let newCrop = Crop(name: selectedCropType.rawValue, location: currentPolygon)
        crops.append(newCrop)
    }

    // Check if enough points have been added
    func isValidPolygon() -> Bool {
        return currentPolygon.count >= 4
    }

    // Add a point to the polygon
    func addPointToPolygon(_ point: CLLocationCoordinate2D) {
        currentPolygon.append(point)
    }
    
    // Clear the polygon
    func clearPolygon() {
        currentPolygon.removeAll()
    }
}
