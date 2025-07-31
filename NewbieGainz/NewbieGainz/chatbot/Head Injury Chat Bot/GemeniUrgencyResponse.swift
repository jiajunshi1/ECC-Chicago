//
//  GemeniUrgencyResponse.swift
//  Head Injury Chat Bot
//
//  Created by Scott Whitcomb on 7/16/25.
//

import Foundation

struct GeminiUrgencyResponse: Codable {
    struct Candidate: Codable {
        struct Content: Codable {
            struct Part: Codable {
                let text: String
            }
            let parts: [Part]
        }
        let content: Content
    }

    let candidates: [Candidate]
}
