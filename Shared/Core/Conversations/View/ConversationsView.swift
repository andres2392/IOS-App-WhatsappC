//
//  ConversationsView.swift
//  WhatsappC (iOS)
//
//  Created by PDWS on 9/19/22.
//

import SwiftUI

struct ConversationsView: View {
    // MARK: - PROPERTIES
    
    // MARK: -  BODY
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            
            // CHATS
            ScrollView{
                VStack(alignment: .leading){
                    
                    ForEach(0 ... 10 , id: \.self){ _ in
                        ConversationCell()
                    }//: LOOP
                }//: VSTACK
            }//: SCROLL
            
            //FLOATING BUTTON
            
            Button(action: {
                print("Show users list here..")
            }, label: {
                Image(systemName: "square.and.pencil")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .padding()
            })//: BUTTON
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
        }//:ZSTACK
    }
}

struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView()
    }
}
