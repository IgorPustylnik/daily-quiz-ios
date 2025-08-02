//
//  DatabaseService.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 02.08.2025.
//

import Foundation

protocol PersistentStorage {
    func getAllQuizResults() -> [QuizResultEntity]
    func saveQuizResult(_ quiz: QuizResultEntity)
    func deleteQuizResults(_ quizzes: [QuizResultEntity])
}
