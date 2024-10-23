//
//  HomeView.swift
//  CropGo
//
//  Created by Imanol Armando González Solís on 23/10/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView(.vertical){
            VStack{
                Text("My Crops")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(10)
                ScrollView(.horizontal){
                    HStack(spacing: 25){
                        cropHeatmap(text: "Wheat")
                        cropHeatmap(text: "Corn", angle: 90)
                        cropHeatmap(text: "Potatoes", angle: 180)
                        cropHeatmap(text: "Beans", angle: 270)
                    }
                }
                .padding(23)
                HStack{Spacer()}
            }

        }.padding(0)
            .background(Color(red:230/255, green:230/255, blue:230/255))
    }
}

struct cropHeatmap: View {
    var text: String
    var angle: CGFloat = 0
    var body: some View {
        VStack(spacing: 10){
            Image("Heatmap")
                .resizable()
                .frame(width: 120, height: 120)
                .cornerRadius(15)
                .rotationEffect(.degrees(angle))
            
            Text(text)
                .fontWeight(.bold)
        }
        .padding(.bottom, 20)
    }
}

#Preview {
    HomeView()
}
