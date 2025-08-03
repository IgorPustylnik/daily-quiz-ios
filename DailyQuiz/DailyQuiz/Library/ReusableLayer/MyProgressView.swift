//
//  MyProgressView.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 03.08.2025.
//

import SwiftUI

struct MyProgressView: View {

    var progress: Double

    private var normalizedProgress: Double {
        min(max(progress.isFinite ? progress : 0, 0), 1)
    }

    var body: some View {
        GeometryReader { geometry in
            Capsule()
                .fill(Color.App.secondaryBackground)
                .frame(
                    width: geometry.size.width,
                    height: geometry.size.height
                )
            Capsule()
                .fill(.tint)
                .frame(
                    width: normalizedProgress * geometry.size.width,
                    height: geometry.size.height,
                    alignment: .leading
                )
        }
        .mask(Capsule())
    }
}
