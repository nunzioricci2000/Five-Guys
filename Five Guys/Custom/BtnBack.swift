//
//  BtnBack.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 24/10/22.
//

import SwiftUI

protocol SecondaryView: View {
    var presentationMode: Binding<PresentationMode> { get set }
}

extension SecondaryView {
    var btnBack : some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image("ic_back") // set image here
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                Text("Go back")
            }
        }
    }
}
