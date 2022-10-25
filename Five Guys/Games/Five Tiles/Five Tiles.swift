//
//  Five Tiles.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 22/10/22.
//

import SwiftUI

struct FiveTiles {
    enum GameState {
        case play, end
    }
    let difficulty: Int
    var board: Board
    var state: GameState = .play
    init(_ difficulty: Int = 5) {
        self.difficulty = difficulty
        self.board = Board(7,7)
        new()
    }
    
    private mutating func new() {
        let swipes = (0...(board.height * board.width - 1)).shuffled()[0..<difficulty]
        for swipe in swipes {
            let x = swipe % board.width
            let y = swipe / board.height
            board.tap(x, y)
        }
    }
    
    mutating private func checkWin() {
        if board._board.allSatisfy({$0.allSatisfy({!$0.value})}) {
            state = .end
        }
    }
    
}

struct FiveTilesView: View {
    @State var game = FiveTiles(25)
    
    var body: some View {
        VStack {
            Text("Five Tiles")
                .font(.title)
            Spacer()
            BoardView(board: game.board)
            .aspectRatio(contentMode: .fit)
                .padding()
            Spacer()
        }
    }
}

struct FiveTilesView_Previews: PreviewProvider {
    static var previews: some View {
        FiveTilesView()
    }
}
