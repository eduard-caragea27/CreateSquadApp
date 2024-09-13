//
//  SquadView.swift
//  CreateSquad
//
//  Created by Eduard Sorin Caragea on 11.09.2024.
//

import SwiftUI

struct SquadView: View {
    @StateObject private var viewModel: SquadViewModel = SquadViewModel()
    @State private var isExpanded: Bool = true
    var flowType: FlowType
    
    var body: some View {
        VStack(spacing: 0) {
            chevronView
            ScrollView {
                VStack(spacing: 0) {
                    if isExpanded {
                        if viewModel.isLoading {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                .scaleEffect(1.5)
                                .padding()
                        } else {
                            ForEach(viewModel.sections) { section in
                                TeamSectionView(section: section)
                                    .transition(.move(edge: .top))
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
        .onAppear {
            viewModel.fetchPlayers()
        }
        .background(flowType == .ucl ? Color.darkBlue: Color.onyx)
    }
}

private extension SquadView {
    @ViewBuilder var chevronView: some View {
        HStack {
            Spacer()
            Button {
                withAnimation(.easeInOut(duration: 0.5)) {
                    isExpanded.toggle()
                }
            } label: {
                Image(systemName: isExpanded ? Localized.chevronUp : Localized.chevronDown)
                    .frame(width: 24, height: 24)
                    .tint(.white)
            }
        }
        .padding(.horizontal, 10)
    }
}

struct PlayerView: View {
    let player: Player
    
    var body: some View {
        VStack{
            HStack {
                Image(player.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: Constants.logoFrame, height: Constants.logoFrame)
                VStack(alignment: .leading) {
                    Text(player.name)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(.white)
                    Text(player.country)
                        .font(.system(size: 14, weight: .regular))
                        .foregroundStyle(.gray)
                }
                Spacer()
            
                Text(String(player.score))
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(.white)
            }
        }
        .padding(.vertical, 5)
    }
}

struct TeamSectionView: View {
    let section: TeamSection
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(section.title)
                .font(.title)
                .bold()
                .foregroundStyle(.white)
            
            ForEach(section.players) { player in
                PlayerView(player: player)
                Divider()
                    .background(Color.white)
            }
        }
        .padding()
    }
}

private enum Constants {
    static var logoFrame: CGFloat = 40
}

private enum Localized {
    static var chevronUp: String {
        return "chevron.up"
    }
    static var chevronDown: String {
        return "chevron.down"
    }
}
