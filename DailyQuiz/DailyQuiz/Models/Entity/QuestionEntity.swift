//
//  QuestionEntity.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 01.08.2025.
//

import Foundation

struct QuestionEntity: Identifiable, Hashable {
    let id: UUID
    let type: QuestionType
    let difficulty: QuestionDifficulty
    let category: QuestionCategory
    let question: String
    let answers: [AnswerEntity]

    init(
        id: UUID = .init(),
        type: QuestionType,
        difficulty: QuestionDifficulty,
        category: QuestionCategory,
        question: String,
        answers: [AnswerEntity]
    ) {
        self.id = id
        self.type = type
        self.difficulty = difficulty
        self.category = category
        self.question = question
        self.answers = answers
    }
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
