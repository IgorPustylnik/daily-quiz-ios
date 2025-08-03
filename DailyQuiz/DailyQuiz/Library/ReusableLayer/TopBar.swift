//
//  TopBar.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 03.08.2025.
//

import SwiftUI

private enum Constants {
    static let logoWidth: CGFloat = 180
    static let verticalSpacing: CGFloat = 32
    static let verticalPadding: CGFloat = 32
    static let horizontalPadding: CGFloat = 26
}

struct TopBar: View {
    enum Mode {
        case logo(Namespace.ID)
        case title(String)
    }

    let mode: Mode
    let onBack: EmptyClosure?

    var body: some View {
        ZStack {
            if let onBack {
                HStack {
                    Button {
                        onBack()
                    } label: {
                        Image(systemName: "chevron.left")
                            .tint(.white)
                    }
                    Spacer()
                }
            }
            switch mode {
            case .logo(let namespace):
                Image(.logo)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(.white)
                    .frame(width: Constants.logoWidth)
                    .matchedGeometryEffect(id: "logo", in: namespace)
            case .title(let title):
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundStyle(.white)
            }
        }
    }
}

struct TopBarViewContainer<Content: View>: View {
    let content: () -> Content

    let mode: TopBar.Mode
    let onBack: EmptyClosure?

    var body: some View {
        VStack(spacing: Constants.verticalSpacing) {
            TopBar(mode: mode, onBack: onBack)
                .padding(.top, Constants.verticalPadding)
                .padding(.horizontal, Constants.horizontalPadding)
            content()
        }
    }
}
