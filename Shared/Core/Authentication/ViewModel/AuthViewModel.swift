//
//  AuthViewModel.swift
//  WhatsappC
//
//  Created by PDWS on 10/11/22.
//

import Firebase
import UIKit
import FirebaseAuth
import FirebaseFirestore

class AuthViewModel: NSObject, ObservableObject{
    // MARK: - PROPERTIES
    @Published var didAuthenticateUser = false
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    private var tempCurrentUser: FirebaseAuth.User?
    
    static let shared = AuthViewModel()
    
    override init(){
        super.init()
        userSession = Auth.auth().currentUser
        
        fetchUser()
    }
    
    // MARK: - LOGIN
    func login(withEmail email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password){ result, error in
            if let error = error {
                print("DEBUG: Failed to sign in with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else {return }
            self.userSession = user
            self.fetchUser()
        }
    }
    
    // MARK: - REGISTER
    func register(withEmail email: String, password: String, fullname: String, username: String){
        Auth.auth().createUser(withEmail: email, password: password){result, error in
            if let error = error {
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return}
            self.tempCurrentUser = user
            
            let data: [String: Any] = ["email": email,
                                       "username": username,
                                       "fullname": fullname]
            COLLECTION_USERS.document(user.uid).setData(data){_ in
                self.didAuthenticateUser = true
                
            }
        }
    }
    
    // MARK: - UPLOAD PROFILE IMAGE
    func uploadProfileImage(_ image: UIImage){
        guard let uid = tempCurrentUser?.uid else { return }
        ImageUploader.uploadImage(image: image){ imageUrl in
            COLLECTION_USERS.document(uid).updateData(["profileImageUrl": imageUrl]){ _ in
                print("DEBUG: success update user data")
                self.userSession = self.tempCurrentUser
            }
        }
    }
    
    // MARK: - SIGNOUT
    func signout(){
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    // MARK: - FETCH USER
    func fetchUser(){
        guard let uid = userSession?.uid else { return }
        
        COLLECTION_USERS.document(uid).getDocument{ snapshot, _ in
            guard let user = try? snapshot?.data(as: User.self) else { return}
            self.currentUser = user
            //print("DEBUG: User is \(user)")
        }
    }
}
