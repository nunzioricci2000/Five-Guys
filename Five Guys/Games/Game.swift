//
//  Game.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 22/10/22.
//

import SwiftUI

enum GameState {
    case running, ended
}

protocol Game {
    var name: String { get }
    var points: Int { get }
    var state: GameState { get }
}
