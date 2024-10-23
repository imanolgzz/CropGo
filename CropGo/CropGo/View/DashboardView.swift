//
//  DashboardView.swift
//  CropGo
//
//  Created by Imanol Armando González Solís on 23/10/24.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        VStack{
            //Encabezado
            HStack {
                //title
                Text("Dashboard")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top,10)
            }
            .padding()
            //Indicators
            VStack(alignment:.leading){
                Text("Indicators")
                    .font(.headline)
                    .padding(.horizontal)
                HStack{
                    IndicatorCard(title:"Sensors",color:.green)
                    IndicatorCard(title:"Weather",color:.gray,temperature:"30°C")
                    
                }
                .padding(.horizontal)
            }
            .padding(.vertical)
            
            //Proximas tareas
            VStack(alignment: .leading){
                Text("Upcoming tasks")
                    .font(.headline)
                    .padding(.horizontal)
                VStack{
                    TaskCard(title:"Irrigation",date:"Nov 20",iconName: "leaf.fill", color:.gray)
                }
                padding(.horizontal)
            }
            .padding(.vertical)
            Spacer()
            
            //barra de navegación inferior
            HStack{
                Spacer()
                NavigationIcon(systemName:"house.fill")
                Spacer()
                NavigationIcon(systemName: "chart.pie.fill")
                Spacer()
                NavigationIcon(systemName:"checkmark.square.fill")
                Spacer()
                NavigationIcon(systemName:"gearshape.fill")
                Spacer()
            }
            .padding()
            .background(Color.gray.opacity(0.1))
        }
    }
}

//Component para tarjetas de indicadores
struct IndicatorCard: View{
    var title: String
    var color: Color
    var temperature: String? = nil
    
    var body: some View{
        VStack(alignment: .leading){
            Text(title)
                .font(.subheadline)
                .padding(.top, 10)
            if let temp = temperature {
                Text(temp)
                    .font(.title)
                    .bold()
                    .padding(.top,10)
            }
            Spacer()
        }
        .frame(width:150, height: 150)
        .background(color)
        .cornerRadius(10)
        .padding(5)
    }
}

//Componente para tarjetas de tareas
struct TaskCard: View{
    var title: String
    var date: String
    var iconName: String
    var color: Color
    
    var body: some View{
        HStack{
            Image(systemName: iconName)
                .resizable()
                .frame(width: 30, height: 30)
                .padding()
                .background(color.opacity(0.3))
                .cornerRadius(5)
            VStack(alignment: .leading){
                Text(title)
                    .font(.headline)
                Text(date)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
        .padding(.vertical, 5)
    }
}

//Componentes para iconos de la navegacion
struct NavigationIcon: View{
    var systemName: String
    
    var body: some View{
        Image(systemName: systemName)
            .resizable()
            .frame(width: 25, height: 25)
            .foregroundColor(.black)
    }
}
#Preview {
    DashboardView()
}
