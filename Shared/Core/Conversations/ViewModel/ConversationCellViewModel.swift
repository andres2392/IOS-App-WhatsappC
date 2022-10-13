//
//  ConversationCellViewModel.swift
//  WhatsappC
//
//  Created by PDWS on 10/13/22.
//

import SwiftUI

class ConversationCellViewModel: ObservableObject{
    // MARK: - PROPERTIES
    @Published var message: Message
    
    init(_ message: Message){
        self.message = message
        fetchUser()
    }
    
    var chatPartnerId: String{
        return message.fromId == AuthViewModel.shared.userSession?.uid ? message.toId : message.fromId
    }
    
    var chatPartnetProfileImageUrl: URL? {
        guard let user = message.user else { return nil}
        return URL(string: user.profileImageUrl)
    }
    
    var fullname:String{
        guard let user = message.user else {return ""}
        return user.fullname

    }
    
    func fetchUser(){
        
        COLLECTION_USERS.document(chatPartnerId).getDocument{ snapshot, _ in
            self.message.user = try? snapshot?.data(as: User.self)

        }
    }
}
