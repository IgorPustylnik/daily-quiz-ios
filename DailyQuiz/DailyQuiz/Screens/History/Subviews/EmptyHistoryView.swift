//
//  EmptyHistoryView.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 03.08.2025.
//

import SwiftUI

struct EmptyHistoryView: View {
    private enum Constants {
        static let spacing: CGFloat = 40
    }

    private let action: () -> Void

    init(action: @escaping () -> Void) {
        self.action = action
    }

    var body: some View {
        VStack(spacing: Constants.spacing) {
            Text("Вы ещё не проходили ни одной викторины")
                .font(.title3)
                .multilineTextAlignment(.center)

            Button(action: action) {
                Text("Начать викторину".uppercased())
            }
            .buttonStyle(DQButtonStyle(.accent))
        }
        .dqContainerStyle()
    }
}
