//
//  MenuButtonRect.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 31/10/22.
//

import SwiftUI

struct MenuButtonRect: View {
    @ObservedObject var model: ViewModel
    
    init(model: ViewModel) {
        self.model = model
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color("main"))
                .frame(width: 300, height: 100)
                .zIndex(0)
            if !model.pressed {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color("main"))
                    .frame(width: 290, height: 90)
                    .zIndex(1)
                    .blendMode(.destinationOut)
                    .transition(.scale)
            }
        }.compositingGroup()
    }
}

struct MenuButtonRect_Previews: PreviewProvider {
    @ObservedObject static var model = MenuButtonRect.ViewModel()
    
    static var previews: some View {
        ZStack {
            Background()
            MenuButtonRect(model: model)
        }.simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged({_ in
                    withAnimation {
                        model.pressed = true
                    }
                })
                .onEnded({_ in
                    withAnimation {
                        model.pressed = false
                    }
                })
        )
    }
}
