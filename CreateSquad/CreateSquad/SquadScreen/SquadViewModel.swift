//
//  SquadViewModel.swift
//  CreateSquad
//
//  Created by Eduard Sorin Caragea on 11.09.2024.
//

import SwiftUI

final class SquadViewModel: ObservableObject {
    @Published var sections: [TeamSection] = []
    @Published var isLoading = true
    var manager: SquadManager = SquadManager()
    
    func fetchPlayers() {
        isLoading = true
        manager.fetchPlayers { players in
            self.handleResponse(players: players)
            self.isLoading = false
        }
    }
    
    private func handleResponse(players: [Player]) {
        var groupedPlayers: [String: [Player]] = [:]
        for player in players {
            if groupedPlayers[player.position] != nil {
                groupedPlayers[player.position]?.append(player)
            } else {
                groupedPlayers[player.position] = [player]
            }
        }
        self.sections = groupedPlayers.map { (position, players) in
            TeamSection(title: position, players: players)
        } 
        .sorted(by: { $0.title < $1.title})
    }
}
