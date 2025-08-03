//
//  OpenTriviaUrlRoute.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 02.08.2025.
//

import Foundation

enum OpenTriviaUrlRoute {
    case fetch(amount: Int, category: TriviaCategory?, difficulty: TriviaDifficulty?, type: QuestionType?)
}

extension OpenTriviaUrlRoute {
    func url() throws -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "opentdb.com"
        components.path = "/api.php"

        switch self {
        case .fetch(let amount, let category, let difficulty, let type):
            var queryItems: [URLQueryItem] = [
                URLQueryItem(name: "amount", value: String(amount))
            ]

            if let category, category != .any {
                queryItems.append(.init(name: "category", value: String(category.id)))
            }

            if let difficulty, difficulty != .any {
                queryItems.append(.init(name: "difficulty", value: difficulty.rawValue))
            }

            if let type {
                queryItems.append(.init(name: "type", value: type.rawValue))
            }

            components.queryItems = queryItems
        }

        guard let url = components.url else {
            throw URLError(.badURL)
        }

        return url
    }
}
