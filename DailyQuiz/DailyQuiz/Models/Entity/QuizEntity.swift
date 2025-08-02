//
//  QuizEntity.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 01.08.2025.
//

import Foundation

struct QuizEntity: Hashable {
    let name: String
    let difficulty: TriviaDifficulty
    let category: TriviaCategory
    let questions: [QuestionEntity]
}

extension QuizEntity: DTODecodable {
    typealias DTO = QuizEntry

    static func from(dto model: DTO) throws -> Self {
        guard let firstQuestion = model.results.first else {
            throw NSError(domain: "No questions in the quiz", code: 1)
        }
        return try .init(
            name: "Quiz \(Date.now.formatted(.dateTime))",
            difficulty: firstQuestion.difficulty,
            category: firstQuestion.category,
            questions: model.results.map { try .from(dto: $0) }
        )
    }
}
