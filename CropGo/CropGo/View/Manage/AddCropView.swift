//
//  AddCropView.swift
//  CropGo
//
//  Created by David Balleza Ayala on 23/10/24.
//

import SwiftUI

struct AddCropView: View {
    @ObservedObject var viewModel: AddCropViewModel

    var body: some View {
        VStack {
            // Picker for selecting the crop type
            Picker("Select Crop Type", selection: $viewModel.selectedCropType) {
                ForEach(CropType.allCases, id: \.self) { type in
                    Text(type.rawValue)
                }
            }
            .pickerStyle(SegmentedPickerStyle()) // Optional styling

            // Save button
            Button(action: {
                if viewModel.isValidPolygon() {
                    viewModel.addCrop() // Assuming there's an `addCrop` function in your ViewModel
                }
            }) {
                Text("Save Crop")
                    .padding()
                    .background(viewModel.isValidPolygon() ? Color.green : Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
        }
        .padding()
    }
}
