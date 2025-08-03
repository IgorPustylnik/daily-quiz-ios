//
//  ResultsScoreView.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 03.08.2025.
//

import SwiftUI

struct ResultsScoreView: View {

    // MARK: - Constants

    private enum Constants {
        static let starsToMessageSpacing: CGFloat = 24
        static let resultTextSpacing: CGFloat = 12
        static let starsViewSpacing: CGFloat = 24
        static let starSize: CGFloat = 52
    }

    // MARK: - Properties

    let score: Score

    // MARK: - Body

    var body: some View {
        VStack(spacing: Constants.starsToMessageSpacing) {
            starsView
            resultsText
        }
    }

    private var starsView: some View {
        VStack(spacing: Constants.starsViewSpacing) {
            StarsRowView(
                score: score.rawValue,
                maxScore: Score.maxScore.rawValue,
                size: Constants.starSize,
                spacing: nil
            )

            Text("\(score.rawValue) из \(Score.maxScore.rawValue)")
                .foregroundStyle(Color.App.yellow)
                .fontWeight(.bold)
        }
    }

    private var resultsText: some View {
        VStack(spacing: Constants.resultTextSpacing) {
            Text(score.title)
                .font(.title)
                .fontWeight(.bold)
            Text(score.subtitle)
        }
    }
}
