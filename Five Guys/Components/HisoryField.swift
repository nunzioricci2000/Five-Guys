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
            HStack {
                Text("LEVEL: \( level )")
                    .font(.system(size: 20, design: .rounded))
                    .foregroundColor(Color("main"))
                    .fontWeight(.semibold).padding(5)
                Text("TAPS: \( taps )")
                    .font(.system(size: 20, design: .rounded))
                    .foregroundColor(Color("main"))
                    .fontWeight(.semibold)
                    .padding(5)
            }
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color("main"), lineWidth: 5)
                .frame(width: 300, height: 100)
        }
    }
}

struct HisoryField_Previews: PreviewProvider {
    static var previews: some View {
        HisoryField(10, 34)
    }
}
