//
//  SquadManager.swift
//  CreateSquad
//
//  Created by Eduard Sorin Caragea on 11.09.2024.
//

import Foundation

class SquadManager {
    func fetchPlayers(completion: @escaping ([Player]) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let playersData: [Player] = [
                Player(name: "Player name", country: "England", score: 99, imageName: "playerImage", position: "Forwards"),
                Player(name: "Player name", country: "England", score: 98, imageName: "playerImage", position: "Goalkeepers"),
                Player(name: "Player name", country: "England", score: 97, imageName: "playerImage", position: "Defenders"),
                Player(name: "Player name", country: "England", score: 99, imageName: "playerImage", position: "Forwards"),
                Player(name: "Player name", country: "England", score: 99, imageName: "playerImage", position: "Coach"),
                Player(name: "Player name", country: "England", score: 99, imageName: "playerImage", position: "Goalkeepers"),
                Player(name: "Player name", country: "England", score: 96, imageName: "playerImage", position: "Midfilders"),
                Player(name: "Player name", country: "England", score: 99, imageName: "playerImage", position: "Forwards"),
                Player(name: "Player name", country: "England", score: 99, imageName: "playerImage", position: "Defenders"),
                Player(name: "Player name", country: "England", score: 99, imageName: "playerImage", position: "Defenders"),
                Player(name: "Player name", country: "England", score: 99, imageName: "playerImage", position: "Midfilders"),
                Player(name: "Player name", country: "England", score: 99, imageName: "playerImage", position: "Forwards"),
                Player(name: "Player name", country: "England", score: 99, imageName: "playerImage", position: "Goalkeepers"),
                Player(name: "Player name", country: "England", score: 99, imageName: "playerImage", position: "Midfilders"),
                Player(name: "Player name", country: "England", score: 99, imageName: "playerImage", position: "Goalkeepers"),
                Player(name: "Player name", country: "England", score: 99, imageName: "playerImage", position: "Defenders"),
                Player(name: "Player name", country: "England", score: 99, imageName: "playerImage", position: "Midfilders"),
            ]
            completion(playersData)
        }
    }
}
