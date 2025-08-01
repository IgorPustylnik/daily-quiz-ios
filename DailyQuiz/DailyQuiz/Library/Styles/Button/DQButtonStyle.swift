//
//  DQButtonStyle.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 01.08.2025.
//

import SwiftUI

struct DQButtonStyle: ButtonStyle {

    // MARK: - Constants

    private enum Constants {
        static let cornerRadius: CGFloat = 16
        static let padding: CGFloat = 16
        static let pressedOpacity: CGFloat = 0.7
    }

    // MARK: - Private Properties

    @Environment(\.isEnabled)
    private var isEnabled

    private var type: ButtonType

    // MARK: - Button Type

    enum ButtonType {
        case accent
        case white

        var color: Color {
            switch self {
            case .accent:
                return  .App.purple
            case .white:
                return .App.white
            }
        }
    }

    // MARK: - Init

    init(_ type: ButtonType) {
        self.type = type
    }

    // MARK: - Make Body

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(Constants.padding)
            .frame(maxWidth: .infinity)
            .background(backgroundColor(isPressed: configuration.isPressed))
            .foregroundStyle(foregroundColor())
            .font(.body.weight(.black))
            .clipShape(.rect(cornerRadius: Constants.cornerRadius))
    }

    // MARK: - Private Methods

    private func backgroundColor(isPressed: Bool) -> Color {
        if !isEnabled {
            return .App.gray
        } else if isPressed {
            return type.color.opacity(Constants.pressedOpacity)
        } else {
            return type.color
        }
    }

    private func foregroundColor() -> Color {
        switch type {
        case .accent:
            return .App.white
        case .white:
            return .App.darkPurple
        }
    }
}
