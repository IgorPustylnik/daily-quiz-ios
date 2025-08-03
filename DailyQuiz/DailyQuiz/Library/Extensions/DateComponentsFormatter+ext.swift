//
//  DateComponentsFormatter+ext.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 03.08.2025.
//

import Foundation

extension DateComponentsFormatter {
    static var minutesSeconds: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.zeroFormattingBehavior = [.pad]
        return formatter
    }()
}
