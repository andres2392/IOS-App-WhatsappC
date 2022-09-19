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
    @ObservedObject var viewModel = ChatViewModel()
    var body: some View {
        
        VStack {
            //MESSAGE
            ScrollView{
                VStack(alignment: .leading, spacing: 12 ){
                    ForEach(viewModel.messages){ messages in
                        MessageView(isFromCurrentUser: messages.isFromCurrentUser, messageText: messages.messageText)
                    }
                    
                }//: VSTACK
            }//: SCROLL
            
            //INPUT VIEW
            CustomInputView(text: $messageText, action: sendMessage)
            
        }//: VSTACK
        .navigationTitle("Andres")
        .navigationBarTitleDisplayMode(.inline)
        .padding(.vertical)
    }
    
    func sendMessage() {
        viewModel.sendMessage(messageText)
        messageText = ""
    }
}

struct ChatsView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
