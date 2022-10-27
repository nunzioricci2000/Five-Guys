//
//  MemoryHandler.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 27/10/22.
//

import SwiftUI

struct LevelInfo {
    private(set) var num: Int
    private(set) var tap: Int
    
    func toString() -> String {
        return "\(num):\(tap)"
    }
    
    static func fromString(_ str: String) -> LevelInfo? {
        let comp = str.components(separatedBy: ":")
        guard comp.count == 2 else {
            return nil
        }
        guard comp[0].isNumber, comp[1].isNumber else {
            return nil
        }
        let num, tap: Int
        num = Int(comp[0])!
        tap = Int(comp[1])!
        return LevelInfo(num: num,tap: tap)
    }
    
    func save() {
        UserDefaults.standard.set("\(tap)", forKey: "level\( num )")
    }
    
    static func load(_ index: Int) -> LevelInfo? {
        let str = UserDefaults.standard.string(forKey: "level\( index )")
        if str == nil {
            return nil
        }
        return LevelInfo.fromString(str!)
    }
    
    static var current: LevelInfo {
        get {
            let str = UserDefaults.standard.string(forKey: "current")
            if str == nil {
                return LevelInfo(num: 1, tap: 0)
            }
            return LevelInfo.fromString(str!)!
        }
        set {
            UserDefaults.standard.set(newValue.toString(), forKey: "current")
        }
    }
    
    var levels: [LevelInfo] {
        get {
            var i: Int = 1
            var result = [LevelInfo]()
            while let level: LevelInfo = LevelInfo.load(i) {
                result.append(level)
                i += 1
            }
            return result
        }
    }
}

