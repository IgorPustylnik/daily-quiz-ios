//
//  QuizPreferencesEntity.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 02.08.2025.
//

import Foundation

struct QuizPreferencesEntity {
    var amount: Int
    var category: TriviaCategory?
    var difficulty: TriviaDifficulty?
    var type: QuestionType?

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
