//
//  ConversationsView.swift
//  WhatsappC (iOS)
//
//  Created by PDWS on 9/19/22.
//

import SwiftUI

struct ConversationsView: View {
    // MARK: - PROPERTIES
    @State private var showNewMessageView = false
    @State private var showChatView = false
    
    // MARK: -  BODY
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            
            NavigationLink(
                destination: ChatView(),
                isActive: $showChatView,
                label: {})
            
            // CHATS
            ScrollView{
                VStack(alignment: .leading){
                    ForEach(0 ... 10 , id: \.self){ _ in
                        NavigationLink(
                            destination: ChatView(),
                            label: {
                            ConversationCell()
                        })//: NAV LINK
                    }//: LOOP
                }//: VSTACK
            }//: SCROLL
            
            //FLOATING BUTTON
            
            Button(action: {
                showNewMessageView.toggle()
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
            .sheet(isPresented: $showNewMessageView,
                   content: {
                        NewMessageView(showChatView: $showChatView )
            })
        }//:ZSTACK
    }
}

struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView()
    }
}
