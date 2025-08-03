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
        static let sectionHeaderSpacing: CGFloat = 40
        static let retryButtonYOffset: CGFloat = 64
        static let answerListSpacing: CGFloat = 24
        static let resultsHeaderSpacing: CGFloat = 16
        static let resultsHeaderInfoSpacing: CGFloat = 4
        static let sectionRetryButtonHorizontalPadding: CGFloat = 24
    }

    // MARK: - Properties

    @ObservedObject
    var viewModel: QuizResultsViewModel

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
        VStack(spacing: Constants.sectionHeaderSpacing) {
            resultsHeader

            VStack(spacing: Constants.retryButtonYOffset) {
                ResultsScoreView(score: viewModel.quizResult.score)
                if viewModel.isBrief {
                    retryButton(style: .accent)
                }
            }
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity)
            .dqContainerStyle()
        }
    }

    private var resultsHeader: some View {
        VStack(spacing: Constants.resultsHeaderSpacing) {
            resultsHeaderTitle
            VStack(spacing: Constants.resultsHeaderInfoSpacing) {
                Text("Категория: \(viewModel.quizResult.originalQuiz.category.displayString)")
                Text("Сложность: \(viewModel.quizResult.originalQuiz.difficulty.displayString)")
            }
            .foregroundStyle(.white)
        }

    }

    private var resultsHeaderTitle: some View {
        ZStack {
            if !viewModel.isBrief {
                HStack {
                    Button {
                        viewModel.back()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.white)
                    }
                    Spacer()
                }
            }
            SectionTitleView("Результаты")
        }

    }

    private var answersSection: some View {
        VStack(spacing: Constants.sectionHeaderSpacing) {
            SectionTitleView("Твои ответы")

            LazyVStack(spacing: Constants.answerListSpacing) {
                ForEach(
                    Array(viewModel.quizResult.originalQuiz.questions.enumerated()),
                    id: \.element.id
                ) { index, question in
                    AnswerCardView(
                        question: question,
                        index: index,
                        questionCount: viewModel.quizResult.questionCount,
                        questionStatus: viewModel.questionStatus(question),
                        answerStatusProvider: viewModel.answerStatus
                    )
                }
            }
        }
    }

    // MARK: - Private Methods

    private func retryButton(style: DQButtonStyle.ButtonType) -> some View {
        Button(action: {
            viewModel.restart()
        }, label: {
            Text("Начать заново".uppercased())
        })
        .buttonStyle(DQButtonStyle(style))
    }
}
