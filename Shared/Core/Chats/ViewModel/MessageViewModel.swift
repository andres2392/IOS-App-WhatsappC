//
//  MessageViewModel.swift
//  WhatsappC
//
//  Created by PDWS on 10/12/22.
//

import Foundation

class MessageViewModel: ObservableObject{
    // MARK: - PROPERTIES
    @Published var user: User?
    let message: Message
    
    init(_ message: Message){
        self.message = message
    }
    
    var currentUid: String{
        return AuthViewModel.shared.userSession?.uid ?? ""
    }
    
    var isFromCurrentUser: Bool {
        return message.fromId == currentUid
    }
    
    var profileImageUrl: URL? {
        guard let profileImageUrl = message.user?.profileImageUrl else { return nil}
        return URL(string: profileImageUrl)
    }
    
}
