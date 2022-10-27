//
//  GameView.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 26/10/22.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var handler: PageHandler
    
    var body: some View {
        ZStack {
            Color("background").ignoresSafeArea()
            VStack {
                HStack {
                    BackIcon()
                        .onTapGesture {
                            withAnimation {
                                handler.page = .home
                            }
                        }
                    Spacer()
                }
                Spacer()
                FiveTilesView()
                Spacer()
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
