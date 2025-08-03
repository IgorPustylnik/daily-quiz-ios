//
//  TimerView.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 02.08.2025.
//

import SwiftUI

struct TimerView: View {

    // MARK: - Constants

    private enum Constants {
        static let verticalSpacing: CGFloat = 8
        static let progressLineHeight: CGFloat = 8
    }

    // MARK: - Properties

    var currentTime: Double
    var totalTime: Double

    // MARK: - Body

    var body: some View {
        VStack(spacing: Constants.verticalSpacing) {
            HStack {
                Text(DateComponentsFormatter.minutesSeconds.string(from: currentTime) ?? "")
                Spacer()
                Text(DateComponentsFormatter.minutesSeconds.string(from: totalTime) ?? "")
            }
            .font(.caption)
            MyProgressView(progress: currentTime / totalTime)
                .tint(Color.App.darkPurple)
                .frame(height: Constants.progressLineHeight)
        }
    }
}
