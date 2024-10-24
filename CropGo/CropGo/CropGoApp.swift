//
//  CropGoApp.swift
//  CropGo
//
//  Created by Imanol Armando González Solís on 22/10/24.
//

import SwiftUI
import GoogleMaps

@main
struct CropGoApp: App {
    init() {
        GMSServices.provideAPIKey("AIzaSyDX7poP82CZ9TXU9VZNFpu9EuzUko2GC6Q")
       }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
