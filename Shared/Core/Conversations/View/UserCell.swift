//
//  UserCell.swift
//  WhatsappC (iOS)
//
//  Created by PDWS on 9/19/22.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        VStack {
            HStack{
                
                Image("prof")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                
                // MESSAGE INFO
                VStack(alignment: .leading,spacing: 4){
                    Text("Andres Gonzalez")
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text("@microgonz")
                        .font(.system(size: 14))
                }//: VSTACK
                .foregroundColor(.black)
                
                Spacer()
            }//: HSTACK
            .padding(.horizontal)
        
        }//: VSTACK
        .padding(.top)
    }
}

