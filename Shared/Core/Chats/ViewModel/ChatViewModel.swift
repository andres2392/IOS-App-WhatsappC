//
//  ChatViewModel.swift
//  WhatsappC (iOS)
//
//  Created by PDWS on 9/19/22.
//

import Foundation

class ChatViewModel: ObservableObject{
    
    @Published var messages = [Message]()
    
    init(){
        messages = mockMessages
    }
    
    var mockMessages:[Message]{
        [
            .init(isFromCurrentUser: true, messageText: "Hey, what's up mas"),
            .init(isFromCurrentUser: false, messageText: "not much how are you"),
            .init(isFromCurrentUser: true, messageText: "I'm doing fine, having fun building apps?"),
            .init(isFromCurrentUser: true, messageText: "Are you learning alot?"),
            .init(isFromCurrentUser: false, messageText: "Yeah, i'm doing great"),
            .init(isFromCurrentUser: true, messageText: "Thats awesome"),
            .init(isFromCurrentUser: true, messageText: "Talk to you later")
        ]
    }
    
    func sendMessage(_ messageText: String){
        let message = Message(isFromCurrentUser: true, messageText: messageText)
        messages.append(message)
    }
}
