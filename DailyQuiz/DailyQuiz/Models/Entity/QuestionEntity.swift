//
//  QuestionEntity.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 01.08.2025.
//

import Foundation

struct QuestionEntity: Identifiable, Hashable {
    let id: UUID = .init()
    let type: QuestionType
    let difficulty: QuestionDifficulty
    let category: QuestionCategory
    let question: String
    let answers: [AnswerEntity]
}

extension QuestionEntity: DTODecodable {
    typealias DTO = QuestionEntry

    static func from(dto model: DTO) throws -> Self {
        var answers: [AnswerEntity] = []
        answers.append(.init(text: model.correctAnswer, isCorrect: true))
        model.incorrectAnswers.forEach { answers.append(.init(text: $0, isCorrect: false)) }
        answers.shuffle()
        return .init(
            type: model.type,
            difficulty: model.difficulty,
            category: model.category,
            question: model.question,
            answers: answers
        )
    }
}
