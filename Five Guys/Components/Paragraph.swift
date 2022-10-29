//
//  Paragraph.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 29/10/22.
//

import SwiftUI

struct Paragraph: View {
    @State var text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .foregroundColor(Color("main"))
            .font(.system(size: 18, design: .rounded))
            .fontWeight(.medium)
    }
}

struct Paragraph_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Background()
            Paragraph("Ciao mondo")
        }
    }
}
