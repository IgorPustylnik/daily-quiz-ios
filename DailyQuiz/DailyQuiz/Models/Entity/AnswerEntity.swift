//
//  AnswerEntity.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 01.08.2025.
//

import Foundation

struct AnswerEntity: Identifiable, Hashable {
    let id: UUID = .init()
    let text: String
    let isCorrect: Bool
}
