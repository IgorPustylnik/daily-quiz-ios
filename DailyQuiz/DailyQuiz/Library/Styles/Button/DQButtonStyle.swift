//
//  DQButtonStyle.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 01.08.2025.
//

import SwiftUI

struct DQButtonStyle: ButtonStyle {

    // MARK: - Private Properties

    @Environment(\.isEnabled)
    private var isEnabled

    private var type: ButtonType

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

    init(_ type: ButtonType) {
        self.type = type
    }

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(16)
            .frame(maxWidth: .infinity)
            .background(backgroundColor(isPressed: configuration.isPressed))
            .foregroundStyle(foregroundColor())
            .font(.body.weight(.black))
            .clipShape(.rect(cornerRadius: 16))
    }

    private func backgroundColor(isPressed: Bool) -> Color {
        if !isEnabled {
            return .App.gray
        } else if isPressed {
            return type.color.opacity(0.7)
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
