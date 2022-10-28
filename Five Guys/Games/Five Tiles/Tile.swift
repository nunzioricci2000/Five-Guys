//
//  Tile.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 22/10/22.
//

import SwiftUI

@MainActor
class Tile: ObservableObject {
    @Published var value: Bool
    @Published var corners: UIRectCorner = []
    @Published var onTap: (() -> ())?
    
    init(value: Bool = false, corners: UIRectCorner = [], onTap: Optional<() -> ()> = nil) {
        self.value = value
        self.corners = corners
        self.onTap = onTap
    }
    
    func flip() {
        value = !value
    }
}

struct TileView: View {
    @StateObject var tile: Tile
    
    var body: some View {
        ZStack {
            RoundedCornersShape(corners: tile.corners, radius: 100)
                .fill(Color("main"))
                .cornerRadius(10)
                .zIndex(0)
            if !tile.value {
                RoundedCornersShape(corners: tile.corners, radius: 100)
                    .fill(.white)
                    .cornerRadius(5)
                    .padding(5)
                    .transition(.scale.animation(.linear(duration: 0.2)))
                    .zIndex(1)
                    .blendMode(.destinationOut)
            }
        }.compositingGroup()
        .aspectRatio(contentMode: .fit)
        .onTapGesture(perform: tile.onTap ?? {tile.flip()} )
    }
}

struct TileView_Previews: PreviewProvider{
    
    static var previews: some View {
        ZStack {
            LinearGradient(colors: [Color("BackgroundColorBottomTrailing"), Color("BackgroundColorTopLeading")], startPoint: .bottomTrailing, endPoint: .topLeading)
                .ignoresSafeArea()
            VStack {
                Text("Tiles").font(.title)
                Spacer()
                HStack {
                    TileView(tile: Tile(value: true))
                    TileView(tile: Tile(value: true, corners: [.topLeft]))
                    TileView(tile: Tile(value: true, corners: [.topRight]))
                    TileView(tile: Tile(value: true, corners: [.bottomRight]))
                    TileView(tile: Tile(value: true, corners: [.bottomLeft]))
                }
                HStack {
                    TileView(tile: Tile())
                    TileView(tile: Tile(corners: [.topLeft]))
                    TileView(tile: Tile(corners: [.topRight]))
                    TileView(tile: Tile(corners: [.bottomRight]))
                    TileView(tile: Tile(corners: [.bottomLeft]))
                }
                Spacer()
            }.padding()
        }
    }
}
