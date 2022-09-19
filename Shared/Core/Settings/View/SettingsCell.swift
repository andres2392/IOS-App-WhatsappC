//
//  SettingsCell.swift
//  WhatsappC (iOS)
//
//  Created by PDWS on 9/19/22.
//

import SwiftUI

struct SettingsCell: View {
    // MARK: -  PROPERTIES
    let viewModel: SettingsCellViewModel
    
    var body: some View {
        VStack{
            
            HStack{
                // IMAGE
                Image(systemName: viewModel.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 22, height: 22)
                    .padding(6)
                    .background(viewModel.backgroundColor)
                    .foregroundColor(.white)
                    .cornerRadius(6)
                //NAME
                Text(viewModel.title)
                    .font(.system(size: 15))
                
                Spacer()
                //ARROW
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
                
            }//: HSTACK
            .padding([.top, .horizontal])
            
            Divider()
                .padding(.leading)
        }//: VSTACK
        .background(Color.white)
    }
}


