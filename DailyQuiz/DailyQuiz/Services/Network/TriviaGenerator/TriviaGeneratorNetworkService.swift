//
//  TriviaGeneratorNetworkService.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 02.08.2025.
//

import Foundation

final class TriviaGeneratorNetworkService: TriviaGeneratorService {

    private let networkManager: NetworkManager = .shared

    func generateQuiz(preferences: QuizPreferencesEntity) async throws -> QuizEntity {
        let url = try OpenTriviaUrlRoute.fetch(
            amount: preferences.amount,
            category: preferences.category,
            difficulty: preferences.difficulty,
            type: preferences.type
        ).url()

        let response: QuizEntry = try await networkManager.fetch(from: url)
        return try .from(dto: response).configure(preferences: preferences)
    }

}
