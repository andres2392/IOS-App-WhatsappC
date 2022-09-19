//
//  SettingsHeaderView.swift
//  WhatsappC (iOS)
//
//  Created by PDWS on 9/19/22.
//

import SwiftUI

struct SettingsHeaderView: View {
    var body: some View {
        HStack {
            Image("prof")
                .resizable()
                .scaledToFill()
                .frame(width: 64, height: 64)
                .clipShape(Circle())
                .padding(.leading)
            
            VStack(alignment: .leading, spacing: 4){
                Text("Andres Gonzalez")
                    .font(.system(size: 18))
                
                
                Text("Available")
                    .foregroundColor(.gray)
                    .font(.system(size: 14))
            }//: VSTACK
            
            Spacer()
        }//: HSTACK
        .frame(height: 80)
        .background(Color.white)
    }
}
