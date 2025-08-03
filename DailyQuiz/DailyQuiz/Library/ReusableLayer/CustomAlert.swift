//
//  CustomAlert.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 03.08.2025.
//

import SwiftUI

struct CustomAlertModifier<AlertContent: View>: ViewModifier {
    @Binding
    var isPresented: Bool
    let alertContent: () -> AlertContent

    func body(content: Content) -> some View {
        ZStack {
            content

            if isPresented {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .transition(.opacity)

                alertContent()
                    .transition(.scale)
            }
        }
        .animation(.easeInOut, value: isPresented)
    }
}

extension View {
    func customAlert<AlertContent: View>(
        isPresented: Binding<Bool>,
        @ViewBuilder alertContent: @escaping () -> AlertContent
    ) -> some View {
        modifier(CustomAlertModifier(isPresented: isPresented, alertContent: alertContent))
    }
}
