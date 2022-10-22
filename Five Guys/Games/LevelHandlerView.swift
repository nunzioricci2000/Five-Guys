//
//  LevelHandlerView.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 20/10/22.
//

import SwiftUI

struct LevelHandlerView: View {
    let id : Int
    
    var body: some View {
        Text("Level: \(id)")
    }
}

struct LevelHandlerView_Previews: PreviewProvider {
    static var previews: some View {
        LevelHandlerView(id: 1)
    }
}
