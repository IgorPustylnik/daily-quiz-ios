//
//  DatabaseService.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 02.08.2025.
//

import Foundation

protocol PersistentStorage {
    func getAllCompletedQuizzes() -> [CompletedQuizEntity]
    func saveCompletedQuiz(_ quiz: CompletedQuizEntity)
    func deleteCompletedQuizzes(_ quizzes: [CompletedQuizEntity])
}
