//
//  AnswerCardView.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 03.08.2025.
//

import SwiftUI

struct AnswerCardView: View {

    // MARK: - Constants

    private enum Constants {
        static let cardSpacing: CGFloat = 24
        static let headerSpacing: CGFloat = 20
    }

    // MARK: - Properties

    let question: QuestionEntity
    let index: Int
    let questionCount: Int
    let questionStatus: RadioStatus
    let answerStatusProvider: (AnswerEntity) -> RadioStatus

    // MARK: - Body

    var body: some View {
        VStack(spacing: Constants.cardSpacing) {
            VStack(spacing: Constants.headerSpacing) {
                HStack {
                    Text("Вопрос \(index + 1) из \(questionCount)")
                        .fontWeight(.bold)
                        .foregroundStyle(Color.App.gray)
                    Spacer()
                    RadioView(status: questionStatus)
                }

                Text(question.question)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }

            ForEach(question.answers) { answer in
                AnswerView(status: answerStatusProvider(answer), text: answer.text)
            }
        }
        .dqContainerStyle()
    }
}
