//
//  MemoryHandler.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 27/10/22.
//

import SwiftUI

extension String {
    var isNumber: Bool {
        return self.range(
            of: "^[0-9]*$", // 1
            options: .regularExpression) != nil
    }
}

struct Memory {
    
    static private let defaults = UserDefaults.standard
    
    static func isSet(_ key: String) -> Bool {
        return defaults.string(forKey: key) != nil
    }
    
    struct Level {
        private(set) var num: Int
        private(set) var tap: Int
        public static let CURRENT = 0
        public static let NULL_LEVEL = Level(num: 0, tap: 0)
        
        func toString() -> String {
            return "\(num):\(tap)"
        }
        
        static func fromString(_ str: String) -> Level {
            let comp = str.components(separatedBy: ":")
            guard comp.count == 2 else {
                return NULL_LEVEL
            }
            guard comp[0].isNumber, comp[1].isNumber else {
                return NULL_LEVEL
            }
            let num, tap: Int
            num = Int(comp[0])!
            tap = Int(comp[1])!
            return Level(num: num,tap: tap)
        }
        
        func save(asCurrent cur: Bool = false) {
            defaults.set(cur ? self : tap, forKey: cur ? "currentLevel" : "level\(num)")
        }
        
        static func load(_ num: Int) -> Level {
            let tap = Int(defaults.string(forKey: "level\( num )") ?? "0")!
            return Level(num: num, tap: tap)
        }
        
        static func load() -> Level {
            let str: String = defaults.string(forKey: "currentLevel") ?? "1:0"
            return fromString(str)
        }
    }
    
    static var currentLevel: Int {
        get {
            return Level.load().num
        }
    }
}
