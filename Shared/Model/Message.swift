//
//  Message.swift
//  WhatsappC (iOS)
//
//  Created by PDWS on 9/19/22.
//

import FirebaseFirestoreSwift
import Firebase

struct Message: Identifiable, Decodable{
    @DocumentID var id: String?
    let fromId: String
    let toId: String
    let read: Bool
    let text: String
    let timestamp: Timestamp
    
    var user: User?
}

