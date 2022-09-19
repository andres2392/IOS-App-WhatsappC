//
//  CustomInputView.swift
//  WhatsappC (iOS)
//
//  Created by PDWS on 9/19/22.
//

import SwiftUI

struct CustomInputView: View {
    // MARK: - PROPERTIES
    @Binding var text: String
    
    var action: () -> Void
    
    // MARK: - BODY
    var body: some View {
        VStack{
            Rectangle()
                .foregroundColor(Color(.separator))
                .frame(width: UIScreen.main.bounds.width, height: 0.75)
            
            HStack{
                TextField("Message...", text: $text)
                    .textFieldStyle(PlainTextFieldStyle())
                    .font(.body)
                    .frame(minHeight: 30)
                
                Button(action: action, label: {
                    Text("Send")
                        .bold()
                        .foregroundColor(.black)
                })
            }//: HSTACK
            .padding(.bottom, 8)
            .padding(.horizontal)
        }//: VSTACK
    }
}

