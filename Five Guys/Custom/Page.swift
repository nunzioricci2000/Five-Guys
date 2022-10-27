//
//  Page.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 26/10/22.
//

import SwiftUI

enum Page {
    case home, game(Int), history
}

@MainActor
class PageHandler: ObservableObject {
    @Published var page: Page = .home
}
