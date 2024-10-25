//
//  ManageView.swift
//  CropGo
//
//  Created by Imanol Armando González Solís on 23/10/24.
//

import SwiftUI
import GoogleMaps

struct ManageView: View {
    @StateObject private var viewModel = AddCropViewModel()

    var body: some View {
        VStack {
            Text("Manage My Crops")
                .font(.largeTitle)
                .padding()

            // Picker to select crop type
            Picker("Select Crop Type", selection: $viewModel.selectedCropType) {
                ForEach(CropType.allCases, id: \.self) { type in
                    Text(type.rawValue)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            // MapView where users can tap to add points
            MapView(viewModel: viewModel)
                .frame(height: 400)

            // Button to save the crop (only enabled when polygon is valid)
            Button(action: {
                viewModel.addCrop()
            }) {
                Text("Save Crop")
                    .padding()
                    .background(viewModel.isValidPolygon() ? Color.green : Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .disabled(!viewModel.isValidPolygon()) // Disable if not enough points
            .padding()

            // List of crops
            ScrollView(.horizontal) {
                HStack {
                    ForEach(viewModel.crops) { crop in
                        VStack {
                            Text(crop.name)
                                .font(.headline)
                        }
                        .padding()
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ManageView()
}
