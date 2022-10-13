//
//  ProfilePhotoSelectorView.swift
//  WhatsappC
//
//  Created by PDWS on 10/11/22.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    // MARK: - PROPERTIES
    @State private var imagePickerPresented = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @EnvironmentObject var viewModel: AuthViewModel
    
    // MARK: - BODY
    var body: some View {
        VStack{
            Button(action: {imagePickerPresented.toggle()}, label: {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .clipShape(Circle())
                } else{
                    Image("plus_photo")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .clipped()
                        .padding(.top, 44)
                        .foregroundColor(.black)
                }
            })//: BUTTON
            .sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: {
                ImagePicker(image: $selectedImage)
            })
            
            Text(profileImage == nil ? "Select a profile photo" : "Great! Tab below to continue")
                .font(.system(size: 20, weight: .semibold))
            
            if let image = selectedImage {
                Button(action: {
                    viewModel.uploadProfileImage(image)
                }, label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .padding()
                    
                })//: BUTTON
                .shadow(color: .gray, radius: 10, x: 0, y: 0)
                .padding(.top, 24)
            }//: CONDITION
            
            Spacer()
        }//: VSTACK
        .navigationBarBackButtonHidden(true)
    }
    
    func loadImage(){
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
