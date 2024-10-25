//
//  Crop.swift
//  CropGo
//
//  Created by David Balleza Ayala on 23/10/24.
//

import Foundation
import CoreLocation

// Model for a Crop with a name and a polygon (location)
struct Crop: Identifiable {
    let id = UUID()
    let name: String
    let location: [CLLocationCoordinate2D] // Polygon points
}

// Enum for crop types
enum CropType: String, CaseIterable {
    case corn = "Corn"
    case lettuce = "Lettuce"
    case wheat = "Wheat"
}
