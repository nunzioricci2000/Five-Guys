//
//  HisoryField.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 27/10/22.
//

import SwiftUI

struct HisoryField: View {
    var level, taps: Int
    
    init(_ level: Int,_ taps: Int) {
        self.level = level
        self.taps = taps
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .cornerRadius(20)
                .foregroundColor(Color("main"))
                .padding(10)
                .frame(width: 300, height: 100)
            HStack {
                Text("LEVEL: \( level )")
                    .font(.system(size: 20, design: .rounded))
                    .foregroundColor(Color("background"))
                    .fontWeight(.semibold).padding(5)
                Text("TAPS: \( taps )")
                    .font(.system(size: 20, design: .rounded))
                    .foregroundColor(Color("background"))
                    .fontWeight(.semibold)
                    .padding(5)
            }
        }
    }
}

struct HisoryField_Previews: PreviewProvider {
    static var previews: some View {
        HisoryField(10, 34)
    }
}
