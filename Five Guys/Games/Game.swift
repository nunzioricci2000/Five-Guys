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

protocol Minigame {
    var state: GameState { set get }
    func name() -> String
    func points() -> Int
    func levels() -> [String]
}

