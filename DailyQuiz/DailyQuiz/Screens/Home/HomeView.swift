//
//  HomeView.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 01.08.2025.
//

import SwiftUI

struct HomeView: View {

    // MARK: - Constants

    private enum Constants {
        static let historyButtonYOffset: CGFloat = 46
        static let historyButtonHStackSpacing: CGFloat = 12
        static let historyButtonPadding: CGFloat = 12
        static let mainVStackSpacing: CGFloat = 40
        static let greetingContainerSpacing: CGFloat = 40
        static let xPadding: CGFloat = 16
    }

    // MARK: - Properties

    @ObservedObject
    var viewModel: HomeViewModel

    let namespace: Namespace.ID

    // MARK: - Body

    var body: some View {
        ZStack {
            history
                .frame(maxHeight: .infinity, alignment: .top)
                .padding(.top, Constants.historyButtonYOffset)

            VStack(spacing: Constants.mainVStackSpacing) {
                Image(.logo)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(.white)
                    .frame(width: 300)
                    .matchedGeometryEffect(id: "logo", in: namespace)

                greeting
            }
        }
    }

    // MARK: - Subviews

    var history: some View {
        VStack {
            Button(
                action: {
                    viewModel.showHistory()
                },
                label: {
                    HStack(spacing: Constants.historyButtonHStackSpacing) {
                        Text("История")
                            .font(.caption)
                            .fontWeight(.semibold)
                        Image(.history)
                    }
                }
            )
            .padding(Constants.historyButtonPadding)
            .background(.white)
            .foregroundStyle(Color.App.purple)
            .buttonStyle(.plain)
            .clipShape(.capsule)

            Spacer()
        }
    }

    var greeting: some View {
        VStack(spacing: Constants.greetingContainerSpacing) {
            Text("Добро пожаловать в DailyQuiz!")
                .font(.title)
                .multilineTextAlignment(.center)
                .fontWeight(.bold)
            Button {
                viewModel.start()
            } label: {
                Text("Начать викторину".uppercased())
            }
            .buttonStyle(DQButtonStyle(.accent))
            .frame(maxWidth: .infinity)

        }
        .dqContainerStyle()
        .frame(maxWidth: .infinity)
        .padding(.horizontal, Constants.xPadding)
    }
}
