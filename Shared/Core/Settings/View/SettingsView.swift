//
//  SettingsView.swift
//  WhatsappC (iOS)
//
//  Created by PDWS on 9/19/22.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - PROPERTIES
    private let user: User
    
    init(user: User ){
        self.user = user
    }
    
    // MARK: - BODY
    var body: some View {
        ZStack{
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            VStack(spacing: 32){
                NavigationLink(
                    destination: EditProfileView(),
                    label: { SettingsHeaderView(user: user) })
                
                VStack(spacing: 1) {
                    ForEach(SettingsCellViewModel.allCases, id: \.self){ viewModel in
                        SettingsCell(viewModel: viewModel)
                    }
                }
                
                Button(action: {
                    AuthViewModel.shared.signout()
                }
                       , label: {
                    Text("Log Out")
                        .foregroundColor(.red)
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: UIScreen.main.bounds.width, height: 50)
                        .background(Color.white)
                })
                
                Spacer()
            }
        }//: ZSTACK
    }
}



