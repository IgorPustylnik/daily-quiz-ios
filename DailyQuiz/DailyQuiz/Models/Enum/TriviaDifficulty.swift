//
//  TriviaDifficulty.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 01.08.2025.
//

import Foundation

enum TriviaDifficulty: String, Decodable, CaseIterable {
    case any, easy, medium, hard

    var displayString: String {
        rawValue.capitalized
    }
}
