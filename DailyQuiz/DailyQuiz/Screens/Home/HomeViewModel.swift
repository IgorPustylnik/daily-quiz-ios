//
//  HomeViewModel.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 01.08.2025.
//

import Foundation

final class HomeViewModel: ObservableObject {

    // MARK: - Private Properties

    private let router: Router
    private let triviaGenerator: TriviaGeneratorService

    // MARK: - Public Properties

    @Published
    var errorMessage: String?

    @Published
    var isLoading: Bool = false

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
                let quiz = try await triviaGenerator.generateQuiz()
                router.startQuiz(quiz)
            } catch {
                errorMessage = "Ошибка! Попробуйте ещё раз"
            }
        }
    }

}
