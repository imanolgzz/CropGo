//
//  Login.swift
//  CropGo
//
//  Created by Imanol Armando González Solís on 23/10/24.
//

import SwiftUI

struct AuthView: View {
    @State private var register: Bool = true
    @Binding var isAuth: Bool
    var body: some View {
        if register {
            RegisterView(isAuth: $isAuth, register: $register)
        } else {
            LoginView(isAuth: $isAuth, register: $register)
        }
    }
}

struct LoginView: View {
    @Binding var isAuth: Bool
    @Binding var register: Bool
    @State private var emailInput: String = ""
    @State private var passwordInput: String = ""
    var body: some View {
        VStack(spacing: 10){
            VStack(spacing: 0){
                Image("LogoCropGo")
                    .resizable()
                    .frame(width: 120, height: 120)
                Text("CropGo")
                    .font(.title)
                    .fontWeight(.black)
            }.padding(.top, 25)
            Text("Sign In")
                .font(.title2)
                .fontWeight(.black)
                .foregroundStyle(.black)
                .padding(.top, 25)
                .padding(.bottom, 5)
            InputItem(text:"Email", placeholder: "Enter your email:", input: $emailInput)
            InputItem(text: "Password", placeholder: "Enter your password:", input: $passwordInput, secret: true)
            Button(action: {
                isAuth = true
            })
            {
                Text("Sign In")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: 180, height: 47)
                    .background(.black)
                    .cornerRadius(30)
                    .padding(30.0)
            }
            
            VStack{
                Text("Still not growing smart?")
                Button(action: {
                    register = true
                }){
                    Text("Create an account")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
            }
            Spacer()
        }
    }
}

struct RegisterView: View {
    @Binding var isAuth: Bool
    @Binding var register: Bool
    @State private var emailInput: String = ""
    @State private var passwordInput: String = ""
    @State private var confirmPasswordInput: String = ""
    var body: some View {
        VStack(spacing: 10){
            VStack(spacing: 0){
                Image("LogoCropGo")
                    .resizable()
                    .frame(width: 120, height: 120)
                Text("CropGo")
                    .font(.title)
                    .fontWeight(.black)
            }.padding(.top, 25)
            Text("Sign Up")
                .font(.title2)
                .fontWeight(.black)
                .foregroundStyle(.black)
                .padding(.top, 25)
                .padding(.bottom, 5)
            InputItem(text:"Email", placeholder: "Enter your email:", input: $emailInput)
            InputItem(text: "Password", placeholder: "Create a secure password:", input: $passwordInput, secret: true)
            InputItem(text: "Confirm Password", placeholder: "Confirm your password:", input: $confirmPasswordInput, secret: true)
            Button(action: {
                isAuth = true
            })
            {
                Text("Get Started")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: 180, height: 47)
                    .background(.black)
                    .cornerRadius(30)
                    .padding(30.0)
            }
            
            VStack{
                Text("Already have an account?")
                Button(action: {
                    register = false
                }){
                    Text("Sign in")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }            }
            Spacer()
        }
    }
}


struct InputItem: View {
    var text: String
    var placeholder: String = ""
    @Binding var input: String
    var secret: Bool = false
    var body: some View {
        VStack{
            Text(text)
                .fontWeight(.semibold)
                .foregroundStyle(.black)
                .frame(width: 300, alignment: .leading)
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(red: 220/255, green: 220/255, blue:220/255))
                    .frame(width: 300, height: 47)
                if secret{
                    SecureField(placeholder, text: $input)
                        .padding(15)
                        .frame(width: 300, height: 55)
                        .textInputAutocapitalization(.never)
                } else {
                    TextField(placeholder, text: $input)
                        .padding(15)
                        .frame(width: 300, height: 55)
                        .textInputAutocapitalization(.never)
                }
            }
        }
        .padding(.bottom, 10)
    }
}


#Preview {
    AuthView(isAuth: .constant(false))
}
