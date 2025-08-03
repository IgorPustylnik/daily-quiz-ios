//
//  HomeAssembly.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 01.08.2025.
//

import SwiftUI

final class HomeAssembly {
    func build(router: Router, namespace: Namespace.ID) -> HomeView {
        let viewModel = HomeViewModel(router: router)
        return HomeView(viewModel: viewModel, namespace: namespace)
    }
}
