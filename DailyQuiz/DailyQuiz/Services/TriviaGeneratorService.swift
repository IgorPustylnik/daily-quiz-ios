//
//  TriviaGeneratorService.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 02.08.2025.
//

import Foundation

protocol TriviaGeneratorService {
    func generateQuiz() async throws -> QuizEntity
}
