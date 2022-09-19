//
//  CustomTextField.swift
//  WhatsappC (iOS)
//
//  Created by Andres Gonzalez on 9/18/22.
//

import SwiftUI

struct CustomTextField: View {
    // MARK: - PROPERTIES
    var imageName: String
    let placeholderText: String
    let isSecureField: Bool
    @Binding var text: String
    
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 16){
            HStack{
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray ))
                if isSecureField{
                    SecureField(placeholderText, text: $text)
                }else {
                    TextField(placeholderText, text: $text)
                }
                
            }
            Divider()
                .background(Color(.darkGray))
        }
    }
}


