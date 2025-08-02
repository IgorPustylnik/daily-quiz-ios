//
//  QuizPreferencesEntity.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 02.08.2025.
//

import Foundation

struct QuizPreferencesEntity {
    let amount: Int
    let category: TriviaCategory?
    let difficulty: TriviaDifficulty?
    let type: QuestionType?

    init(
        amount: Int = 5,
        category: TriviaCategory? = nil,
        difficulty: TriviaDifficulty? = nil,
        type: QuestionType? = nil
    ) {
        self.amount = amount
        self.category = category
        self.difficulty = difficulty
        self.type = type
    }
}
