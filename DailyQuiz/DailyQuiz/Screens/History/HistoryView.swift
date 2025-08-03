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
        TopBarViewContainer(content: {
            content
        }, mode: .title("История"), onBack: {
            viewModel.back()
        })
        .onAppear {
            viewModel.fetchResults()
        }
        .customAlert(isPresented: $viewModel.isDeletionAlertPresented) {
            deletionAlert
        }
    }

    private var content: some View {
        ScrollView {
            if viewModel.results.isEmpty {
                EmptyHistoryView(action: viewModel.showHome)
            } else {
                resultsList
            }
        }
        .padding(.horizontal, Constants.horizontalPadding)
        .scrollIndicators(.hidden)
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

    private var deletionAlert: some View {
        InfoAlert(
            title: "Попытка удалена",
            subtitle: "Вы можете пройти викторину снова, когда будете готовы.",
            buttonTitle: "Хорошо".uppercased()
        ) {
            viewModel.isDeletionAlertPresented = false
        }
    }
}
