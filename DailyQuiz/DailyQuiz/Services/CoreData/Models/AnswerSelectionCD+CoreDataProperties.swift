//
//  AnswerSelectionCD+CoreDataProperties.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 02.08.2025.
//
//

import Foundation
import CoreData

extension AnswerSelectionCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AnswerSelectionCD> {
        return NSFetchRequest<AnswerSelectionCD>(entityName: "AnswerSelectionCD")
    }

    @NSManaged public var isSelected: Bool
    @NSManaged public var answer: AnswerCD
    @NSManaged public var quizResult: QuizResultCD

}

extension AnswerSelectionCD: Identifiable {

}
