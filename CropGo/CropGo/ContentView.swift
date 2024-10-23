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
                    HomeView()
                case 2:
                    DashboardView()
                case 3:
                    ManageView()
                case 4:
                    SettingsView()
                default:
                    Text("Tab not found")
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
