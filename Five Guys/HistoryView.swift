//
//  HistoryView.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 27/10/22.
//

import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var handler: PageHandler
    
    var body: some View {
        VStack {
            HStack {
                BackIcon()
                    .onTapGesture {
                        withAnimation {
                            handler.page = .home
                        }
                    }
                Spacer()
            }
            Spacer()
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Spacer()
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
