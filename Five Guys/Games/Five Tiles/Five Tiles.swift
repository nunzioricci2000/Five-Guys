//
//  Five Tiles.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 22/10/22.
//

import SwiftUI

@MainActor
class FiveTiles: ObservableObject {
    let level: Int
    @Published var board: Board = Board() {}
    @Published var taps: Int = 0
    
    init(_ difficulty: Int = 5) {
        self.level = difficulty
        self.taps = 0
        self.board = Board() {
            self.taps += 1
            if self.win() {
                self.onWin()
            }
        }
        new()
        self.taps = 0
    }
    
    private func new() {
        let swipes = (0...(board.height * board.width - 1)).shuffled()[0..<level]
        for swipe in swipes {
            let x = swipe % board.width
            let y = swipe / board.height
            board.tap(x, y)
        }
    }
    
    func win() -> Bool {
        return board._board.allSatisfy({$0.allSatisfy({!$0.value})})
    }
    
    private func onWin() {
        for x in (0..<board.width) {
            for y in (0..<board.height) {
                board._board[y][x].onTap = {}
            }
        }
    }
}


struct FiveTilesView: View {
    @EnvironmentObject var handler: PageHandler
    @StateObject var game: FiveTiles
    
    var body: some View {
        ZStack {
            VStack {
                Title("Tap: \(game.taps)")
                Spacer()
                BoardView(board: game.board)
                    .aspectRatio(contentMode: .fit)
                    .padding()
                Spacer()
            }.blur(radius: game.win() ? 10 : 0)
            if game.win() {
                Popup(line1: "Level complete", line2: "Taps done: \(game.taps)", label1: "Home", label2: "Next", onTap1: {
                    withAnimation {
                        handler.page = .home
                    }
                }, onTap2: {
                    withAnimation {
                        handler.page = .game(2)
                    }
                })
            }
        }
    }
}

struct FiveTilesView_Previews: PreviewProvider {
    static var previews: some View {
        FiveTilesView(game: FiveTiles())
    }
}
