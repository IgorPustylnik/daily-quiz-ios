//
//  QuizViewModel.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 01.08.2025.
//

import Foundation

final class QuizViewModel: ObservableObject {

    // MARK: - Private Properties

    private let router: Router
    private let persistentStorage: PersistentStorage

    @Published
    private var currentQuestionIndex: Int = 0

    // MARK: - Public Properties

    let quiz: QuizEntity

    @Published
    private(set) var resultsVisible: Bool = false

    @Published
    private(set) var answersSelection: [AnswerEntity: Bool] = [:]

    // MARK: - Computed Properties

    var currentQuestion: QuestionEntity {
        quiz.questions[currentQuestionIndex]
    }

    var questionNumerationDescription: String {
        "Вопрос \(currentQuestionIndex + 1) из \(quiz.questions.count)"
    }

    var submitButtonText: String {
        currentQuestionIndex < quiz.questions.count - 1 ? "Далее" : "Завершить"
    }

    var isSubmittable: Bool {
        answersSelection.contains { (answer, isSelected) in
            isSelected && currentQuestion.answers.contains(answer)
        }
    }

    var canGoBack: Bool {
        currentQuestionIndex == 0
    }

    // MARK: - Init

    init(router: Router, quiz: QuizEntity, persistentStorage: PersistentStorage) {
        self.router = router
        self.quiz = quiz
        self.persistentStorage = persistentStorage
    }

    // MARK: - Public Methods

    func cancel() {
        router.back()
    }

    func toggleAnswer(_ answer: AnswerEntity) {
        let wasSelected = answersSelection[answer] ?? false

        quiz.questions[currentQuestionIndex].answers.forEach {
            answersSelection[$0] = false
        }

        if !wasSelected {
            answersSelection[answer] = true
        }
    }

    func submit() {
        if isSubmittable && currentQuestionIndex == quiz.questions.count - 1 {
            let quizResult: QuizResultEntity = .init(
                completedAt: .now,
                originalQuiz: quiz,
                answersSelection: answersSelection
            )
            persistentStorage.saveQuizResult(quizResult)
            router.showQuizResults(quizResult, isShownAfterTaking: true)
        } else if isSubmittable {
            currentQuestionIndex += 1
        }
    }

    func answerStatus(answer: AnswerEntity) -> RadioStatus {
        let status: RadioStatus
        let isSelected: Bool = answersSelection[answer] ?? false
        switch (isSelected, resultsVisible, answer.isCorrect) {
        case (true, true, true): status = .correct
        case (true, true, false): status = .wrong
        case (true, false, _): status = .selected
        case (false, _, _): status = .unselected
        }
        return status
    }

}
