//
//  MainView.swift
//  CreateSquad
//
//  Created by Eduard Sorin Caragea on 12.09.2024.
//

import SwiftUI

enum FlowType: String {
    case ucl
    case uel
}

struct MainView: View {
    @State private var tabs: [TabModel] = [
        .init(id: TabModel.Tab.screen1),
        .init(id: TabModel.Tab.screen2),
        .init(id: TabModel.Tab.screen3),
        .init(id: TabModel.Tab.screen4),
        .init(id: TabModel.Tab.squad)
    ]
    @State private var selectedTab: TabModel.Tab = .squad
    var flowType: FlowType
    
    var body: some View {
        VStack(alignment: .leading) {
            headerView
            customTabBar
            switch selectedTab {
            case .squad:
                SquadView(flowType: flowType)
            default:
                Spacer()
                EmptyView()
            }
        }
        .background(flowType == .ucl ?
                    (selectedTab == .squad ? Color.darkBlue : Color.white) :
                        (selectedTab == .squad ? Color.onyx : Color.white))
        .toolbarRole(.editor)
    }
}

private extension MainView {
    @ViewBuilder var headerView: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 20) {
                Text(Localized.teamName)
                    .font(.system(size: 35, weight: .bold, design: .default))
                    .foregroundColor(.white)
                HStack {
                    VStack(alignment: .leading) {
                        Text(Localized.firstText)
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(.white)
                        
                        Text(Localized.secondText)
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Image(Localized.logoName)
                        .resizable()
                        .frame(width: Constants.logoFrame, height: Constants.logoFrame)
                }
            }
            .padding(.horizontal, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: 200)
        .background(
            Image(flowType == .ucl ? Localized.uclHeaderBackground : Localized.uelHeaderBackground)
                .resizable()
                .edgesIgnoringSafeArea(.all)
        )
    }
    
    @ViewBuilder var customTabBar: some View {
        HStack(spacing: 15) {
            ForEach(tabs) { tab in
                Button(action: {
                    selectedTab = tab.id
                }) {
                    Text(tab.id.rawValue)
                        .font(.system(size: 14, weight: .bold))
                        .foregroundStyle(selectedTab == tab.id ? Color.lightTurquoise : Color.gray)
                }
            }
        }
        .padding(.horizontal, 20)
    }
}

private enum Constants {
    static var logoFrame: CGFloat = 110
}

private enum Localized {
    static var uclHeaderBackground: String {
        return "UCL_header"
    }
    static var uelHeaderBackground: String {
        return "UEL_header"
    }
    static var logoName: String {
        return "teamLogo"
    }
    static var teamName: String {
        return "Barcelona"
    }
    static var firstText: String {
        return "Playing"
    }
    static var secondText: String {
        return "Round of 16"
    }
}
