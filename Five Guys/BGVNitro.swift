//
//  BGVNitro.swift
//  Five Guys
//
//  Created by Marina Fusco on 26/10/22.
//

import SwiftUI

struct BGVNitro: View {
    var body: some View {
        ZStack{
            LinearGradient(colors: [
                Color("7"), Color("8"), Color("9"), Color ("10"), Color("11") ], startPoint: .topTrailing, endPoint: .bottomLeading).ignoresSafeArea()
            nitroButton()
        }
    }
}

struct BGVNitro_Previews: PreviewProvider {
    static var previews: some View {
        BGVNitro()
    }
}

