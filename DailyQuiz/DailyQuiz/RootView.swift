//
//  RootView.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 01.08.2025.
//

import SwiftUI

struct RootView: View {

    // MARK: - Properties

    @ObservedObject
    private var router = Router.shared

    private let persistentStorage: PersistentStorage = CoreDataService.shared
    private let triviaGenerator: TriviaGeneratorService = TriviaGeneratorNetworkService()

    @Namespace
    private var transitionNamespace

    // MARK: - Body

    var body: some View {
        ZStack {
            Color.App.purple
                .ignoresSafeArea()

            switch router.path.last {
            case .none:
                HomeAssembly().build(router: router, namespace: transitionNamespace)
            case .quiz(let quiz):
                QuizAssembly().build(
                    router: router,
                    quiz: quiz,
                    persistentStorage: persistentStorage,
                    namespace: transitionNamespace
                )
            case .quizResults(let quizResult, let isBrief):
                QuizResultsAssembly().build(router: router, quizResult: quizResult, isBrief: isBrief)
            case .history:
                HistoryAssembly().build(router: router, persistentStorage: persistentStorage)
            case .filters:
                FiltersAssembly().build(
                    router: router,
                    namespace: transitionNamespace,
                    triviaGenerator: triviaGenerator
                )
            }
        }
        .animation(.spring(), value: router.path)
        .environment(\.colorScheme, .light)
    }
}

#Preview {
    RootView()
}
