//
//  QuizEntry.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 01.08.2025.
//

import Foundation

struct QuizEntry: Decodable {
    let responseCode: Int
    let results: [QuestionEntry]

    enum CodingKeys: String, CodingKey {
        case responseCode = "response_code"
        case results
    }
}

extension QuizEntry: RawDecodable {
    typealias Raw = Json
}
