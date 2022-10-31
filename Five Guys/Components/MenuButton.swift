//
//  MenuButton.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 27/10/22.
//

import SwiftUI

struct MenuButton: View {
    @ObservedObject var viewModel: ViewModel = ViewModel()
    
    init(_ title: String, subtitle: String = "") {
        viewModel.title = title
        viewModel.subtitle = subtitle
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color("main").opacity(0.0001))
                .frame(width: 300, height: 100)
            
            ZStack {
                ZStack {
                    MenuButtonText(viewModel.title, subtitle: viewModel.subtitle)
                        .zIndex(0)
                    MenuButtonRect(model: MenuButtonRect.ViewModel(pressed: viewModel.pressed))
                        .blendMode(.destinationOver)
                        .zIndex(1)
                }.compositingGroup()
                    .zIndex(0)
                MenuButtonTextHidden(model: MenuButtonTextHidden.ViewModel(viewModel.title, subtitle: viewModel.subtitle, pressed: viewModel.pressed)).zIndex(1)
                    .blendMode(.destinationOut)
            }.compositingGroup()
        }.simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged({_ in
                    withAnimation {
                        viewModel.pressed = true
                    }
                })
                .onEnded({_ in
                    withAnimation {
                        viewModel.pressed = false
                    }
                })
        )
    }
}

struct MenuButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Background()
            VStack {
                Spacer()
                MenuButton("PLAY!")
                MenuButton("PLAY",subtitle: "Level: 13")
                Spacer()
            }
        }
    }
}
