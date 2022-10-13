//
//  WhatsappCApp.swift
//  Shared
//
//  Created by Andres Gonzalez on 9/18/22.
//

import SwiftUI
import Firebase

@main
struct WhatsappCApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthViewModel.shared)
        }
    }
}
