//
//  InfoButton.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 28/10/22.
//

import SwiftUI

struct InfoButton: View {
    @State var showModal: Bool = false
    
    var body: some View {
        Button {
            showModal = true
        } label: {
            Image(systemName: "info.circle")
                .font(.system(size: 50, design: .rounded))
                .foregroundColor(Color("main"))
        }.sheet(isPresented: $showModal) {
            ShowModal()
        }
    }
}

struct InfoButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Background()
            InfoButton()
        }
    }
}
