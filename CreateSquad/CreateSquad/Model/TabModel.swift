//
//  TabModel.swift
//  CreateSquad
//
//  Created by Eduard Sorin Caragea on 11.09.2024.
//

import SwiftUI

struct TabModel: Identifiable {
    var id: Tab
    
    enum Tab: String {
        case screen1 = "Overview"
        case screen2 = "Matches"
        case screen3 = "Groups"
        case screen4 = "Stats"
        case squad = "Squad"
    }
}
