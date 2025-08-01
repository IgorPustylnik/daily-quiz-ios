//
//  HomeAssembly.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 01.08.2025.
//

import Foundation

final class HomeAssembly {
    func build(router: Router) -> HomeView {
        let viewModel = HomeViewModel(router: router)
        return HomeView(viewModel: viewModel)
    }
}
