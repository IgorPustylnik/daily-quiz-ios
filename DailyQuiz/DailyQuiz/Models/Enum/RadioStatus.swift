//
//  RadioStatus.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 01.08.2025.
//

import SwiftUI

enum RadioStatus {
    case unselected, selected, correct, wrong

    var color: Color {
        switch self {
        case .unselected:
            return .clear
        case .selected:
            return .App.darkPurple
        case .correct:
            return .App.green
        case .wrong:
            return .App.red
        }
    }

}
