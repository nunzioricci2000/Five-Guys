//
//  FiveTilesView.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 21/10/22.
//

import SwiftUI

struct Tile {
    private var _value = false
    let position: (Int, Int)
    
    init(_ x: Int, _ y: Int) {
        position = (x, y)
    }
    
    mutating func invert() {
        _value = !_value
    }
    
    func value() -> Bool {
        return _value
    }
}

struct TileView: View {
    @Binding var tile: Tile
    @Binding var board: Board
    var body: some View {
        Rectangle()
            .fill(tile.value() ? .yellow : .gray)
            .onTapGesture {
                board.tap(tile.position)
            }
    }
}

struct Board {
    var _board: [[Tile]] = [[Tile]]()
    var width, height: Int
    
    init(_ width: Int = 5,_ height: Int = 5) {
        self.width = width
        self.height = height
        _board = Array(repeating: Array(repeating: Tile(0,0), count:width), count: height)
        for x in (0..<width) {
            for y in (0..<height) {
                _board[y][x] = Tile(x,y)
            }
        }
    }
    
    mutating func tap(_ x: Int, _ y: Int) {
        guard (0...width-1).contains(x), (0...height-1).contains(y) else {
            return
        }
        
        _board[y][x].invert()
        if (1..<width).contains(x) {
            _board[y][x-1].invert()
        }
        if (0..<(width-1)).contains(x) {
            _board[y][x+1].invert()
        }
        if (1..<width).contains(y) {
            _board[y-1][x].invert()
        }
        if (0..<(height-1)).contains(y) {
            _board[y+1][x].invert()
        }
    }
    
    mutating func tap(_ position: (Int, Int)) {
        tap(position.0, position.1)
    }
}

struct BoardView: View {
    @State var board: Board
    
    var body: some View {
        VStack {
            ForEach((0..<board.height), id: \.self) { y in
                HStack {
                    ForEach(0..<board.width, id: \.self) { x in
                        TileView(tile: $board._board[y][x], board: $board)
                    }
                }
            }
        }
    }
}

struct Game {
    enum GameState {
        case play, end
    }
    let difficulty: Int
    var board: Board
    var state: GameState = .play
    init(_ difficulty: Int = 5) {
        self.difficulty = difficulty
        self.board = Board(10,10)
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
        if board._board.allSatisfy({$0.allSatisfy({!$0.value()})}) {
            state = .end
        }
    }
}

struct FiveTilesView: View {
    @State var game = Game(50)
    
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
