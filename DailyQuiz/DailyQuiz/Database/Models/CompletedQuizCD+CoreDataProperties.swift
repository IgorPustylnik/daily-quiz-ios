//
//  CompletedQuizCD+CoreDataProperties.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 02.08.2025.
//
//

import Foundation
import CoreData

extension CompletedQuizCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CompletedQuizCD> {
        return NSFetchRequest<CompletedQuizCD>(entityName: "CompletedQuizCD")
    }

    @NSManaged public var id: UUID
    @NSManaged public var completedAt: Date
    @NSManaged public var originalQuiz: QuizCD
    @NSManaged public var answersSelection: NSSet

}

// MARK: Generated accessors for answersSelection
extension CompletedQuizCD {

    @objc(addAnswersSelectionObject:)
    @NSManaged public func addToAnswersSelection(_ value: AnswerSelectionCD)

    @objc(removeAnswersSelectionObject:)
    @NSManaged public func removeFromAnswersSelection(_ value: AnswerSelectionCD)

    @objc(addAnswersSelection:)
    @NSManaged public func addToAnswersSelection(_ values: NSSet)

    @objc(removeAnswersSelection:)
    @NSManaged public func removeFromAnswersSelection(_ values: NSSet)

}

extension CompletedQuizCD: Identifiable {

}

extension CompletedQuizCD {
    func convertToCompletedQuizEntity() -> CompletedQuizEntity {
        let questionsCD = (originalQuiz.questions.array as? [QuestionCD]) ?? []

        let questions: [QuestionEntity] = questionsCD.compactMap { question in
            let answersCD = (question.answers.array as? [AnswerCD]) ?? []

            let answers = answersCD.map { answer in
                AnswerEntity(id: answer.id, text: answer.text, isCorrect: answer.isCorrect)
            }

            guard let type = QuestionType(rawValue: question.type),
                  let difficulty = QuestionDifficulty(rawValue: question.difficulty),
                  let category = QuestionCategory(rawValue: question.category)
            else {
                return nil
            }

            return QuestionEntity(
                id: question.id,
                type: type,
                difficulty: difficulty,
                category: category,
                question: question.question,
                answers: answers
            )
        }

        let quiz = QuizEntity(name: originalQuiz.name, questions: questions)

        var selection: [AnswerEntity: Bool] = [:]
        if let rawSelections = self.answersSelection as? Set<AnswerSelectionCD> {
            for sel in rawSelections {
                let answer = sel.answer
                let answerEntity = AnswerEntity(id: answer.id, text: answer.text, isCorrect: answer.isCorrect)
                selection[answerEntity] = sel.isSelected
            }
        }

        return CompletedQuizEntity(
            id: self.id,
            completedAt: self.completedAt,
            originalQuiz: quiz,
            answersSelection: selection
        )
    }
}
