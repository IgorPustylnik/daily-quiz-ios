//
//  Score.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 02.08.2025.
//

import Foundation

enum Score: Int {
    case zero, one, two, three, four, five

    static var maxScore = Score.five

    var title: String {
        switch self {
        case .five: return "Идеально!"
        case .four: return "Почти идеально!"
        case .three: return "Хороший результат!"
        case .two: return "Есть над чем поработать"
        case .one: return "Сложный вопрос?"
        case .zero: return "Бывает и так!"
        }
    }

    var subtitle: String {
        switch self {
        case .five: return "5/5 — вы ответили на всё правильно. Это блестящий результат!"
        case .four: return "4/5 — очень близко к совершенству. Ещё один шаг!"
        case .three: return "3/5 — вы на верном пути. Продолжайте тренироваться!"
        case .two: return "2/5 — не расстраивайтесь, попробуйте ещё раз!"
        case .one: return "1/5 — иногда просто не ваш день. Следующая попытка будет лучше!"
        case .zero:  return "0/5 — не отчаивайтесь. Начните заново и удивите себя!"
        }
    }

    // Это не вяжется с сообщениями выше, но хорошо для масштабируемости
    static func normalized(from correctAnswers: Int, totalQuestions: Int) -> Score {
        guard totalQuestions > 0 else {
            return .zero
        }

        let ratio = Double(correctAnswers) / Double(totalQuestions)

        switch ratio {
        case 0..<0.2: return .zero
        case 0.2..<0.4: return .one
        case 0.4..<0.6: return .two
        case 0.6..<0.75: return .three
        case 0.75..<0.9: return .four
        default: return .five
        }
    }
}
