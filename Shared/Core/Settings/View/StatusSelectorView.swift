//
//  StatusSelectorView.swift
//  WhatsappC (iOS)
//
//  Created by PDWS on 9/19/22.
//

import SwiftUI

struct StatusSelectorView: View {
    // MARK: -  PROPERTIES
    @ObservedObject var viewModel = StatusViewModel()
    
    // MARK: -  BODY
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading) {
                    Text("CURRENTLY SET TO")
                        .foregroundColor(.gray)
                        .padding()
                    
                    StatusCell(status: viewModel.status)

                    Text("SELECT YOUR STATUS")
                        .foregroundColor(.gray)
                        .padding()
                    
                    // for loop with options
                                        
                    ForEach(UserStatus.allCases.filter({ $0 != .notConfigured }),
                            id: \.self) { status in
                        Button(action: {
                            viewModel.updateStatus(status)
                        }, label: {
                            StatusCell(status: status)
                        })
                    }//: LOOP
                }//: VSTACK
            }//: SCROLL
        }//: ZSTACK
    }
}
// MARK: -  PREVIEW
struct StatusSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        StatusSelectorView()
    }
}

// MARK: -  STATUS CELL
struct StatusCell: View {
    let status: UserStatus
    
    var body: some View {
        HStack {
            Text(status.title)
                .foregroundColor(.black)
            Spacer()
        }
        .frame(height: 56)
        .padding(.horizontal)
        .background(Color.white)
    }
}

