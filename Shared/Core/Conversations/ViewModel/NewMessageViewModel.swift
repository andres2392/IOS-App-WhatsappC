//
//  NewMessageViewModel.swift
//  WhatsappC
//
//  Created by PDWS on 10/12/22.
//

import SwiftUI

class NewMessageViewModel: ObservableObject{
    @Published var users = [User]()
    
    init(){
        fetchUsers()
    }
    
    func fetchUsers(){
        COLLECTION_USERS.getDocuments{ snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            
            self.users = documents.compactMap({try? $0.data(as: User.self)})
                .filter({ $0.id != AuthViewModel.shared.userSession?.uid })
        }
    }
}

