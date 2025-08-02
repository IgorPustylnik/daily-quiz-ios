//
//  HistoryAssembly.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 02.08.2025.
//

import Foundation

final class HistoryAssembly {
    func build(router: Router, persistentStorage: PersistentStorage) -> HistoryView {
        let viewModel = HistoryViewModel(router: router, persistentStorage: persistentStorage)
        return HistoryView(viewModel: viewModel)
    }
}
