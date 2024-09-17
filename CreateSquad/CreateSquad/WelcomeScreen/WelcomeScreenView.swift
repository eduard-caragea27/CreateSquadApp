//
//  WelcomeScreenView.swift
//  CreateSquad
//
//  Created by Eduard Sorin Caragea on 10.09.2024.
//

import SwiftUI

struct WelcomeScreenView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Spacer()
                createButtons(title: Localized.uclButtonText,
                              background: Color.darkBlue,
                              foreground: .white,
                              flowType: .ucl)
                createButtons(title: Localized.uelButtonText,
                              background: Color.darkRed,
                              foreground: .white,
                              flowType: .uel)
            }
            .padding(.horizontal, 10)
            .padding(.bottom, 20)
            .background(Color.mainBackground)
        }
    }
}

private extension WelcomeScreenView{
    @ViewBuilder
    func createButtons(title: String,
                       background: Color,
                       foreground: Color,
                       flowType: FlowType) -> some View {
        NavigationLink(destination: MainView(flowType: flowType)) {
            Text(title)
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(background)
                .foregroundColor(foreground)
                .font(.system(size: 16, weight: .bold))
                .cornerRadius(10)
        }
    }
}

private enum Localized {
    static var uclButtonText: String {
        return "UCL"
    }
    static var uelButtonText: String {
        return "UEL"
    }
}

