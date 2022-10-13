//
//  SettingsHeaderView.swift
//  WhatsappC (iOS)
//
//  Created by PDWS on 9/19/22.
//

import SwiftUI
import Kingfisher

struct SettingsHeaderView: View {
    // MARK: - PROPERTIES
    private let user: User
    init(user: User){
        self.user = user
    }
    
    // MARK: - BODY
    var body: some View {
        HStack {
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 64, height: 64)
                .clipShape(Circle())
                .padding(.leading)
            
            VStack(alignment: .leading, spacing: 4){
                Text(user.fullname)
                    .font(.system(size: 18))
                    .foregroundColor(.black)
                
                
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
