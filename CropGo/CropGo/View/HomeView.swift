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
                .scrollIndicators(.hidden)
                HStack{Spacer()}

            }
            
            Text("Water Infrastructure")
                .font(.title2)
                .fontWeight(.bold)
            
            Grid(horizontalSpacing: 13, verticalSpacing: 13) {
                GridRow {
                    pipeItem(grade1: 90, grade2: 20, grade3: 60, text: "Northwest")
                    pipeItem(grade1: 90, grade2: 10, grade3: 100, text: "Southeast")
                }
                GridRow {
                    pipeItem(grade1: 30, grade2: 60, grade3: 100, text: "Southwest")
                    pipeItem(grade1: 70, grade2: 0, grade3: 52, text: "East")
                }
            }

            
            Text("Water Infrastructure")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top, 20)
            
            Image("waterGraph")
                .padding()
            
            Text("Mapa de Aspersores")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top, 20)

            Image("aspersores")
                .padding()
            
        }.padding(0)
            .background(Color(red:230/255, green:230/255, blue:230/255))
    }
}

struct pipeItem: View {
    var grade1 : Int = 90
    var grade2 : Int = 20
    var grade3 : Int = 60
    var text: String = "Title"
    var body: some View {
        VStack {
            Text(text)
                .fontWeight(.bold)
            
            HStack(spacing: 12){
                VStack{
                    if grade1 > 80 {
                        Image("Azul")
                            .resizable()
                            .frame(width: 30, height: 30)
                    } else if grade1 > 50 {
                        Image("Amarillo")
                            .resizable()
                            .frame(width: 30, height: 30)
                    } else {
                        Image("Rojo")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                    Text("\(grade1)%")
                        .font(.caption).fontWeight(.bold)
                    Text("Pressure")
                        .font(.caption)
                }
                VStack{
                    if grade2 > 80 {
                        Image("Azul")
                            .resizable()
                            .frame(width: 30, height: 30)
                    } else if grade2 > 50 {
                        Image("Amarillo")
                            .resizable()
                            .frame(width: 30, height: 30)
                    } else {
                        Image("Rojo")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                    Text("\(grade2)%")
                        .font(.caption).fontWeight(.bold)
                    Text("Quality")
                        .font(.caption)
                }
                VStack{
                    if grade3 > 80 {
                        Image("Azul")
                            .resizable()
                            .frame(width: 30, height: 30)
                    } else if grade3 > 50 {
                        Image("Amarillo")
                            .resizable()
                            .frame(width: 30, height: 30)
                    } else {
                        Image("Rojo")
                            .resizable()
                            .frame(width: 30, height: 30)
                        
                    }
                    Text("\(grade3)%")
                        .font(.caption).fontWeight(.bold)
                    Text("Stress")
                        .font(.caption)
                }
            }
        }
        .frame(width: 180, height: 120)
        .background(.white)
        .cornerRadius(10)
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
    }
}

#Preview {
    HomeView()
}
