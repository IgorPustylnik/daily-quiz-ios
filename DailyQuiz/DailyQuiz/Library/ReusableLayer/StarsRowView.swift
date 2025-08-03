//
//  StarsRowView.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 03.08.2025.
//

import SwiftUI

struct StarsRowView: View {
    let score: Int
    let maxScore: Int
    let size: CGFloat
    let spacing: CGFloat?

    var body: some View {
        HStack(spacing: spacing) {
            ForEach(0..<maxScore, id: \.self) { index in
                Image(.star)
                    .resizable()
                    .frame(width: size, height: size)
                    .foregroundStyle(
                        index < score ? Color.App.yellow : Color.App.gray
                    )
            }
        }
    }
}
