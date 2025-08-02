//
//  ResultCardView.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 02.08.2025.
//

import SwiftUI

struct ResultCardView: View {

    // MARK: - Constants

    private enum Constants {
        static let verticalSpacing: CGFloat = 12
        static let horizontalSpacing: CGFloat = 12
        static let starSize: CGFloat = 16
        static let starSpacing: CGFloat = 8
        static let quizInfoSpacing: CGFloat = 4
    }

    // MARK: - Properties

    var quizResult: QuizResultEntity

    // MARK: - Body

    var body: some View {
        VStack(spacing: Constants.verticalSpacing) {
            header
            dateRow
            quizInfo
        }
        .dqContainerStyle()
    }

    // MARK: - Subviews

    private var header: some View {
        HStack(alignment: .top, spacing: Constants.horizontalSpacing) {
            Text(quizResult.originalQuiz.name)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.App.darkPurple)
                .frame(maxWidth: .infinity, alignment: .leading)

            HStack(spacing: Constants.starSpacing) {
                ForEach(0..<Score.maxScore.rawValue, id: \.self) { index in
                    Image(.star)
                        .resizable()
                        .frame(width: Constants.starSize, height: Constants.starSize)
                        .foregroundStyle(
                            index < quizResult.score.rawValue ? Color.App.yellow : Color.App.gray
                        )
                }
            }
        }
    }

    private var dateRow: some View {
        HStack {
            Text(quizResult.completedAt.formatted(.dateTime.day().month(.wide)))
            Spacer()
            Text(quizResult.completedAt.formatted(.dateTime.hour().minute()))
        }
        .font(.footnote)
    }

    private var quizInfo: some View {
        VStack(spacing: Constants.quizInfoSpacing) {
            Text("Категория: \(quizResult.originalQuiz.category)")
            Text("Сложность: \(quizResult.originalQuiz.difficulty)")
        }
    }
}
