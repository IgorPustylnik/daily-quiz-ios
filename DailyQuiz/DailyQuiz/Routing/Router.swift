//
//  Router.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 01.08.2025.
//

import Foundation

final class Router: ObservableObject {
    static let shared = Router()

    @Published
    var path: [Route] = []

    func startQuiz(_ quiz: QuizEntity) {
        path.append(.quiz(quiz))
    }

    func backToRoot() {
        path.removeAll()
    }

    func back() {
        path.removeLast()
    }
}
