//
//  ChatViewModel.swift
//  Head Injury Chat Bot
//
//  Created by Scott Whitcomb on 7/16/25.
//

import Foundation

class ChatViewModel: ObservableObject {
    @Published var messages: [ChatMessage] = []
    private let apiKey = ""

    func sendMessage(_ text: String) {
        let userMessage = ChatMessage(text: text, isUser: true)
        messages.append(userMessage)

        Task {
            let response = await fetchGeminiReply(for: text)
            let botMessage = ChatMessage(text: response, isUser: false)
            await MainActor.run {
                messages.append(botMessage)
            }
        }
    }

    private func fetchGeminiReply(for input: String) async -> String {
        guard let url = URL(string: "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=\(apiKey)") else {
            return "❌ Invalid API URL"
        }

        let triagePrompt = """
You are a mini physical therapist. Your user is a new gym user and wants help with their gym activity. Give them advice and feedback. If you need further information ask one or two close-ended follwup questions. Use simplified knowledge for the general public and especially for gym newbies. Try to limit response to one small paragraphs or less and very simple steps to practice the exercise again and prevent injury.
User described: "\(input)"
"""

        let body: [String: Any] = [
            "contents": [
                ["role": "user", "parts": [["text": triagePrompt]]]
            ]
        ]

        do {
            let jsonData = try JSONSerialization.data(withJSONObject: body)
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData

            let (data, _) = try await URLSession.shared.data(for: request)
            let decoded = try JSONDecoder().decode(GeminiUrgencyResponse.self, from: data)

            return decoded.candidates.first?.content.parts.first?.text ?? "🤷 No response."
        } catch {
            return "⚠️ Error: \(error.localizedDescription)"
        }
    }
}
