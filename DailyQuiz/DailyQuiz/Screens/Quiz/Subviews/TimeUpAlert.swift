//
//  TimeUpAlert.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 03.08.2025.
//

import SwiftUI

struct InfoAlert: View {

    // MARK: - Constants

    private enum Constants {
        static let spacing: CGFloat = 40
        static let textSpacing: CGFloat = 12
        static let horizontalPadding: CGFloat = 26
    }

    // MARK: - Properties

    let title: String
    let subtitle: String?
    let buttonTitle: String
    let onAction: () -> Void

    // MARK: - Body

    var body: some View {
        VStack(spacing: Constants.spacing) {
            VStack(spacing: Constants.textSpacing) {
                Text(title)
                    .font(.title)
                    .fontWeight(.bold)

                if let subtitle {
                    Text(subtitle)
                        .multilineTextAlignment(.center)
                }
            }

            Button(action: onAction) {
                Text(buttonTitle)
            }
            .buttonStyle(DQButtonStyle(.accent))
        }
        .dqContainerStyle()
        .padding(.horizontal, Constants.horizontalPadding)
    }
}
