//
//  ChatViewModel.swift
//  iOS_project
//
//  Created by sonjuwan on 6/4/25.
//

import SwiftUI

class ChatViewModel: ObservableObject {
    @Published var messages: [Message] = []

    func sendMessage(_ input: String) {
        // 유저 메시지 추가
        let userMessage = Message(isUser: true, text: input)
        messages.append(userMessage)

        // 간단한 봇 응답 추가
        let botResponse = getBotResponse(to: input)
        let botMessage = Message(isUser: false, text: botResponse)
        messages.append(botMessage)
    }
}
