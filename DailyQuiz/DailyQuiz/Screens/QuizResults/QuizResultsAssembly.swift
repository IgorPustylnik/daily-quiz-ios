//
//  QuizResultsAssembly.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 02.08.2025.
//

import Foundation

final class QuizResultsAssembly {
    func build(router: Router, quizResult: QuizResultEntity, isBrief: Bool) -> QuizResultsView {
        let viewModel = QuizResultsViewModel(router: router, quizResult: quizResult, isBrief: isBrief)
        return QuizResultsView(viewModel: viewModel)
    }
}
