//
//  CoreDataQuizService.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 02.08.2025.
//

import Foundation
import CoreData

final class CoreDataService: PersistentStorage {

    // MARK: - Singleton

    static let shared = CoreDataService()

    private init() {}

    // MARK: - Private Properties

    private var context: NSManagedObjectContext { CoreDataStack.shared.persistentContainer.viewContext }

    // MARK: - Public Methods

    func getAllCompletedQuizzes() -> [CompletedQuizEntity] {
        let request: NSFetchRequest<CompletedQuizCD> = CompletedQuizCD.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "completedAt", ascending: false)]

        guard let results = try? context.fetch(request) else { return [] }

        return results.compactMap { completedQuizCD in
            completedQuizCD.convertToCompletedQuizEntity()
        }
    }

    func deleteCompletedQuizzes(_ quizzes: [CompletedQuizEntity]) {
        let ids = quizzes.map { $0.id }

        let request: NSFetchRequest<CompletedQuizCD> = CompletedQuizCD.fetchRequest()
        request.predicate = NSPredicate(format: "id in %@", ids)

        guard let results = try? context.fetch(request) else { return }

        results.forEach { context.delete($0) }

        try? context.save()
    }

    func saveCompletedQuiz(_ quiz: CompletedQuizEntity) {
        let completedQuizCD = CompletedQuizCD(context: context)
        completedQuizCD.id = quiz.id
        completedQuizCD.completedAt = quiz.completedAt

        let quizCD = QuizCD(context: context)
        for question in quiz.originalQuiz.questions {
            let questionCD = QuestionCD(context: context)
            questionCD.id = question.id
            questionCD.question = question.question
            questionCD.type = question.type.rawValue
            questionCD.difficulty = question.difficulty.rawValue
            questionCD.category = question.category.rawValue

            for answer in question.answers {
                let answerCD = AnswerCD(context: context)
                answerCD.id = answer.id
                answerCD.text = answer.text
                answerCD.isCorrect = answer.isCorrect
                questionCD.addToAnswers(answerCD)

                if let selected = quiz.answersSelection[answer] {
                    let selectionCD = AnswerSelectionCD(context: context)
                    selectionCD.answer = answerCD
                    selectionCD.isSelected = selected
                    selectionCD.completedQuiz = completedQuizCD
                }
            }

            quizCD.addToQuestions(questionCD)
            questionCD.quiz = quizCD
        }

        completedQuizCD.originalQuiz = quizCD

        try? context.save()
    }

}
