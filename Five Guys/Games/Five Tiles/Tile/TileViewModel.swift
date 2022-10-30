//
//  Tile.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 22/10/22.
//

import SwiftUI

@MainActor
class TileViewModel: ObservableObject {
    @Published var value: Bool
    @Published var corners: UIRectCorner = []
    @Published var onTap: (() -> ())?
    
    init(value: Bool = false, corners: UIRectCorner = [], onTap: Optional<() -> ()> = nil) {
        self.value = value
        self.corners = corners
        self.onTap = onTap
    }
    
    func flip() {
        value = !value
    }
}
