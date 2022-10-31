//
//  ShowModal.swift
//  Five Guys
//
//  Created by Vladimiro Andrea Barrella on 28/10/22.
//

import SwiftUI

struct ShowModal: View {
    var body: some View {
        ZStack {
            Foreground()
            ZStack{
                ZStack {
                    Background()
                    Image("maze")
                        .opacity(0.4)
                        .position(x:100, y:320)
                    Image("podium")
                        .opacity(0.4)
                        .offset(x:150, y:230)
                }.zIndex(0)
                ScrollView {
                    VStack{
                        Title("HOW IT WORKS")
                        
                        Spacer(minLength: 50)
                        
                        Subtitle("ABOUT FIVE TILES")
                        Spacer(minLength: 20)
                        Paragraph("The game consists of 25 tiles. Tapping any of the tiles will flip it and the adjacent four tiles. The goal of the puzzle is to switch all the tiles off. To restart the level just go back in the main screen. The taps won’t reset. Can you do it in as few taps as possible?")
                        
                        Spacer(minLength: 50)
                        
                        Subtitle("SCORE")
                        Spacer(minLength: 20)
                        Paragraph("This section helps in keeping track of the levels and the number of taps taken to complete them.")
                    }.padding(33)
                }
                .zIndex(1)
                .blendMode(.destinationOut)
            }.compositingGroup()
        }
    }
}

   

struct ShowModal_Previews: PreviewProvider {
    static var previews: some View {
        ShowModal()
    }
}
