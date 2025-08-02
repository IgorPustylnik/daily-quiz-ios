//
//  HistoryView.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 02.08.2025.
//

import SwiftUI

struct HistoryView: View {

    // MARK: - Constants

    private enum Constants {
        static let verticalPadding: CGFloat = 32
        static let horizontalPadding: CGFloat = 26

        static let mainSpacing: CGFloat = 40
        static let resultsSpacing: CGFloat = 24

        static let noResultsSpacing: CGFloat = 40
    }

    // MARK: - Properties

    @ObservedObject
    var viewModel: HistoryViewModel

    // MARK: - Body

    var body: some View {
        ScrollView {
            VStack(spacing: Constants.mainSpacing) {
                header
                if viewModel.results.isEmpty {
                    noResults
                } else {
                    resultsList
                }
            }
            .padding(.vertical, Constants.verticalPadding)
            .padding(.horizontal, Constants.horizontalPadding)
        }
        .scrollIndicators(.hidden)
        .onAppear {
            viewModel.fetchResults()
        }
    }

    // MARK: - Subviews

    private var header: some View {
        Text("История")
            .font(.largeTitle)
            .fontWeight(.black)
            .foregroundStyle(.white)
    }

    private var resultsList: some View {
        LazyVStack(spacing: Constants.resultsSpacing) {
            ForEach(viewModel.results) { result in
                ResultCardView(quizResult: result)
                    .onTapGesture {
                        viewModel.openResult(result)
                    }
                    .contextMenu {
                        Button(role: .destructive) {
                            viewModel.deleteResult(result)
                        } label: {
                            Label(
                                title: { Text("Удалить") },
                                icon: { Image(.trash) }
                            )
                        }
                    }
            }
        }
    }

    var noResults: some View {
        VStack(spacing: Constants.noResultsSpacing) {
            Text("Вы ещё не проходили ни одной викторины")
                .font(.title3)
                .multilineTextAlignment(.center)

            Button(action: {
                viewModel.showHome()
            }, label: {
                Text("Начать викторину".uppercased())
            })
            .buttonStyle(DQButtonStyle(.accent))
        }
        .dqContainerStyle()
    }

}
