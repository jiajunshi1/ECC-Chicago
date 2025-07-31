//
//  ChatMessage.swift
//  Head Injury Chat Bot
//
//  Created by Scott Whitcomb on 7/16/25.
//

import Foundation

struct ChatMessage: Identifiable {
    let id = UUID()
    let text: String
    let isUser: Bool
}
