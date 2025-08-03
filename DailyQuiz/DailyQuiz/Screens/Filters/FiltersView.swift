//
//  FiltersView.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 03.08.2025.
//

import SwiftUI

struct FiltersView: View {

    // MARK: - Constants

    private enum Constants {
        static let verticalPadding: CGFloat = 32
        static let horizontalPadding: CGFloat = 26
        static let logoWidth: CGFloat = 180
        static let mainContainerSpacing: CGFloat = 40
        static let topSpacingBetweenTitleAndButton: CGFloat = 140
        static let titleStackSpacing: CGFloat = 12
        static let paramsSpacing: CGFloat = 16
    }

    // MARK: - Properties

    @ObservedObject
    var viewModel: FiltersViewModel

    let namespace: Namespace.ID

    // MARK: - Body

    var body: some View {
        TopBarViewContainer(content: {
            ZStack {
                content
                    .opacity(viewModel.isLoading ? 0 : 1)

                CustomSpinner(style: .big)
                    .opacity(viewModel.isLoading ? 1 : 0)
            }
        }, mode: .logo(namespace), onBack: viewModel.back)
    }

    // MARK: - Subviews

    private var content: some View {
        VStack {
            VStack(spacing: Constants.mainContainerSpacing) {
                titleSection

                params

                Spacer()
                    .frame(
                        minHeight: 0,
                        idealHeight: Constants.topSpacingBetweenTitleAndButton,
                        maxHeight: Constants.topSpacingBetweenTitleAndButton
                    )

                startButton
            }
            .dqContainerStyle()
            .frame(maxWidth: .infinity)

            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
            }
        }
        .padding(.vertical, Constants.verticalPadding)
        .padding(.horizontal, Constants.horizontalPadding)
    }

    private var titleSection: some View {
        VStack(spacing: Constants.titleStackSpacing) {
            Text("Почти готовы!")
                .font(.title)
                .fontWeight(.bold)

            Text("Осталось выбрать категорию и сложность викторины.")
        }
        .multilineTextAlignment(.center)
    }

    private var params: some View {
        VStack(spacing: Constants.paramsSpacing) {
            PickerView(
                title: "Категория",
                items: TriviaCategory.allCases,
                itemToString: { $0.displayString },
                selected: $viewModel.filters.category
            )
            PickerView(
                title: "Сложность",
                items: TriviaDifficulty.allCases,
                itemToString: { $0.displayString },
                selected: $viewModel.filters.difficulty
            )
        }
    }

    private var startButton: some View {
        Button {
            viewModel.start()
        } label: {
            Text((viewModel.isStartable ? "Начать викторину" : "Далее").uppercased())
        }
        .buttonStyle(DQButtonStyle(.accent))
        .frame(maxWidth: .infinity)
        .disabled(!viewModel.isStartable)
    }
}
