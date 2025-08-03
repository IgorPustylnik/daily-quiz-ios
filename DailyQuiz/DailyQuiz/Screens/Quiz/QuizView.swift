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

        static let answerCardSpacing: CGFloat = 24
        static let answersSpacing: CGFloat = 16

        static let logoWidth: CGFloat = 180

        static let alertSpacing: CGFloat = 40
        static let alertTextSpacing: CGFloat = 12
    }

    // MARK: - Properties

    @ObservedObject
    var viewModel: QuizViewModel

    let namespace: Namespace.ID

    // MARK: - Body

    var body: some View {
        ZStack {
            topBar
                .frame(maxHeight: .infinity, alignment: .top)

            VStack(spacing: Constants.spacingBetweenQuestionAndNote) {
                questionSection

                Text("Вернуться к предыдущим вопросам нельзя")
                    .foregroundStyle(Color.App.white)
                    .font(.caption)
            }
            .padding(.vertical, Constants.verticalPadding)
        }
        .padding(.horizontal, Constants.horizontalPadding)
        .onAppear {
            viewModel.viewAppeared()
        }
        .customAlert(isPresented: $viewModel.isTimeUpAlertShown) {
            alertView
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

    private var questionSection: some View {
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
                }

                Button {
                    viewModel.submit()
                } label: {
                    Text(viewModel.submitButtonText.uppercased())
                }
                .buttonStyle(DQButtonStyle(.accent))
                .disabled(!viewModel.isSubmittable)
            }
        }
        .dqContainerStyle()
    }

    private var alertView: some View {
        VStack(spacing: Constants.alertSpacing) {
            VStack(spacing: Constants.alertTextSpacing) {
                Text("Время вышло")
                    .font(.title)
                    .fontWeight(.bold)
                Text("Вы не успели завершить викторину. Попробуйте ещё раз!")
            }
            .multilineTextAlignment(.center)

            Button(action: {
                viewModel.back()
            }, label: {
                Text("Начать заново".uppercased())
            })
            .buttonStyle(DQButtonStyle(.accent))
        }
        .dqContainerStyle()
        .padding(.horizontal, Constants.horizontalPadding)
    }
}
