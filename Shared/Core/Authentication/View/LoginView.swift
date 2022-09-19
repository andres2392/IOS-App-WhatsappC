//
//  LoginView.swift
//  WhatsappC (iOS)
//
//  Created by Andres Gonzalez on 9/18/22.
//

import SwiftUI

struct LoginView: View {
    // MARK: - PROPERTIES
    @State private var email = ""
    @State private var password = ""
    
    // MARK: - BODY
    var body: some View {
        
        NavigationView {
            
            VStack {
                VStack(alignment: .leading, spacing: 12){
                    HStack{ Spacer() }
                     
                    Text("Hello.")
                        .font(.largeTitle)
                        .bold()
                    Text("Welcome back")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.blue)
                    
                    VStack(spacing: 20){
                        
                        CustomTextField(imageName: "envelope",
                                        placeholderText: "Email",
                                        isSecureField: false,
                                        text: $email)
                        
                        CustomTextField(imageName: "lock",
                                        placeholderText: "Password",
                                        isSecureField: true,
                                         text: $password)
                        
                        
                    }//: VSTACK INPUT TEXTS
                    .padding([.top,.horizontal], 32)
                
                }//: VSTACK HEADER
                .padding(.leading)
               
                HStack{
                    Spacer()
                    
                    NavigationLink(
                        destination: Text("Reset password.."),
                                   label: {
                        Text("Forgot password?")
                            .font(.system(size: 13, weight: .semibold))
                            .padding(.top)
                            .padding(.trailing, 28)
                    })
                }//: HSTACK FORGOTB
                
                Button(action:{
                    print("Handle sign up..")
                }, label:{
                    Text("Sign in")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .padding()
                })//: BUTTON SIGN IN
                .shadow(color: .gray, radius: 10, x: 0.0, y: 0.0)
                
                Spacer()
                
                NavigationLink(
                    destination: RegistrationView(),
                    label: {
                        HStack{
                            Text("Don't have and account?")
                                .font(.system(size: 14))
                            
                            Text("Sign Up")
                                .font(.system(size: 14, weight: .semibold))
                        }
                })//: NAV LINK REGISTRATION
                .padding(.bottom, 16)
            }
        }//: NAV VIEW
        .padding(.top, -56)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
