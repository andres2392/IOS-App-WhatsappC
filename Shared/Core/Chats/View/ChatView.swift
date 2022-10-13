//
//  ChatsView.swift
//  WhatsappC (iOS)
//
//  Created by PDWS on 9/19/22.
//

import SwiftUI

struct ChatView: View {
    // MARK: -  PROPERTIES
    @State private var messageText = ""
    @ObservedObject var viewModel: ChatViewModel
    private let user: User
    
    init(user: User){
        self.user = user
        self.viewModel = ChatViewModel(user: user)
    }
    
    // MARK: - BODY
    var body: some View {
        
        VStack {
            //MESSAGE
            ScrollView{
                VStack(alignment: .leading, spacing: 12 ){
                    ForEach(viewModel.messages){ message in
                        MessageView(viewModel: MessageViewModel(message))
                    }
                    
                }//: VSTACK
            }//: SCROLL
            
            //INPUT VIEW
            CustomInputView(text: $messageText, action: sendMessage)
            
        }//: VSTACK
        .navigationTitle(user.username)
        .navigationBarTitleDisplayMode(.inline)
        .padding(.vertical)
    }
    
    func sendMessage() {
        viewModel.sendMessage(messageText)
        messageText = ""
    }
}

