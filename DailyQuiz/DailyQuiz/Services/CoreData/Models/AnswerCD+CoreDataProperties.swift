//
//  AnswerCD+CoreDataProperties.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 02.08.2025.
//
//

import Foundation
import CoreData

extension AnswerCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AnswerCD> {
        return NSFetchRequest<AnswerCD>(entityName: "AnswerCD")
    }

    @NSManaged public var id: UUID
    @NSManaged public var text: String
    @NSManaged public var isCorrect: Bool
    @NSManaged public var question: QuestionCD
    @NSManaged public var selections: NSSet?

}

// MARK: Generated accessors for selections
extension AnswerCD {

    @objc(addSelectionsObject:)
    @NSManaged public func addToSelections(_ value: AnswerSelectionCD)

    @objc(removeSelectionsObject:)
    @NSManaged public func removeFromSelections(_ value: AnswerSelectionCD)

    @objc(addSelections:)
    @NSManaged public func addToSelections(_ values: NSSet)

    @objc(removeSelections:)
    @NSManaged public func removeFromSelections(_ values: NSSet)

}

extension AnswerCD: Identifiable {

}
