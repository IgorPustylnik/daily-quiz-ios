//
//  FiltersViewModel.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 03.08.2025.
//

import Foundation

final class FiltersViewModel: ObservableObject {

    // MARK: - Private Properties

    private let router: Router
    private let triviaGenerator: TriviaGeneratorService

    // MARK: - Public Properties

    @Published
    var errorMessage: String?

    @Published
    var isLoading: Bool = false

    @Published
    var filters: QuizPreferencesEntity = .init(category: nil, difficulty: nil)

    // MARK: - Computed Properties

    var isStartable: Bool {
        filters.category != nil && filters.difficulty != nil
    }

    // MARK: - Init

    init(router: Router, triviaGenerator: TriviaGeneratorService) {
        self.router = router
        self.triviaGenerator = triviaGenerator
    }

    // MARK: - Public Methods

    func start() {
        Task { @MainActor in
            isLoading = true
            defer {
                isLoading = false
            }

            do {
                let quiz = try await triviaGenerator.generateQuiz(preferences: filters)
                router.startQuiz(quiz)
            } catch {
                errorMessage = "Ошибка! Попробуйте ещё раз"
            }
        }
    }

    func back() {
        router.back()
    }

}
