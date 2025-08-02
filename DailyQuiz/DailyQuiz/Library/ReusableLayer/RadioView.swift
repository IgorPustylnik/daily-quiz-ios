//
//  RadioView.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 01.08.2025.
//

import SwiftUI

struct RadioView: View {

    // MARK: - Properties

    var status: RadioStatus

    // MARK: - Private Properties

    @ScaledMetric
    private var size: CGFloat = 20
    @ScaledMetric
    private var imageSize: CGFloat = 9

    private var borderColor: Color {
        switch status {
        case .unselected:
            return .black
        default:
            return .clear
        }
    }

    private var image: Image? {
        let image: Image?
        switch status {
        case .unselected:
            image = nil
        case .selected:
            image = Image(.checkmark)
        case .correct:
            image = Image(.checkmark)
        case .wrong:
            image = Image(.xmark)
        }

        return image
    }

    var body: some View {
        ZStack {
            Circle()
                .strokeBorder(borderColor, lineWidth: 1)
                .background(
                    Circle()
                        .fill(status.color)
                )
                .frame(width: size, height: size)
            image?
                .resizable()
                .foregroundStyle(.white)
                .frame(width: imageSize, height: imageSize)
        }
    }
}
