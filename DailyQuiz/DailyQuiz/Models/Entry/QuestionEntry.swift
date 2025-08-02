//
//  QuestionEntry.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 01.08.2025.
//

import Foundation

struct QuestionEntry: Decodable {
    let type: QuestionType
    let question: String
    let correctAnswer: String
    let incorrectAnswers: [String]

    enum CodingKeys: String, CodingKey {
        case type, question
        case correctAnswer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
    }
}

extension QuestionEntry: RawDecodable {
    typealias Raw = Json
}
