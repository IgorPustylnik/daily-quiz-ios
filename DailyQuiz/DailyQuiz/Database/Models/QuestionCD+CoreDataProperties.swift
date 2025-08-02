//
//  QuestionCD+CoreDataProperties.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 02.08.2025.
//
//

import Foundation
import CoreData

extension QuestionCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<QuestionCD> {
        return NSFetchRequest<QuestionCD>(entityName: "QuestionCD")
    }

    @NSManaged public var id: UUID
    @NSManaged public var type: String
    @NSManaged public var question: String
    @NSManaged public var answers: NSOrderedSet
    @NSManaged public var quiz: QuizCD

}

// MARK: Generated accessors for answers
extension QuestionCD {

    @objc(insertObject:inAnswersAtIndex:)
    @NSManaged public func insertIntoAnswers(_ value: AnswerCD, at idx: Int)

    @objc(removeObjectFromAnswersAtIndex:)
    @NSManaged public func removeFromAnswers(at idx: Int)

    @objc(insertAnswers:atIndexes:)
    @NSManaged public func insertIntoAnswers(_ values: [AnswerCD], at indexes: NSIndexSet)

    @objc(removeAnswersAtIndexes:)
    @NSManaged public func removeFromAnswers(at indexes: NSIndexSet)

    @objc(replaceObjectInAnswersAtIndex:withObject:)
    @NSManaged public func replaceAnswers(at idx: Int, with value: AnswerCD)

    @objc(replaceAnswersAtIndexes:withAnswers:)
    @NSManaged public func replaceAnswers(at indexes: NSIndexSet, with values: [AnswerCD])

    @objc(addAnswersObject:)
    @NSManaged public func addToAnswers(_ value: AnswerCD)

    @objc(removeAnswersObject:)
    @NSManaged public func removeFromAnswers(_ value: AnswerCD)

    @objc(addAnswers:)
    @NSManaged public func addToAnswers(_ values: NSOrderedSet)

    @objc(removeAnswers:)
    @NSManaged public func removeFromAnswers(_ values: NSOrderedSet)

}

extension QuestionCD: Identifiable {

}
