//
//  PickerView.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 03.08.2025.
//

import SwiftUI

// MARK: - Constants

private enum Constants {
    static let triggerButtonSpacing: CGFloat = 12
    static let triggerButtonVerticalPadding: CGFloat = 12
    static let triggerButtonTrailingPadding: CGFloat = 22
    static let triggerButtonCornerRadius: CGFloat = 16
    static let triggerButtonMinHeight: CGFloat = 48
    static let triggerTitleSpacing: CGFloat = 8

    static let sheetHeaderSpacing: CGFloat = 10
    static let sheetHorizontalPadding: CGFloat = 16
    static let sheetVerticalPadding: CGFloat = 25
    static let sheetCornerRadius: CGFloat = 46

    static let selectionRowSpacing: CGFloat = 8
    static let selectionRowHeight: CGFloat = 50

    static let maxVisibleItemsInFirstDetent: Int = 8
    static let minSheetHeightFraction: CGFloat = 0.3
    static let maxSheetHeightFraction: CGFloat = 0.7
    static let estimatedHeaderHeight: CGFloat = 80
}

struct PickerView<Item: Hashable>: View {

    // MARK: - Properties

    let title: String
    let items: [Item]
    let itemToString: (Item) -> String

    @Binding
    var selected: Item?

    @State
    private var isSheetPresented: Bool = false

    // MARK: - Computed Properties

    private var dynamicSheetHeight: CGFloat {
        let visibleItems = min(items.count, Constants.maxVisibleItemsInFirstDetent)
        let contentHeight = CGFloat(visibleItems) * Constants.selectionRowHeight +
        Constants.estimatedHeaderHeight +
        (Constants.sheetVerticalPadding * 2)

        let screenHeight = UIScreen.main.bounds.height
        let fraction = contentHeight / screenHeight
        return min(max(fraction, Constants.minSheetHeightFraction), Constants.maxSheetHeightFraction)
    }

    // MARK: - Body

    var body: some View {
        Button {
            isSheetPresented.toggle()
        } label: {
            triggerButton
        }
        .sheet(isPresented: $isSheetPresented) {
            sheetContent
        }
        .animation(.easeInOut, value: selected)
    }

    // MARK: - Subviews

    private var triggerButton: some View {
        HStack(spacing: Constants.triggerButtonSpacing) {
            triggerButtonContent

            Image(systemName: "chevron.forward")
                .foregroundStyle(Color.App.darkPurple)
        }
        .padding([.leading, .vertical], Constants.triggerButtonVerticalPadding)
        .padding(.trailing, Constants.triggerButtonTrailingPadding)
        .frame(minHeight: Constants.triggerButtonMinHeight)
        .background(Color.App.secondaryBackground)
        .clipShape(.rect(cornerRadius: Constants.triggerButtonCornerRadius))
    }

    private var triggerButtonContent: some View {
        VStack(alignment: .leading, spacing: Constants.triggerTitleSpacing) {
            Text(title)
                .fontWeight(.bold)
                .foregroundStyle(Color.App.darkPurple)

            if let selected {
                Text(itemToString(selected))
                    .foregroundStyle(.black)
            }
        }
        .multilineTextAlignment(.leading)
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var sheetContent: some View {
        VStack(spacing: Constants.sheetHeaderSpacing) {
            sheetHeader
            itemsList
        }
        .padding(.horizontal, Constants.sheetHorizontalPadding)
        .padding(.vertical, Constants.sheetVerticalPadding)
        .background(.white)
        .frame(maxWidth: .infinity, alignment: .leading)
        .presentationDetents([
            .fraction(dynamicSheetHeight),
            .large
        ])
        .presentationCornerRadius(Constants.sheetCornerRadius)
        .presentationDragIndicator(.visible)
    }

    private var sheetHeader: some View {
        Text(title)
            .font(.title)
            .fontWeight(.bold)
            .foregroundStyle(Color.App.darkPurple)
            .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var itemsList: some View {
        ScrollView {
            LazyVStack {
                ForEach(items, id: \.hashValue) { item in
                    ListSelectionRow(
                        text: itemToString(item),
                        isSelected: item == selected,
                        action: {
                            selected = item
                            isSheetPresented = false
                        }
                    )
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}

// MARK: - ListSelectionRow

struct ListSelectionRow: View {
    let text: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: Constants.selectionRowSpacing) {
                Text(text)
                    .multilineTextAlignment(.leading)
                    .frame(height: Constants.selectionRowHeight)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .fontWeight(isSelected ? .bold : .regular)

                Image(systemName: "checkmark")
                    .opacity(isSelected ? 1 : 0)
            }
            .foregroundStyle(Color.App.darkPurple)
        }
    }
}
