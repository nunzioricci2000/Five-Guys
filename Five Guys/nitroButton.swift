//
//  nitroButton.swift
//  Five Guys
//
//  Created by Marina Fusco on 26/10/22.
//

import SwiftUI

struct nitroButton: View {
    @State private var nitroOn = false
    var body: some View {
        VStack {
            Toggle ("Nitro Mode", isOn: $nitroOn).toggleStyle(SwitchToggleStyle(tint: Color("9")))
        } .padding(140)
            .offset(y: 350)
    }
}

struct nitroButton_Previews: PreviewProvider {
    static var previews: some View {
        nitroButton()
    }
}
