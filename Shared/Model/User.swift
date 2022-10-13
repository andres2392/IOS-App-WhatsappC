//
//  User.swift
//  WhatsappC
//
//  Created by PDWS on 10/12/22.
//

import FirebaseFirestoreSwift
import Foundation

struct User: Identifiable, Decodable{
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let email: String
    let profileImageUrl: String
}

let MOCK_USER = User(id: "12314234342",
                     username: "Test",
                     fullname: "test",
                     email: "test@gmail.com",
                     profileImageUrl: "www.google.com")
