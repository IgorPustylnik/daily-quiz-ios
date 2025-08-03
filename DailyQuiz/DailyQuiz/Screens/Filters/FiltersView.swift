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
        static let historyButtonYOffset: CGFloat = 46
        static let historyButtonHStackSpacing: CGFloat = 12
        static let historyButtonPadding: CGFloat = 12
        static let mainVStackSpacing: CGFloat = 40
        static let logoWidth: CGFloat = 180
        static let mainContainerSpacing: CGFloat = 40
    }

    // MARK: - Properties

    @ObservedObject
    var viewModel: FiltersViewModel

    let namespace: Namespace.ID

    // MARK: - Body

    var body: some View {
        ZStack {
            topBar
                .frame(maxHeight: .infinity, alignment: .top)

            ZStack {
                Group {
                    almostReady
                    if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                    }
                }
                .opacity(viewModel.isLoading ? 0 : 1)

                CustomSpinner(style: .big)
                    .opacity(viewModel.isLoading ? 1 : 0)
            }
        }
        .padding(.vertical, Constants.verticalPadding)
        .padding(.horizontal, Constants.horizontalPadding)
    }

    // MARK: - Subviews

    private var topBar: some View {
        ZStack {
            Button {
                viewModel.back()
            } label: {
                Image(systemName: "chevron.left")
                    .tint(.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Image(.logo)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(.white)
                .frame(width: Constants.logoWidth)
                .matchedGeometryEffect(id: "logo", in: namespace)
        }
    }

    var almostReady: some View {
        VStack(spacing: Constants.mainContainerSpacing) {
            VStack(spacing: 12) {
                Text("Почти готовы!")
                    .font(.title)
                    .fontWeight(.bold)

                Text("Осталось выбрать категорию и сложность викторины.")
            }
            .multilineTextAlignment(.center)

            params

            Spacer()
                .frame(minHeight: 0, idealHeight: 140, maxHeight: 140)

            Button {
                viewModel.start()
            } label: {
                Text((viewModel.isStartable ? "Начать викторину" : "Далее").uppercased())
            }
            .buttonStyle(DQButtonStyle(.accent))
            .frame(maxWidth: .infinity)
            .disabled(!viewModel.isStartable)

        }
        .dqContainerStyle()
        .frame(maxWidth: .infinity)
    }

    var params: some View {
        VStack(spacing: 16) {
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

}
