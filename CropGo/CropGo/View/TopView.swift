//
//  TopView.swift
//  CropGo
//
//  Created by Imanol Armando González Solís on 23/10/24.
//

import SwiftUI

struct TopView: View {
    var body: some View {
        HStack(alignment: .center, spacing: 56){
            HStack(spacing: 15){
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 37, height: 37)
                Text("Elvia Rosas")
                    .fontWeight(.bold)
            }
            Spacer()
            Image(systemName: "info.circle.fill")
                .resizable()
                .frame(width: 34, height: 34)
        }
        .padding(.horizontal, 27)
        .padding(.vertical, 6)
        Divider()
            .background(Color.black) // Puedes ajustar el color y grosor si es necesario
    }
}

#Preview {
    TopView()
}
