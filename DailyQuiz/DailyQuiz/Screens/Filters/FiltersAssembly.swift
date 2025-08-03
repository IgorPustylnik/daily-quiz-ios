//
//  FiltersAssembly.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 03.08.2025.
//

import SwiftUI

final class FiltersAssembly {
    func build(router: Router, namespace: Namespace.ID) -> FiltersView {
        let triviaGenerator = TriviaGeneratorNetworkService()
        let viewModel = FiltersViewModel(router: router, triviaGenerator: triviaGenerator)
        return FiltersView(viewModel: viewModel, namespace: namespace)
    }
}
