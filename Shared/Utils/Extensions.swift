//
//  Extensions.swift
//  WhatsappC (iOS)
//
//  Created by PDWS on 9/19/22.
//

import UIKit

extension UIApplication{
    func endEditing(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
