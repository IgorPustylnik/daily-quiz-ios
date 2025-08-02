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
            Text("Результаты")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundStyle(.white)

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
            Text(Strings.QuizResults.title(for: viewModel.completedQuiz.score))
                .font(.title)
                .fontWeight(.bold)
            Text(Strings.QuizResults.subtitle(for: viewModel.completedQuiz.score))
        }
    }

    private var starsView: some View {
        VStack(spacing: Constants.starsToTitleSpaciYng) {
            HStack {
                ForEach(0..<viewModel.completedQuiz.questionCount, id: \.self) { index in
                    Image(.star)
                        .renderingMode(.template)
                        .foregroundStyle(index < viewModel.completedQuiz.score ? Color.App.yellow : Color.App.gray)
                }
            }

            Text("\(viewModel.completedQuiz.score) из \(viewModel.completedQuiz.questionCount)")
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
                    Array(viewModel.completedQuiz.originalQuiz.questions.enumerated()
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
                    Text("Вопрос \(index + 1) из \(viewModel.completedQuiz.questionCount)")
                        .fontWeight(.bold)
                        .foregroundStyle(Color.App.gray)
                    Spacer()
                    RadioView(status: viewModel.questionStatus(question))
                }
                Text(question.question)
                    .font(.title3)
                    .fontWeight(.semibold)
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
