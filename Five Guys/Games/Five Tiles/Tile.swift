//
//  Tile.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 22/10/22.
//

import SwiftUI

struct Tile {
    var value: Bool
    let position: (Int, Int)?
    
    init(_ x: Int? = nil, _ y: Int? = nil, value: Bool = false) {
        if x != nil, y != nil {
            position = (x!, y!)
        } else {
            position = nil
        }
        self.value = value
    }
    
    mutating func invert() {
        value = !value
    }
}

struct TileView: View {
    @Binding var tile: Tile
    @Binding var board: Board?
    var corners: UIRectCorner = []
    var body: some View {
        RoundedCornersShape(corners: corners, radius: 100)
            .fill((tile.value ? Color.yellow : .gray).gradient)
            .onTapGesture {
                if tile.position != nil {
                    board!.tap(tile.position!)
                } else {
                    tile.invert()
                }
            }.aspectRatio(contentMode: .fit)
            .cornerRadius(10)
    }
}

struct TileView_Previews: PreviewProvider{
    @State static var active = Tile(value: true)
    @State static var inactive = Tile()
    @State static var board: Board? = nil
    
    static var previews: some View {
        VStack {
            Text("Tiles").font(.title)
            Spacer()
            HStack {
                TileView(tile: $active, board: $board)
                TileView(tile: $active, board: $board, corners: [.topLeft])
                TileView(tile: $active, board: $board, corners: [.topRight])
                TileView(tile: $active, board: $board, corners: [.bottomRight])
                TileView(tile: $active, board: $board, corners: [.bottomLeft])
            }
            HStack {
                TileView(tile: $inactive, board: $board)
                TileView(tile: $inactive, board: $board, corners: [.topLeft])
                TileView(tile: $inactive, board: $board, corners: [.topRight])
                TileView(tile: $inactive, board: $board, corners: [.bottomRight])
                TileView(tile: $inactive, board: $board, corners: [.bottomLeft])
            }
            Spacer()
        }.padding()
    }
}
