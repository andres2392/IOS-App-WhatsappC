//
//  UserCell.swift
//  WhatsappC (iOS)
//
//  Created by PDWS on 9/19/22.
//

import SwiftUI
import Kingfisher

struct UserCell: View {
    // MARK: - PROPERTIES
    let user: User
    
    // MARK: - BODY
    var body: some View {
        VStack {
            HStack{
                
                KFImage(URL(string: user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                
                // MESSAGE INFO
                VStack(alignment: .leading,spacing: 4){
                    Text(user.fullname)
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text(user.username)
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

