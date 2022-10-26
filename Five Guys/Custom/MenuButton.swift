//
//  MenuButton.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 26/10/22.
//

import SwiftUI


extension View {
  @inlinable
  public func reverseMask<Mask: View>(
    alignment: Alignment = .center,
    @ViewBuilder _ mask: () -> Mask
  ) -> some View {
    self.mask {
      Rectangle()
        .overlay(alignment: alignment) {
          mask()
            .blendMode(.destinationOut)
        }
    }
  }
}

struct MenuButton: View {
    let title: String
    let icon: String?
    
    init(_ title: String, icon: String? = nil) {
        self.title = title
        self.icon = icon
    }
    
    var body: some View {
        ZStack {
            var rect = RoundedRectangle(cornerRadius: 25)
                .frame(width: 340, height: 130)
            if (icon != nil){
                rect.reverseMask{
                    Image(icon!)
                        .offset(x: -70)
                }
            } else {
                rect
            }
            Text(title)
                .font(.system(size: (icon != nil) ? 30 : 40, weight: .bold, design: .rounded))
                .offset(x: (icon != nil) ? 70 : 0)
                .foregroundColor(.white)
        }
    }
}

struct MenuButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            VStack {
                MenuButton("GAMES", icon: "controller")
                MenuButton("LEVEL 1")
            }
        }
    }
}
