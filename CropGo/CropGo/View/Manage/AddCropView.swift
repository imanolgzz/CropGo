//
//  AddCropView.swift
//  CropGo
//
//  Created by David Balleza Ayala on 23/10/24.
//

import SwiftUI

struct AddCropView: View {
    @ObservedObject var viewModel: AddCropViewModel
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Text("Add a Crop")
                .font(.largeTitle)
                .padding()

            // Scrollable area for the list and map
            ScrollView {
                VStack(spacing: 10) {
                    // Crop selection list
                    ForEach(CropType.allCases, id: \.self) { cropType in
                        HStack {
                            Image(cropType.rawValue) // Ensure image assets are correct
                                .resizable()
                                .frame(width: 50, height: 50)
                                .padding(.leading, 10)

                            Text(cropType.rawValue)
                                .font(.headline)
                                .padding(.leading, 10)

                            Spacer() // Push everything to the left
                        }
                        .padding()
                        .background(viewModel.selectedCropType == cropType ? Color.blue.opacity(0.3) : Color.clear) // Highlight selected crop
                        .cornerRadius(10)
                        .onTapGesture {
                            viewModel.selectedCropType = cropType
                        }
                    }

                    // Map view to add points (interactive map)
                    MapView(viewModel: viewModel, isInteractive: true)  // Set isInteractive to true
                        .frame(height: 300)
                        .padding()
                }
                .padding()
            }

            Button(action: {
                viewModel.addCrop()
                presentationMode.wrappedValue.dismiss() // This dismisses the view and goes back to ManageView
            }) {
                Text("Save Crop")
                    .padding()
                    .background(viewModel.isValidPolygon() ? Color.green : Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .disabled(!viewModel.isValidPolygon())
            
        }
        .padding()
    }
}
