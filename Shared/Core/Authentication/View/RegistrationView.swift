//
//  RegistrationView.swift
//  WhatsappC (iOS)
//
//  Created by Andres Gonzalez on 9/18/22.
//

import SwiftUI

struct RegistrationView: View {
    // MARK: - PROPERTIES
    @State private var email = ""
    @State private var password = ""
    @State private var fullname = ""
    @State private var username = ""
    @Environment(\.presentationMode) var mode
    @EnvironmentObject var viewModel: AuthViewModel
    
    // MARK: - BODY
    var body: some View {
        VStack {
            
            NavigationLink(
                destination: ProfilePhotoSelectorView(),
                isActive: $viewModel.didAuthenticateUser,
                label: {})
            
            VStack(alignment: .leading, spacing: 12){
                HStack{ Spacer() }
                 
                Text("Get started.")
                    .font(.largeTitle)
                    .bold()
                Text("Create your account.")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.blue)
                
                VStack(spacing: 40){
                    
                    CustomTextField(imageName: "envelope",
                                    placeholderText: "Email",
                                    isSecureField: false,
                                    text: $email)
                   
                    CustomTextField(imageName: "person",
                                    placeholderText: "Username",
                                    isSecureField: false,
                                    text: $username)
                   
                    CustomTextField(imageName: "person",
                                    placeholderText: "Full Name",
                                    isSecureField: false,
                                    text: $fullname)
                    
                    CustomTextField(imageName: "lock",
                                    placeholderText: "Password",
                                    isSecureField: true,
                                     text: $password)
                    
                    
                }//: VSTACK INPUT TEXTS
                .padding([.top,.horizontal], 32)
            
            }//: VSTACK HEADER
            .padding(.leading)
            
            Button(action:{
                viewModel.register(withEmail: email, password: password, fullname: fullname, username: username)
            }, label:{
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color.blue)
                    .clipShape(Capsule())
                    .padding()
            })//: BUTTON SIGN IN
            .padding(.top, 24)
            .shadow(color: .gray, radius: 10, x: 0.0, y: 0.0)
            
            Spacer()
            
            Button(action: {
                mode.wrappedValue.dismiss()
            }, label: {
                HStack{
                    Text("Already have and account?")
                        .font(.system(size: 14))
                    
                    Text("Sign In")
                        .font(.system(size: 14, weight: .semibold))
                }
            })
            .padding(.bottom, 32)
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
