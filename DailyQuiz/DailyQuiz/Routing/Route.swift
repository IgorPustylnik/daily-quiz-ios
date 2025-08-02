//
//  Route.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 01.08.2025.
//

import Foundation

enum Route: Hashable {
    case quiz(QuizEntity)
    case quizResults(QuizResultEntity, isBrief: Bool)
    case history
}
