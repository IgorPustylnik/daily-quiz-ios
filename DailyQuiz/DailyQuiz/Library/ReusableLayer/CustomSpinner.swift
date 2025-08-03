//
//  CustomSpinner.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 03.08.2025.
//

import SwiftUI

struct CustomSpinner: View {

    // MARK: - Style

    enum Style {
        case small, medium, big

        var size: CGFloat {
            switch self {
            case .small: return 20
            case .medium: return 37
            case .big: return 54
            }
        }

        var capsuleSize: CGSize {
            switch self {
            case .small: return CGSize(width: 2, height: 6)
            case .medium: return CGSize(width: 4, height: 10)
            case .big: return CGSize(width: 6, height: 15)
            }
        }
    }

    // MARK: - Private Properties

    private let style: Style
    private let color: Color
    private let capsuleCount: Int = 8

    @State
    private var isAnimating = false

    // MARK: - Init

    init(style: Style = .medium, color: Color = .white) {
        self.style = style
        self.color = color
    }

    // MARK: - Body

    var body: some View {
        ZStack {
            ForEach(0..<capsuleCount, id: \.self) { index in
                Capsule()
                    .fill(color)
                    .frame(width: style.capsuleSize.width, height: style.capsuleSize.height)
                    .offset(y: -(style.size / 2 - style.capsuleSize.height / 2))
                    .rotationEffect(.degrees(Double(index) / Double(capsuleCount) * 360))
            }
        }
        .frame(width: style.size, height: style.size)
        .rotationEffect(.degrees(isAnimating ? 360 : 0))
        .animation(.linear(duration: 1).repeatForever(autoreverses: false), value: isAnimating)
        .onAppear {
            isAnimating = true
        }
    }
}
