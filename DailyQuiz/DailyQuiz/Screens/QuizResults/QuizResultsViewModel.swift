//
//  QuizResultsViewModel.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 02.08.2025.
//

import Foundation

final class QuizResultsViewModel: ObservableObject {

    // MARK: - Private Properties

    private let router: Router

    // MARK: - Public Properties

    let completedQuiz: CompletedQuizEntity
    let isBrief: Bool

    // MARK: - Init

    init(router: Router, completedQuiz: CompletedQuizEntity, isBrief: Bool) {
        self.router = router
        self.completedQuiz = completedQuiz
        self.isBrief = isBrief
    }

    // MARK: - Public Methods

    func questionStatus(_ question: QuestionEntity) -> RadioStatus {
        let correctAnswers = question.answers.filter { $0.isCorrect }
        let selectedAnswers = question.answers.filter { completedQuiz.answersSelection[$0] == true }

        let allCorrectSelected = Set(correctAnswers) == Set(selectedAnswers)
        let hasWrongSelected = selectedAnswers.contains { !$0.isCorrect }

        return (allCorrectSelected && !hasWrongSelected) ? .correct : .wrong
    }

    func answerStatus(_ answer: AnswerEntity) -> RadioStatus {
        let isSelected: Bool = completedQuiz.answersSelection[answer] ?? false
        switch (isSelected, answer.isCorrect) {
        case (true, true): return .correct
        case (true, false): return .wrong
        case (false, _): return .unselected
        }
    }

    func restart() {
        router.backToRoot()
    }

}
