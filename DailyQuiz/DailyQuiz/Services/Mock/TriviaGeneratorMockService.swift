//
//  TriviaGeneratorMockService.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 02.08.2025.
//

import Foundation

final class TriviaGeneratorMockService: TriviaGeneratorService {

    static let shared = TriviaGeneratorMockService()
    private init() {}

    func generateQuiz() async throws -> QuizEntity {
        return .init(
            name: "Викторина от \(Date.now.formatted(.dateTime))",
            questions: [
                .init(
                    type: .boolean,
                    difficulty: .easy,
                    category: .scienceNature,
                    question: "Правда ли, что у человека больше костей, чем у акулы?",
                    answers: [
                        .init(text: "Да", isCorrect: true),
                        .init(text: "Нет", isCorrect: false)
                    ]
                ),
                .init(
                    type: .multiple,
                    difficulty: .medium,
                    category: .history,
                    question: "Кто из этих личностей НЕ был императором?",
                    answers: [
                        .init(text: "Юлий Цезарь", isCorrect: true),
                        .init(text: "Наполеон Бонапарт", isCorrect: false),
                        .init(text: "Цинь Шихуанди", isCorrect: false),
                        .init(text: "Август", isCorrect: false)
                    ]
                ),
                .init(
                    type: .boolean,
                    difficulty: .easy,
                    category: .scienceComputers,
                    question: "Правда ли, что первые компьютеры занимали целые комнаты?",
                    answers: [
                        .init(text: "Да", isCorrect: true),
                        .init(text: "Нет", isCorrect: false)
                    ]
                ),
                .init(
                    type: .multiple,
                    difficulty: .easy,
                    category: .entertainmentFilm,
                    question: "Какой из этих фильмов снят Кристофером Ноланом?",
                    answers: [
                        .init(text: "Начало", isCorrect: true),
                        .init(text: "Титаник", isCorrect: false),
                        .init(text: "Матрица", isCorrect: false),
                        .init(text: "Форсаж 5", isCorrect: false)
                    ]
                ),
                .init(
                    type: .boolean,
                    difficulty: .easy,
                    category: .animals,
                    question: "Коты чаще левши, чем правши?",
                    answers: [
                        .init(text: "Да", isCorrect: true),
                        .init(text: "Нет", isCorrect: false)
                    ]
                )
            ]
        )
    }
}
