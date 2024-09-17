//
//  SquadModel.swift
//  CreateSquad
//
//  Created by Eduard Sorin Caragea on 11.09.2024.
//

import SwiftUI

struct Player: Identifiable, Codable {
    var id = UUID()
    let name: String
    let country: String
    let score: Int
    let imageName: String
    let position: String
}

struct TeamSection: Identifiable, Codable {
    var id = UUID()
    let title: String
    let players: [Player]
}
