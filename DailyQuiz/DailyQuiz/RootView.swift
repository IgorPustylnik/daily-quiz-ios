//
//  RootView.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 01.08.2025.
//

import SwiftUI

struct RootView: View {
    @ObservedObject
    private var router = Router.shared

    var body: some View {
        ZStack {
            Color.App.purple
                .ignoresSafeArea()
            
            switch router.path.last {
            case .home:
                HomeAssembly().build(router: router)
            case .none:
                EmptyView()
            }
        }
    }
}

#Preview {
    RootView()
}
