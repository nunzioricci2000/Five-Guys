//
//  Popup.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 27/10/22.
//

import SwiftUI

struct Popup: View {
    var line1, line2: String
    var label1, label2: String
    var onTap1, onTap2: () -> ()
    
    var body: some View {
        ZStack {
            Color.white.opacity(0.5)
            VStack {
                Spacer()
                Subtitle(line1)
                Subtitle(line2)
                Spacer()
                HStack {
                    Subtitle(label1)
                        .onTapGesture(perform: onTap1)
                        .padding()
                    Spacer()
                    Subtitle(label2)
                        .onTapGesture(perform: onTap2)
                        .padding()
                }
            }.frame(width: 200, height: 125)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color("main"), lineWidth: 5)
                )
        }
    }
}

struct Popup_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BoardView(board: Board() {})
                .blur(radius: 10)
            Popup(line1: "Level Complete", line2: "Taps done: 36", label1: "Home", label2: "Next", onTap1: {}, onTap2: {})
        }
    }
}
