//
//  CompletedQuizEntity.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 01.08.2025.
//

import Foundation

struct CompletedQuizEntity: Hashable {
    let id: UUID = .init()
    let name: String
    let completedAt: Date
    let originalQuiz: QuizEntity
    let answersSelection: [AnswerEntity: Bool]

    var score: Int {
        originalQuiz.questions.reduce(0) { count, question in
            let isCorrect = question.answers.allSatisfy { answer in
                let isCorrectAndSelected = answer.isCorrect && answersSelection[answer] ?? false
                let isWrongAndUnselected = !answer.isCorrect && !(answersSelection[answer] ?? false)
                return isCorrectAndSelected || isWrongAndUnselected
            }
            return count + (isCorrect ? 1 : 0)
        }
    }

    var questionCount: Int {
        originalQuiz.questions.count
    }
}
