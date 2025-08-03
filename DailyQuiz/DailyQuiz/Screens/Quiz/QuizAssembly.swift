//
//  QuizAssembly.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 01.08.2025.
//

import SwiftUI

final class QuizAssembly {
    func build(
        router: Router,
        quiz: QuizEntity,
        persistentStorage: PersistentStorage,
        namespace: Namespace.ID
    ) -> QuizView {
        let viewModel = QuizViewModel(router: router, quiz: quiz, persistentStorage: persistentStorage)
        return QuizView(viewModel: viewModel, namespace: namespace)
    }
}
