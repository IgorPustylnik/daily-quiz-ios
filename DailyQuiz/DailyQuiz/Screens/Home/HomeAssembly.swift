//
//  HomeAssembly.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 01.08.2025.
//

import Foundation

final class HomeAssembly {
    func build(router: Router) -> HomeView {
        let triviaGenerator = TriviaGeneratorMockService.shared
        let viewModel = HomeViewModel(router: router, triviaGenerator: triviaGenerator)
        return HomeView(viewModel: viewModel)
    }
}
