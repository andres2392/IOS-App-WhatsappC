//
//  ChatBubble.swift
//  WhatsappC (iOS)
//
//  Created by PDWS on 9/19/22.
//

import SwiftUI

struct ChatBubble: Shape  {
    // MARK: - PROPERTIES
    var isFromCurrentUser: Bool

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: [.topLeft, .topRight, isFromCurrentUser ? .bottomLeft: .bottomRight],
                                cornerRadii: CGSize(width: 16, height: 16))

        return Path(path.cgPath)
    }
}


