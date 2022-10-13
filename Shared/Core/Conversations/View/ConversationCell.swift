//
//  UserCell.swift
//  WhatsappC (iOS)
//
//  Created by PDWS on 9/19/22.
//

import SwiftUI
import Kingfisher

struct ConversationCell: View {
    // MARK: - PROPERTIES
    @ObservedObject var viewModel: ConversationCellViewModel
    
    
    
    // MARK: - BODY
    var body: some View {
        if let user = viewModel.message.user{
            NavigationLink(destination: ChatView(user: user)){
                VStack {
                    HStack{
                        
                        KFImage(viewModel.chatPartnetProfileImageUrl)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 48, height: 48)
                            .clipShape(Circle())
                        
                        // MESSAGE INFO
                        VStack(alignment: .leading,spacing: 4){
                            Text(viewModel.fullname)
                                .font(.system(size: 14, weight: .semibold))
                            
                            Text(viewModel.message.text)
                                .font(.system(size: 14))
                        }//: VSTACK
                        .foregroundColor(.black)
                        
                        Spacer()
                    }//: HSTACK
                    .padding(.horizontal)
                    
                    Divider()
                }//: VSTACK
                .padding(.top)
            }//: NAVIGATION LINK
        }//: COMPARISON USER
    }
}


