//
//  HistoryViewModel.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 02.08.2025.
//

import Foundation

final class HistoryViewModel: ObservableObject {

    // MARK: - Private Properties

    private let router: Router
    private let persistentStorage: PersistentStorage

    // MARK: - Public Properties

    @Published
    private(set) var results: [QuizResultEntity] = []

    @Published
    var isDeletionAlertPresented: Bool = false

    // MARK: - Init

    init(router: Router, persistentStorage: PersistentStorage) {
        self.router = router
        self.persistentStorage = persistentStorage
    }

    // MARK: - Public Methods

    func fetchResults() {
        results = persistentStorage.getAllQuizResults()
    }

    func openResult(_ quiz: QuizResultEntity) {
        router.showQuizResults(quiz, isShownAfterTaking: false)
    }

    func deleteResult(_ quiz: QuizResultEntity) {
        results.removeAll { $0 == quiz }
        persistentStorage.deleteQuizResults([quiz])
        isDeletionAlertPresented = true
    }

    func showHome() {
        router.backToRoot()
    }

    func back() {
        router.back()
    }

}
