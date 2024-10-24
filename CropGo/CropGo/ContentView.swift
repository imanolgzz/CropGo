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
            TopView()
            switch selectedTab {
                case 1:
                    HomeView()
                        .offset(x: 0, y: -7.2)
                case 2:
                    DashboardView()
                        .offset(x: 0, y: -7.2)
                case 3:
                    ManageView()
                        .offset(x: 0, y: -7.2)
                case 4:
                    SettingsView()
                        .offset(x: 0, y: -7.2)
                default:
                    Text("Tab not found")
            }
            Spacer()
            NavView(selectedTab: $selectedTab)
                .padding(.top, -14.4)
        } else {
            AuthView(isAuth: $isAuth)
        }
    }
}

#Preview {
    ContentView()
}
