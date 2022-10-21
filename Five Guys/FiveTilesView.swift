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

struct Board {
    var _board: [[Tile?]] = [[Tile?]]()
    var width, height: Int
    
    init(_ width: Int = 5,_ height: Int = 5) {
        self.width = width
        self.height = height
        _board = Array(repeating: Array(repeating: nil, count:width), count: height)
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
        
        switch (x,y) {
        case (1...,_): break
        case (..<width,_): break
        case (_,1...): break
        case (_,..<height):
            _board[y+1][x]?.invert()
        case (_, _):
            _board[y][x]?.invert()
        }
    }
}

struct BoardView: View {
    let board: Board
    
    var body: some View {
        VStack {
            ForEach((0..<board.height), id: \.self) { y in
                HStack {
                    ForEach(0..<board.width, id: \.self) { x in
                        Rectangle()
                            .fill(board._board[y][x]!.value() ? .yellow : .gray)
                    }
                }
            }
        }
    }
}

struct FiveTilesView: View {
    @State var board = Board()
    
    var body: some View {
        VStack {
            Text("Five Tiles")
                .font(.title)
            Spacer()
            BoardView(board: board)
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
