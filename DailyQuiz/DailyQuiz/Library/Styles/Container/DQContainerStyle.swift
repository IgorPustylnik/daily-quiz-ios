//
//  DQContainerStyle.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 01.08.2025.
//

import SwiftUI

struct DQContainerStyle: ViewModifier {

    // MARK: - Constants

    private enum Constants {
        static let hPadding: CGFloat = 24
        static let vPadding: CGFloat = 32
        static let cornerRadius: CGFloat = 46
    }

    // MARK: - Body

    func body(content: Content) -> some View {
        content
            .padding(.horizontal, Constants.hPadding)
            .padding(.vertical, Constants.vPadding)
            .background(Color.App.white)
            .clipShape(.rect(cornerRadius: Constants.cornerRadius))
    }
}

extension View {
    func dqContainerStyle() -> some View {
        modifier(DQContainerStyle())
    }
}
