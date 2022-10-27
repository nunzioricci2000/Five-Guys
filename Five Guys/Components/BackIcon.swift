//
//  BackIcon.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 27/10/22.
//

import SwiftUI

struct BackIcon: View {
    var body: some View {
        Image(systemName: "xmark")
            .font(.system(size: 40))
            .fontWeight(.medium)
            .padding(20)
    }
}

struct BackIcon_Previews: PreviewProvider {
    static var previews: some View {
        BackIcon()
    }
}
