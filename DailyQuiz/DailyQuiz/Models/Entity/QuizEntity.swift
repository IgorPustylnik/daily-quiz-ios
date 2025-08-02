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
        return try .init(
            name: "Quiz \(Int.random(in: 1..<100))",
            difficulty: .unknown,
            category: .unknown,
            questions: model.results.map { try .from(dto: $0) }
        )
    }

    func configure(preferences: QuizPreferencesEntity) -> Self {
        .init(
            name: name,
            difficulty: preferences.difficulty ?? .unknown,
            category: preferences.category ?? .unknown,
            questions: questions
        )
    }

}
