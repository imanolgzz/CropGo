//
//  Crop.swift
//  CropGo
//
//  Created by David Balleza Ayala on 23/10/24.
//

import Foundation
import CoreLocation

struct Crop: Identifiable {
    var id = UUID()  // Unique identifier for the crop
    var name: String  // Name of the crop
    var type: CropType  // Type of the crop (this is what we'll use for color)
    var location: [CLLocationCoordinate2D]  // Location points of the crop
}

// Enum for crop types
enum CropType: String, CaseIterable {
    case corn = "Corn"
    case lettuce = "Lettuce"
    case wheat = "Wheat"
}
