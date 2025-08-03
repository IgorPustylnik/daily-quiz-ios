//
//  QuizAnswersSection.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 03.08.2025.
//

import SwiftUI

struct QuizAnswersSection: View {

    // MARK: - Constants

    private enum Constants {
        static let answersSpacing: CGFloat = 16
    }

    // MARK: - Properties

    @ObservedObject
    var viewModel: QuizViewModel

    // MARK: - Body

    var body: some View {
        LazyVStack(spacing: Constants.answersSpacing) {
            ForEach(viewModel.currentQuestion.answers) { answer in
                Button {
                    viewModel.toggleAnswer(answer)
                } label: {
                    AnswerView(
                        status: viewModel.answerStatus(answer: answer),
                        text: answer.text
                    )
                }
                .disabled(viewModel.resultsVisible)
            }

            Button {
                viewModel.submit()
            } label: {
                Text(viewModel.submitButtonText.uppercased())
            }
            .buttonStyle(DQButtonStyle(.accent))
            .disabled(!viewModel.isSubmittable || viewModel.resultsVisible)
        }
    }
}
