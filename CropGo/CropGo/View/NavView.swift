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
            TabIcon(selected: $selectedTab, icon: "house.fill", tab: 1)
            TabIcon(selected: $selectedTab, icon: "pencil.and.list.clipboard", tab: 2)
            TabIcon(selected: $selectedTab, icon: "tree", tab: 3)
            TabIcon(selected: $selectedTab, icon: "gearshape.fill", tab: 4)
        }.padding(12)
    }
    
}

struct TabIcon : View {
    @Binding var selected: Int
    var icon: String
    var tab: Int
    var body: some View {
        Button(action: {
            selected = tab
            print(tab)
        }){
            Image(systemName: icon)
                .resizable()
                .frame(width: 37, height: 37)
                .foregroundColor(selected == tab ? .blue : .black)
        }


    }
}

#Preview {
    VStack {
        NavView(selectedTab: .constant(1))
    }
}
