//
//  Strings.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 02.08.2025.
//

import Foundation

// По-хорошему, сделать всё через SwiftGen, но здесь решил остановиться на перечислении
// только сообщений результатов прохождения викторины

enum Strings {
    enum QuizResults {
        static func title(for score: Int) -> String {
            switch score {
            case 5: return "Идеально!"
            case 4: return "Почти идеально!"
            case 3: return "Хороший результат!"
            case 2: return "Есть над чем поработать"
            case 1: return "Сложный вопрос?"
            default: return "Бывает и так!"
            }
        }

        static func subtitle(for score: Int) -> String {
            switch score {
            case 5: return "5/5 — вы ответили на всё правильно. Это блестящий результат!"
            case 4: return "4/5 — очень близко к совершенству. Ещё один шаг!"
            case 3: return "3/5 — вы на верном пути. Продолжайте тренироваться!"
            case 2: return "2/5 — не расстраивайтесь, попробуйте ещё раз!"
            case 1: return "1/5 — иногда просто не ваш день. Следующая попытка будет лучше!"
            default: return "0/5 — не отчаивайтесь. Начните заново и удивите себя!"
            }
        }
    }
}
