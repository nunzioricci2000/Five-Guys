//
//  TileView.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 30/10/22.
//

import SwiftUI

struct TileView: View {
    @StateObject var tile: TileViewModel
    
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
                    TileView(tile: TileViewModel(value: true))
                    TileView(tile: TileViewModel(value: true, corners: [.topLeft]))
                    TileView(tile: TileViewModel(value: true, corners: [.topRight]))
                    TileView(tile: TileViewModel(value: true, corners: [.bottomRight]))
                    TileView(tile: TileViewModel(value: true, corners: [.bottomLeft]))
                }
                HStack {
                    TileView(tile: TileViewModel())
                    TileView(tile: TileViewModel(corners: [.topLeft]))
                    TileView(tile: TileViewModel(corners: [.topRight]))
                    TileView(tile: TileViewModel(corners: [.bottomRight]))
                    TileView(tile: TileViewModel(corners: [.bottomLeft]))
                }
                Spacer()
            }.padding()
        }
    }
}
