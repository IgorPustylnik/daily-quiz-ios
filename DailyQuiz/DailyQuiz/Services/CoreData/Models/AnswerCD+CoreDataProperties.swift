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

}

extension AnswerCD: Identifiable {

}
