//
//  ManageView.swift
//  CropGo
//
//  Created by Imanol Armando González Solís on 23/10/24.
//

import SwiftUI

struct ManageView: View {
    @StateObject private var viewModel = AddCropViewModel() // StateObject to manage crops

    var body: some View {
        NavigationStack {
            VStack {
                Text("Manage My Crops")
                    .font(.largeTitle)
                    .padding()

                if viewModel.crops.isEmpty {
                    Text("No crops to show.")
                        .font(.title2)
                        .padding()

                    // Navigate to AddCropView, passing the shared viewModel
                    NavigationLink(destination: AddCropView(viewModel: viewModel)) {
                        Text("Add Crop")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding()
                } else {
                    // Show the map with saved crops (read-only, no adding/editing allowed)
                    MapView(viewModel: viewModel, isInteractive: false)  // Set isInteractive to false
                        .frame(height: 400)

                    // List the crops below the map
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(viewModel.crops) { crop in
                                VStack {
                                    Text(crop.name)
                                        .font(.headline)
                                    Image(crop.name) // Replace with actual images
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                }
                                .padding()
                            }
                        }
                    }

                    // Button to navigate to AddCropView
                    NavigationLink(destination: AddCropView(viewModel: viewModel)) {
                        Text("Add Crop")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding()
                }
            }
            .padding()
        }
    }
}
