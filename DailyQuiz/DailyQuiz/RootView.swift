//
//  RootView.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 01.08.2025.
//

import SwiftUI

struct RootView: View {

    // MARK: - Properties

    @ObservedObject
    private var router = Router.shared

    // MARK: - Body

    var body: some View {
        ZStack {
            Color.App.purple
                .ignoresSafeArea()

            switch router.path.last {
            case .none:
                HomeAssembly().build(router: router)
            case .quiz(let quiz):
            }
        }
        .environment(\.colorScheme, .light)
    }
}

#Preview {
    RootView()
}
