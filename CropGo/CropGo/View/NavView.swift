//
//  NavView.swift
//  CropGo
//
//  Created by Imanol Armando González Solís on 23/10/24.
//

import SwiftUI

struct NavView: View {
    @Binding var selectedTab: Int
    var body: some View {
        Divider()
            .background(Color.black) // Puedes ajustar el color y grosor si es necesario
            .frame(height: 1) // Grosor de la líne
        
        HStack(alignment: .center, spacing: 56){
            TabIcon(selected: $selectedTab, icon: "house.fill", iconAlt: "house", tab: 1)
            TabIcon(selected: $selectedTab, icon: "doc.text.below.ecg.fill", iconAlt: "doc.text.below.ecg", tab: 2, widthIcon: 32)
            TabIcon(selected: $selectedTab, icon: "tree.fill", iconAlt: "tree", tab: 3)
            TabIcon(selected: $selectedTab, icon: "gearshape.fill", iconAlt: "gearshape", tab: 4)
        }.padding(10)
    }
    
}

struct TabIcon : View {
    @Binding var selected: Int
    var icon: String
    var iconAlt: String
    var tab: Int
    var widthIcon: CGFloat? = nil
    var body: some View {
        Button(action: {
            selected = tab
            print(tab)
        }){
            Image(systemName: (selected == tab ? icon : iconAlt))
                .resizable()
                .frame(width: (widthIcon != nil ? widthIcon : 37), height: 37)
                .foregroundColor(.black)
        }


    }
}

#Preview {
    VStack {
        NavView(selectedTab: .constant(1))
    }
}
