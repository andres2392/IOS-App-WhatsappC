//
//  UserCell.swift
//  WhatsappC (iOS)
//
//  Created by PDWS on 9/19/22.
//

import SwiftUI

struct ConversationCell: View {
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
                    
                    Text("this is some test message for now..")
                        .font(.system(size: 14))
                }//: VSTACK
                
                Spacer()
            }//: HSTACK
            .padding(.horizontal)
            
            Divider()
        }//: VSTACK
        .padding(.top)
    }
}

struct ConversationCell_Previews: PreviewProvider {
    static var previews: some View {
        ConversationCell()
    }
}
