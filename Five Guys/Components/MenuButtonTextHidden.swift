//
//  MenuButtonTextHidden.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 31/10/22.
//

import SwiftUI

struct MenuButtonTextHidden: View {
    @ObservedObject var model: ViewModel
    
    init(model: ViewModel) {
        self.model = model
    }
    
    var body: some View {
        ZStack {
            MenuButtonText(model.title, subtitle: model.subtitle)
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

struct MenuButtonTextHidden_Previews: PreviewProvider {
    @ObservedObject static var model = MenuButtonTextHidden.ViewModel("PLAy")
    
    static var previews: some View {
        ZStack {
            Background()
            MenuButtonTextHidden(model: model)
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
