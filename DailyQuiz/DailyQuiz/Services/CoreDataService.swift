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

    func getAllQuizResults() -> [QuizResultEntity] {
        let request: NSFetchRequest<QuizResultCD> = QuizResultCD.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "completedAt", ascending: false)]

        guard let results = try? context.fetch(request) else { return [] }

        return results.compactMap { quizResultCD in
            quizResultCD.convertToQuizResultEntity()
        }
    }

    func deleteQuizResults(_ results: [QuizResultEntity]) {
        let ids = results.map { $0.id }

        let request: NSFetchRequest<QuizResultCD> = QuizResultCD.fetchRequest()
        request.predicate = NSPredicate(format: "id in %@", ids)

        guard let results = try? context.fetch(request) else { return }

        results.forEach { context.delete($0) }

        try? context.save()
    }

    func saveQuizResult(_ quizResult: QuizResultEntity) {
        let quizResultCD = QuizResultCD(context: context)
        quizResultCD.id = quizResult.id
        quizResultCD.completedAt = quizResult.completedAt

        let quizCD = QuizCD(context: context)
        for question in quizResult.originalQuiz.questions {
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

                if let selected = quizResult.answersSelection[answer] {
                    let selectionCD = AnswerSelectionCD(context: context)
                    selectionCD.answer = answerCD
                    selectionCD.isSelected = selected
                    selectionCD.quizResult = quizResultCD
                }
            }

            quizCD.name = quizResult.originalQuiz.name
            quizCD.difficulty = quizResult.originalQuiz.difficulty.rawValue
            quizCD.category = quizResult.originalQuiz.category.rawValue
            quizCD.addToQuestions(questionCD)
            questionCD.quiz = quizCD
        }

        quizResultCD.originalQuiz = quizCD

        do {
            try context.save()
        } catch {
            print(error)
        }
    }

}
