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
    @State var selectedUser: User?
    @ObservedObject var viewModel = ConversationsViewModel()
    
    
    // MARK: -  BODY
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            
            // MARK: - CHAT
            if let user = selectedUser {
                NavigationLink(
                    destination: ChatView(user: user),
                    isActive: $showChatView,
                    label: {})
                .isDetailLink(false)
            }//: IF STATEMENT
            
            
            // MARK: - CHATS
            ScrollView{
                VStack(alignment: .leading){
                    ForEach(viewModel.recentMessages){ message in
                        ConversationCell(viewModel: ConversationCellViewModel(message))
                    }//: LOOP
                }//: VSTACK
            }//: SCROLL
            
            // MARK: - FLOATING BUTTON
            
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
                NewMessageView(showChatView: $showChatView ,
                               user: $selectedUser)
            })
        }//:ZSTACK
        .onAppear{
            viewModel.fetchRecentMessages()
        }
    }
}

struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView()
    }
}
