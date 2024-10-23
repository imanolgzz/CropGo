//
//  ContentView.swift
//  CropGo
//
//  Created by Imanol Armando González Solís on 22/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isAuth: Bool = false
    @State private var selectedTab: Int = 1
    
    var body: some View {
        if isAuth {
            switch selectedTab {
                case 1:
                    Text("Tab 1")
                case 2:
                    Text("Tab 2")
                case 3:
                    Text("Tab 3")
                case 4:
                    Text("Tab 4")
                default:
                    Text("No tab")
            }
            Spacer()
            NavView(selectedTab: $selectedTab)
        } else {
            AuthView(isAuth: $isAuth)
        }
    }
}

#Preview {
    ContentView()
}
