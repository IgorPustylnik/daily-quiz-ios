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
                QuizAssembly().build(router: router, quiz: quiz, namespace: transitionNamespace)
            }
        }
        .animation(.spring(), value: router.path)
        .environment(\.colorScheme, .light)
    }
}

#Preview {
    RootView()
}
