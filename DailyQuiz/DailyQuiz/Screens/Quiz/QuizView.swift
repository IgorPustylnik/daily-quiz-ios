//
//  QuizView.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 01.08.2025.
//

import SwiftUI

struct QuizView: View {

    // MARK: - Constants

    private enum Constants {
        static let verticalPadding: CGFloat = 32
        static let horizontalPadding: CGFloat = 26
        static let spacingBetweenQuestionAndNote: CGFloat = 16
    }

    // MARK: - Properties

    @ObservedObject
    var viewModel: QuizViewModel

    private let feedbackGenerator = UINotificationFeedbackGenerator()

    let namespace: Namespace.ID

    // MARK: - Body

    var body: some View {
        TopBarViewContainer(
            content: {
                content
            },
            mode: .logo(namespace),
            onBack: viewModel.canGoBack ? viewModel.back : nil
        )
        .onAppear {
            viewModel.viewAppeared()
        }
        .customAlert(isPresented: $viewModel.isTimeUpAlertPresented) {
            timeUpAlert
        }
        .onChange(of: viewModel.resultsVisible) { visible in
            guard visible else {
                return
            }
            feedbackGenerator.prepare()
            if viewModel.isCurrentQuestionCorrect {
                feedbackGenerator.notificationOccurred(.success)
            } else {
                feedbackGenerator.notificationOccurred(.error)
            }
        }
    }

    // MARK: - Subviews

    private var content: some View {
        VStack(spacing: Constants.spacingBetweenQuestionAndNote) {
            QuizQuestionSection(viewModel: viewModel)

            Text("Вернуться к предыдущим вопросам нельзя")
                .foregroundStyle(Color.App.white)
                .font(.caption)

            Spacer()
        }
        .padding(.vertical, Constants.verticalPadding)
        .padding(.horizontal, Constants.horizontalPadding)
    }

    private var timeUpAlert: some View {
        InfoAlert(
            title: "Время вышло!",
            subtitle: "Вы не успели завершить викторину. Попробуйте ещё раз!",
            buttonTitle: "Начать заново".uppercased()
        ) {
            viewModel.restart()
        }
    }

}
