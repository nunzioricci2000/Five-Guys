//
//  LevelHandlerView.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 20/10/22.
//

import SwiftUI

enum Level {
    case tris(Int)
    case fivetiles(Int)
}

struct LevelHandlerView: View {
    let id: Level
    
    var body: some View {
        switch id {
        case .fivetiles(let difficulty):
            FiveTilesView(game: FiveTiles(difficulty))
        default: Text("Unknown")
        }
    }
}

struct LevelHandlerView_Previews: PreviewProvider {
    static var previews: some View {
        LevelHandlerView(id: .fivetiles(10))
    }
}
