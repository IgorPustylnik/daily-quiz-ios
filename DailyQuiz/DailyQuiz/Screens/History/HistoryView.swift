//
//  HistoryView.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 02.08.2025.
//

import SwiftUI

struct HistoryView: View {

    // MARK: - Constants

    private enum Constants {
        static let verticalPadding: CGFloat = 32
        static let horizontalPadding: CGFloat = 26
        static let mainSpacing: CGFloat = 40
        static let resultsSpacing: CGFloat = 24
    }

    // MARK: - Properties

    @ObservedObject
    var viewModel: HistoryViewModel

    // MARK: - Body

    var body: some View {
        ScrollView {
            VStack(spacing: Constants.mainSpacing) {
                SectionTitleView("История")
                if viewModel.results.isEmpty {
                    EmptyHistoryView(action: viewModel.showHome)
                } else {
                    resultsList
                }
            }
            .padding(.vertical, Constants.verticalPadding)
            .padding(.horizontal, Constants.horizontalPadding)
        }
        .scrollIndicators(.hidden)
        .onAppear {
            viewModel.fetchResults()
        }
    }

    // MARK: - Subviews

    private var resultsList: some View {
        LazyVStack(spacing: Constants.resultsSpacing) {
            ForEach(viewModel.results) { result in
                ResultCard(quizResult: result)
                    .onTapGesture {
                        viewModel.openResult(result)
                    }
                    .contextMenu {
                        Button(role: .destructive) {
                            viewModel.deleteResult(result)
                        } label: {
                            Label(
                                title: { Text("Удалить") },
                                icon: { Image(.trash) }
                            )
                        }
                    }
            }
        }
    }
}

// MARK: - Supporting Views

struct ResultCard: View {
    private enum Constants {
        static let verticalSpacing: CGFloat = 12
        static let horizontalSpacing: CGFloat = 12
        static let starSize: CGFloat = 16
        static let starSpacing: CGFloat = 8
        static let quizInfoSpacing: CGFloat = 4
    }

    private let quizResult: QuizResultEntity

    init(quizResult: QuizResultEntity) {
        self.quizResult = quizResult
    }

    var body: some View {
        VStack(spacing: Constants.verticalSpacing) {
            header
            DateRow(date: quizResult.completedAt)
            QuizInfo(
                category: quizResult.originalQuiz.category.displayString,
                difficulty: quizResult.originalQuiz.difficulty.displayString
            )
        }
        .dqContainerStyle()
    }

    private var header: some View {
        HStack(alignment: .top, spacing: Constants.horizontalSpacing) {
            Text(quizResult.originalQuiz.name)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.App.darkPurple)
                .frame(maxWidth: .infinity, alignment: .leading)

            StarsRowView(
                score: quizResult.score.rawValue,
                maxScore: Score.maxScore.rawValue,
                size: Constants.starSize,
                spacing: Constants.starSpacing
            )
        }
    }
}

struct DateRow: View {
    private let date: Date

    init(date: Date) {
        self.date = date
    }

    var body: some View {
        HStack {
            Text(date.formatted(.dateTime.day().month(.wide)))
            Spacer()
            Text(date.formatted(.dateTime.hour().minute()))
        }
        .font(.footnote)
    }
}

struct QuizInfo: View {
    private enum Constants {
        static let spacing: CGFloat = 4
    }

    private let category: String
    private let difficulty: String

    init(category: String, difficulty: String) {
        self.category = category
        self.difficulty = difficulty
    }

    var body: some View {
        VStack(spacing: Constants.spacing) {
            Text("Категория: \(category)")
            Text("Сложность: \(difficulty)")
        }
    }
}
