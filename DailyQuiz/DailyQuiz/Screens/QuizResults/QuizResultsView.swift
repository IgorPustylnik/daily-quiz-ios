//
//  QuizResultsView.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 02.08.2025.
//

import SwiftUI

struct QuizResultsView: View {

    // MARK: - Constants

    private enum Constants {
        static let sectionSpacing: CGFloat = 36
        static let verticalPadding: CGFloat = 32
        static let horizontalPadding: CGFloat = 26

        static let titleSpacing: CGFloat = 40

        static let retryButtonYOffset: CGFloat = 64
        static let starsToMessageSpacing: CGFloat = 24
        static let resultTextSpacing: CGFloat = 12
        static let starsToTitleSpaciYng: CGFloat = 24

        static let answerListSpacing: CGFloat = 24
        static let answerCardSpacing: CGFloat = 24
        static let answerCardHeaderSpacing: CGFloat = 20

        static let sectionRetryButtonHorizontalPadding: CGFloat = 24
    }

    // MARK: - Properties

    @ObservedObject var viewModel: QuizResultsViewModel

    // MARK: - Body

    var body: some View {
        ScrollView {
            LazyVStack(spacing: Constants.sectionSpacing) {
                resultsSection
                if !viewModel.isBrief {
                    answersSection
                    retryButton(style: .white)
                        .padding(.horizontal, Constants.sectionRetryButtonHorizontalPadding)
                }
            }
            .padding(.vertical, Constants.verticalPadding)
            .padding(.horizontal, Constants.horizontalPadding)
        }
        .scrollIndicators(.hidden)
    }

    // MARK: - Sections

    private var resultsSection: some View {
        VStack(spacing: Constants.titleSpacing) {
            VStack(spacing: 16) {
                Text("Результаты")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundStyle(.white)

                VStack(spacing: 4) {
                    Text("Категория: \(viewModel.quizResult.originalQuiz.category.rawValue)")
                    Text("Сложность: \(viewModel.quizResult.originalQuiz.difficulty.rawValue)")
                }
                .foregroundStyle(.white)
            }

            VStack(spacing: Constants.retryButtonYOffset) {
                VStack(spacing: Constants.starsToMessageSpacing) {
                    starsView
                    resultsText
                }
                if viewModel.isBrief {
                    retryButton(style: .accent)
                }
            }
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity)
            .dqContainerStyle()
        }
    }

    private var resultsText: some View {
        VStack(spacing: Constants.resultTextSpacing) {
            Text(viewModel.quizResult.score.title)
                .font(.title)
                .fontWeight(.bold)
            Text(viewModel.quizResult.score.subtitle)
        }
    }

    private var starsView: some View {
        VStack(spacing: Constants.starsToTitleSpaciYng) {
            HStack {
                ForEach(0..<Score.maxScore.rawValue, id: \.self) { index in
                    Image(.star)
                        .foregroundStyle(
                            index < viewModel.quizResult.score.rawValue ? Color.App.yellow : Color.App.gray
                        )
                }
            }

            Text("\(viewModel.quizResult.score.rawValue) из \(Score.maxScore.rawValue)")
                .foregroundStyle(Color.App.yellow)
                .fontWeight(.bold)
        }
    }

    private var answersSection: some View {
        VStack(spacing: Constants.titleSpacing) {
            Text("Твои ответы")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundStyle(.white)

            LazyVStack(spacing: Constants.answerListSpacing) {
                ForEach(
                    Array(viewModel.quizResult.originalQuiz.questions.enumerated()
                         ),
                    id: \.element.id
                ) { index, question in
                    answerCard(for: question, index: index)
                }
            }
        }
    }

    private func answerCard(for question: QuestionEntity, index: Int) -> some View {
        VStack(spacing: Constants.answerCardSpacing) {
            VStack(spacing: Constants.answerCardHeaderSpacing) {
                HStack {
                    Text("Вопрос \(index + 1) из \(viewModel.quizResult.questionCount)")
                        .fontWeight(.bold)
                        .foregroundStyle(Color.App.gray)
                    Spacer()
                    RadioView(status: viewModel.questionStatus(question))
                }
                Text(question.question)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }

            ForEach(question.answers) { answer in
                AnswerView(status: viewModel.answerStatus(answer), text: answer.text)
            }
        }
        .dqContainerStyle()
    }

    private func retryButton(style: DQButtonStyle.ButtonType) -> some View {
        Button(action: {
            viewModel.restart()
        }, label: {
            Text("Начать заново".uppercased())
        })
        .buttonStyle(DQButtonStyle(style))
    }
}
