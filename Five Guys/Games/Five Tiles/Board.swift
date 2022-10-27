//
//  Board.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 22/10/22.
//

import SwiftUI

func roundedCorners(x: Int, y: Int, width: Int, height: Int) -> UIRectCorner {
    var result = [UIRectCorner]()
    if x == 0, y == 0 {
        result.append(.topLeft)
    }
    if x == width-1, y == 0 {
        result.append(.topRight)
    }
    if x == width-1, y == height-1 {
        result.append(.bottomRight)
    }
    if x == 0, y == height-1 {
        result.append(.bottomLeft)
    }
    return UIRectCorner(result)
}

@MainActor
class Board: ObservableObject {
    @Published var _board: [[Tile]] = [[Tile]]()
    @Published var width: Int
    @Published var height: Int
    
    init(_ width: Int = 5,_ height: Int = 5, onTap: @escaping () -> ()) {
        self.width = width
        self.height = height
        _board = Array(repeating: Array(repeating: Tile(), count:width), count: height)
        for x in (0..<width) {
            for y in (0..<height) {
                _board[y][x] = Tile(corners: roundedCorners(x: x, y: y, width: width, height: height)) {
                    self.tap(x, y)
                    onTap()
                }
            }
        }
    }
    
    func tap(_ x: Int, _ y: Int) {
        guard (0...width-1).contains(x), (0...height-1).contains(y) else {
            return
        }
        
        _board[y][x].flip()
        if (1..<width).contains(x) {
            _board[y][x-1].flip()
        }
        if (0..<(width-1)).contains(x) {
            _board[y][x+1].flip()
        }
        if (1..<width).contains(y) {
            _board[y-1][x].flip()
        }
        if (0..<(height-1)).contains(y) {
            _board[y+1][x].flip()
        }
    }
    
    func tap(_ position: (Int, Int)) {
        tap(position.0, position.1)
    }
}

struct BoardView: View {
    @StateObject var board: Board
    
    var body: some View {
        VStack {
            ForEach((0..<board.height), id: \.self) { y in
                HStack {
                    ForEach(0..<board.width, id: \.self) { x in
                        TileView(tile: board._board[y][x])
                    }
                }
            }
        }
    }
}

struct BoardView_Previews: PreviewProvider{
    static var previews: some View {
        VStack {
            Text("Tiles").font(.title)
            Spacer()
            BoardView(board: Board() {})
            Spacer()
        }.padding()
    }
}

