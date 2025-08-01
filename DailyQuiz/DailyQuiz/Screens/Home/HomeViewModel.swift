//
//  HomeViewModel.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 01.08.2025.
//

import Foundation

final class HomeViewModel: ObservableObject {

    // MARK: - Private Properties

    private let router: Router

    // MARK: - Public Properties

    // MARK: - Init

    init(router: Router) {
        self.router = router
    }

}
