//
//  AnswerEntity.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 01.08.2025.
//

import Foundation

struct AnswerEntity: Identifiable, Hashable {
    let id: UUID
    let text: String
    let isCorrect: Bool

    init(id: UUID = UUID(), text: String, isCorrect: Bool) {
        self.id = id
        self.text = text
        self.isCorrect = isCorrect
    }
}
