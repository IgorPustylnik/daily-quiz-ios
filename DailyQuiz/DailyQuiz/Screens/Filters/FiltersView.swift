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
        ZStack {
            topBar
                .frame(maxHeight: .infinity, alignment: .top)

            ZStack {
                content
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

    private var content: some View {
        Group {
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
