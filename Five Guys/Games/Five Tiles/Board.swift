//
//  Board.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 22/10/22.
//

import SwiftUI

struct Board {
    var _board: [[Tile]] = [[Tile]]()
    var width, height: Int
    var taps: Binding<Int>? = nil
    
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
    
    mutating private func tap(x: Int, y: Int) {
        tap(x, y)
        taps?.wrappedValue += 1
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
                        TileView(tile: $board._board[y][x], board: Binding<Board?>($board), corners: roundedCorners(x, y))
                    }
                }
            }
        }
    }
    
    func roundedCorners(_ x: Int, _ y: Int) -> UIRectCorner {
        var result = [UIRectCorner]()
        if x == 0, y == 0 {
            result.append(.topLeft)
        }
        if x == board.width-1, y == 0 {
            result.append(.topRight)
        }
        if x == board.width-1, y == board.height-1 {
            result.append(.bottomRight)
        }
        if x == 0, y == board.height-1 {
            result.append(.bottomLeft)
        }
        return UIRectCorner(result)
    }
}

struct BoardView_Previews: PreviewProvider{
    @State static var board: Board = Board()
    
    static var previews: some View {
        VStack {
            Text("Tiles").font(.title)
            Spacer()
            BoardView(board: board)
            Spacer()
        }.padding()
    }
}

