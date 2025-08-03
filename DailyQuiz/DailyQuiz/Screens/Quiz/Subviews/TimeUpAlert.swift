//
//  TimeUpAlert.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 03.08.2025.
//

import SwiftUI

struct TimeUpAlert: View {

    // MARK: - Constants

    private enum Constants {
        static let spacing: CGFloat = 40
        static let textSpacing: CGFloat = 12
        static let horizontalPadding: CGFloat = 26
    }

    // MARK: - Properties

    let onRestart: () -> Void
    private let feedbackGenerator = UINotificationFeedbackGenerator()

    // MARK: - Body

    var body: some View {
        VStack(spacing: Constants.spacing) {
            VStack(spacing: Constants.textSpacing) {
                Text("Время вышло")
                    .font(.title)
                    .fontWeight(.bold)
                Text("Вы не успели завершить викторину. Попробуйте ещё раз!")
            }
            .multilineTextAlignment(.center)

            Button(action: onRestart) {
                Text("Начать заново".uppercased())
            }
            .buttonStyle(DQButtonStyle(.accent))
        }
        .dqContainerStyle()
        .padding(.horizontal, Constants.horizontalPadding)
        .onAppear {
            feedbackGenerator.notificationOccurred(.warning)
        }
    }
}
