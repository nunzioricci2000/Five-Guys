//
//  HomeView.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 26/10/22.
//

import SwiftUI

precedencegroup PowerPrecedence { higherThan: MultiplicationPrecedence }
infix operator ^^ : PowerPrecedence
func ^^ (radix: Int, power: Int) -> Int {
    return Int(pow(Double(radix), Double(power)))
}

let totalLevels: Int = 2 ^^ 25 - 1

struct HomeView: View {
    @EnvironmentObject var handler: PageHandler
    
    var body: some View {
        ZStack {
            Color
                .white
                .opacity(0)
                .ignoresSafeArea()
            VStack {
                Title("Five Tiles")
                    .padding(.bottom, 10)
                Subtitle("Level 1 / \(totalLevels)")
                Spacer()
                MenuButton("PLAY")
                    .onTapGesture {
                        withAnimation {
                            handler.page = .game(1)
                        }
                    }.padding(40)
                MenuButton("HISTORY")
                    .onTapGesture {
                        withAnimation {
                            handler.page = .history
                        }
                    }.padding(40)
                Spacer()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
