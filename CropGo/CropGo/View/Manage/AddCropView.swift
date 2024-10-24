//
//  AddCropView.swift
//  CropGo
//
//  Created by David Balleza Ayala on 23/10/24.
//

import SwiftUI

import GoogleMaps

struct AddCropView: View {
    @ObservedObject var viewModel: AddCropViewModel
    
    @State private var showingMap = false
    
    var body: some View {
        VStack {
            Text("Add a Crop")
                .font(.largeTitle)
                .padding()
            
            // Picker for selecting the crop type
            Picker("Select Crop Type", selection: $viewModel.selectedCropType) {
                ForEach(CropType.allCases, id: \.self) { type in
                    Text(type.rawValue)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            // Button to launch the map for polygon selection
            Button(action: {
                showingMap.toggle()
            }) {
                Text("Select Crop Location")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .sheet(isPresented: $showingMap) {
                // MapView for selecting polygon points
                CropLocationMapView(viewModel: viewModel)
            }
            
            Spacer()
            
            // Save the crop
            Button(action: {
                if viewModel.isValidPolygon() {
                    viewModel.addCrop()
                } else {
                    // Handle error: Not enough points
                }
            }) {
                Text("Save Crop")
                    .padding()
                    .background(viewModel.isValidPolygon() ? Color.green : Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}
