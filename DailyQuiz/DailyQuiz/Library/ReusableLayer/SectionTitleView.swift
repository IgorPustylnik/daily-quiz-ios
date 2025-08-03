//
//  SectionTitleView.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 03.08.2025.
//

import SwiftUI

struct SectionTitleView: View {
    private let title: String

    init(_ title: String) {
        self.title = title
    }

    var body: some View {
        Text(title)
            .font(.largeTitle)
            .fontWeight(.black)
            .foregroundStyle(.white)
    }
}
