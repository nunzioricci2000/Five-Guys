//
//  Five Tiles.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 22/10/22.
//

import SwiftUI

@MainActor
class FiveTiles: ObservableObject {
    let difficulty: Int
    @Published var board: Board = Board() {}
    @Published var taps: Int = 0
    
    init(_ difficulty: Int = 5) {
        self.difficulty = difficulty
        self.taps = 0
        self.board = Board() {
            self.taps += 1
        }
        new()
        self.taps = 0
    }
    
    private func new() {
        let swipes = (0...(board.height * board.width - 1)).shuffled()[0..<difficulty]
        for swipe in swipes {
            let x = swipe % board.width
            let y = swipe / board.height
            board.tap(x, y)
        }
    }
    
    private func win() -> Bool {
        return board._board.allSatisfy({$0.allSatisfy({!$0.value})})
    }
}


struct FiveTilesView: View {
    @StateObject var game: FiveTiles
    
    var body: some View {
        VStack {
            Title("Tap: \(game.taps)")
            Spacer()
            BoardView(board: game.board).aspectRatio(contentMode: .fit).padding()
            Spacer()
        }
    }
}

struct FiveTilesView_Previews: PreviewProvider {
    static var previews: some View {
        FiveTilesView(game: FiveTiles())
    }
}
