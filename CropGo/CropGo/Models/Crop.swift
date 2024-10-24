//
//  Crop.swift
//  CropGo
//
//  Created by David Balleza Ayala on 23/10/24.
//

import Foundation
import CoreLocation

// Model for the Crop
struct Crop: Identifiable {
    let id = UUID()
    let name: String
    let location: [CLLocationCoordinate2D] // Polygon coordinates to define the crop area
}

// Enum to represent different types of crops
enum CropType: String, CaseIterable {
    case corn = "Corn"
    case lettuce = "Lettuce"
    case wheat = "Wheat"
    // Add more crop types as needed
}
