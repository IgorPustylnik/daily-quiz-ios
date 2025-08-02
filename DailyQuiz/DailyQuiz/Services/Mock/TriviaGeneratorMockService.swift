//
//  TriviaGeneratorMockService.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 02.08.2025.
//

import Foundation

final class TriviaGeneratorMockService: TriviaGeneratorService {
    
    // MARK: - Singleton

    static let shared = TriviaGeneratorMockService()

    private init() {}

    // MARK: - Public Methods

    func generateQuiz() async throws -> QuizEntity {
        try? await Task.sleep(nanoseconds: 1_000_000_000)

        return .init(
            questions: [
                .init(
                    type: .boolean,
                    difficulty: .easy,
                    category: .animals,
                    question: "Q 1",
                    answers: [
                        .init(text: "True", isCorrect: true),
                        .init(text: "False", isCorrect: false),
                    ]
                ),
                .init(
                    type: .multiple,
                    difficulty: .easy,
                    category: .animals,
                    question: "Q 2",
                    answers: [
                        .init(text: "??? 1", isCorrect: true),
                        .init(text: "??? 2", isCorrect: false),
                        .init(text: "??? 3", isCorrect: false)
                    ]
                ),
                .init(
                    type: .boolean,
                    difficulty: .easy,
                    category: .animals,
                    question: "Q 3",
                    answers: [
                        .init(text: "True", isCorrect: true),
                        .init(text: "False", isCorrect: false)
                    ]
                ),
                .init(
                    type: .boolean,
                    difficulty: .easy,
                    category: .animals,
                    question: "Q 4",
                    answers: [
                        .init(text: "True", isCorrect: true),
                        .init(text: "False", isCorrect: false)
                    ]
                ),
                .init(
                    type: .boolean,
                    difficulty: .easy,
                    category: .animals,
                    question: "Q 5",
                    answers: [
                        .init(text: "True", isCorrect: true),
                        .init(text: "False", isCorrect: false)
                    ]
                )
            ]
        )
    }
}
