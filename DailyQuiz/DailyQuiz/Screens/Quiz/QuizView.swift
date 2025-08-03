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
        static let logoWidth: CGFloat = 180
    }

    // MARK: - Properties

    @ObservedObject
    var viewModel: QuizViewModel

    private let feedbackGenerator = UINotificationFeedbackGenerator()

    let namespace: Namespace.ID

    // MARK: - Body

    var body: some View {
        ZStack {
            topBar
                .frame(maxHeight: .infinity, alignment: .top)

            VStack(spacing: Constants.spacingBetweenQuestionAndNote) {
                QuizQuestionSection(viewModel: viewModel)

                Text("Вернуться к предыдущим вопросам нельзя")
                    .foregroundStyle(Color.App.white)
                    .font(.caption)
            }
        }
        .padding(.vertical, Constants.verticalPadding)
        .padding(.horizontal, Constants.horizontalPadding)
        .onAppear {
            viewModel.viewAppeared()
        }
        .customAlert(isPresented: $viewModel.isTimeUpAlertShown) {
            TimeUpAlert(onRestart: viewModel.restart)
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

    private var topBar: some View {
        ZStack {
            Button {
                viewModel.back()
            } label: {
                Image(systemName: "chevron.left")
                    .tint(.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .opacity(viewModel.canGoBack ? 1 : 0)

            Image(.logo)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(.white)
                .frame(width: Constants.logoWidth)
                .matchedGeometryEffect(id: "logo", in: namespace)
        }
    }

}
