//
//  QuizQuestionSection.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 03.08.2025.
//

import SwiftUI

struct QuizQuestionSection: View {

    // MARK: - Constants

    private enum Constants {
        static let answerCardSpacing: CGFloat = 24
        static let answersSpacing: CGFloat = 16
    }

    // MARK: - Properties

    @ObservedObject
    var viewModel: QuizViewModel

    // MARK: - Body

    var body: some View {
        LazyVStack(spacing: Constants.answerCardSpacing) {
            TimelineView(.animation) { _ in
                TimerView(
                    currentTime: viewModel.timerInfo.elapsed,
                    totalTime: viewModel.timerInfo.total
                )
            }

            Text(viewModel.questionNumerationDescription)
                .fontWeight(.bold)
                .foregroundStyle(Color.App.lightPurple)

            Text(viewModel.currentQuestion.question)
                .font(.title3)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)

            QuizAnswersSection(viewModel: viewModel)
        }
        .dqContainerStyle()
    }
}
