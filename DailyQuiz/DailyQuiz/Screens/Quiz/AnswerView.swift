//
//  AnswerView.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 01.08.2025.
//

import SwiftUI

struct AnswerView: View {

    // MARK: - Constants

    private enum Constants {
        static let horizontalSpacing: CGFloat = 16
        static let contentPadding: CGFloat = 16
        static let cornerRadius: CGFloat = 16
        static let borderWidth: CGFloat = 1
    }

    // MARK: - Properties

    let status: RadioStatus
    let text: String

    // MARK: - Computed Properties

    private var backgroundColor: Color {
        status == .unselected ? Color.App.secondaryBackground : .clear
    }

    private var borderColor: Color {
        status != .unselected ? status.color : .clear
    }

    private var foregroundColor: Color {
        status == .unselected ? .black : status.color
    }

    // MARK: - Body

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: Constants.cornerRadius)
                .fill(backgroundColor)

            RoundedRectangle(cornerRadius: Constants.cornerRadius)
                .strokeBorder(borderColor, lineWidth: Constants.borderWidth)

            HStack(spacing: Constants.horizontalSpacing) {
                RadioView(status: status)

                Text(text)
                    .foregroundStyle(foregroundColor)

                Spacer()
            }
            .padding(Constants.contentPadding)
        }
    }

}
