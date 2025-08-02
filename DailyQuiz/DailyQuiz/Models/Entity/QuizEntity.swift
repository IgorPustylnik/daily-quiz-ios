//
//  QuizEntity.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 01.08.2025.
//

import Foundation

struct QuizEntity: Hashable {
    let questions: [QuestionEntity]
}

extension QuizEntity: DTODecodable {
    typealias DTO = QuizEntry

    static func from(dto model: DTO) throws -> Self {
        try .init(
            questions: model.results.map { try .from(dto: $0) }
        )
    }
}
