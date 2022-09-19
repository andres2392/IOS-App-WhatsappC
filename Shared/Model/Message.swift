//
//  Message.swift
//  WhatsappC (iOS)
//
//  Created by PDWS on 9/19/22.
//

import Foundation

struct Message: Identifiable{
    let id = NSUUID().uuidString
    let isFromCurrentUser: Bool
    let messageText: String
}
