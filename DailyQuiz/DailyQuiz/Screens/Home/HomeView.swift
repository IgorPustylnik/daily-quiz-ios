//
//  HomeView.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 01.08.2025.
//

import SwiftUI

struct HomeView: View {

    // MARK: - Properties

    @ObservedObject
    var viewModel: HomeViewModel

    var body: some View {
        VStack(spacing: 40) {
            Image(.logo)
            greeting
        }
    }

    var greeting: some View {
        VStack(spacing: 40) {
            Text("Добро пожаловать в DailyQuiz!")
                .font(.title)
                .multilineTextAlignment(.center)
                .fontWeight(.bold)
            Button {

            } label: {
                Text("Начать викторину".uppercased())
            }
            .buttonStyle(DQButtonStyle(.accent))
            .frame(maxWidth: .infinity)

        }
        .dqContainerStyle()
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 16)
    }
}
