//
//  DQContainerStyle.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 01.08.2025.
//

import SwiftUI

struct DQContainerStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 24)
            .padding(.vertical, 32)
            .background(Color.App.white)
            .clipShape(.rect(cornerRadius: 46))
    }
}

extension View {
    func dqContainerStyle() -> some View {
        modifier(DQContainerStyle())
    }
}
