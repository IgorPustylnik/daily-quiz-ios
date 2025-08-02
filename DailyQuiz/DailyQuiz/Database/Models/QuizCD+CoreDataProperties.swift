//
//  QuizCD+CoreDataProperties.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 02.08.2025.
//
//

import Foundation
import CoreData

extension QuizCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<QuizCD> {
        return NSFetchRequest<QuizCD>(entityName: "QuizCD")
    }

    @NSManaged public var name: String
    @NSManaged public var difficulty: String
    @NSManaged public var category: String
    @NSManaged public var questions: NSOrderedSet

}

// MARK: Generated accessors for questions
extension QuizCD {

    @objc(insertObject:inQuestionsAtIndex:)
    @NSManaged public func insertIntoQuestions(_ value: QuestionCD, at idx: Int)

    @objc(removeObjectFromQuestionsAtIndex:)
    @NSManaged public func removeFromQuestions(at idx: Int)

    @objc(insertQuestions:atIndexes:)
    @NSManaged public func insertIntoQuestions(_ values: [QuestionCD], at indexes: NSIndexSet)

    @objc(removeQuestionsAtIndexes:)
    @NSManaged public func removeFromQuestions(at indexes: NSIndexSet)

    @objc(replaceObjectInQuestionsAtIndex:withObject:)
    @NSManaged public func replaceQuestions(at idx: Int, with value: QuestionCD)

    @objc(replaceQuestionsAtIndexes:withQuestions:)
    @NSManaged public func replaceQuestions(at indexes: NSIndexSet, with values: [QuestionCD])

    @objc(addQuestionsObject:)
    @NSManaged public func addToQuestions(_ value: QuestionCD)

    @objc(removeQuestionsObject:)
    @NSManaged public func removeFromQuestions(_ value: QuestionCD)

    @objc(addQuestions:)
    @NSManaged public func addToQuestions(_ values: NSOrderedSet)

    @objc(removeQuestions:)
    @NSManaged public func removeFromQuestions(_ values: NSOrderedSet)

}

extension QuizCD: Identifiable {

}
