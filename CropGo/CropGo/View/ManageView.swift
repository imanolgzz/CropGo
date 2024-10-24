//
//  ManageView.swift
//  CropGo
//
//  Created by Imanol Armando González Solís on 23/10/24.
//

import SwiftUI

struct ManageView: View {
    @ObservedObject var viewModel = AddCropViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Manage My Crops")
                    .font(.largeTitle)
                    .padding()

                // Map View with existing crops
                if !viewModel.crops.isEmpty {
                    // Display crops' map if crops exist
                    MapView(crops: viewModel.crops)
                        .frame(height: 300) // Set a height for the map
                } else {
                    // Show a placeholder when no crops exist
                    Text("No crops found")
                        .font(.title2)
                        .padding()
                }

                // Button to add a new crop (with navigation)
                NavigationLink(destination: AddCropView(viewModel: viewModel)) {
                    Text("Add Crop")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()

                // List of crops
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(viewModel.crops) { crop in
                            VStack {
                                Text(crop.name)
                                Image(crop.name) // Assume we have an image for each crop type
                                    .resizable()
                                    .frame(width: 100, height: 100)
                            }
                        }
                    }
                }
            }
            .padding()
        }
    }
}
