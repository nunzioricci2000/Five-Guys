//
//  MemoryHandler.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 27/10/22.
//

import SwiftUI

class LevelInfo: ObservableObject {
    @Published private(set) var num: Int
    @Published private(set) var tap: Int
    
    init(num: Int, tap: Int) {
        self.num = num
        self.tap = tap
    }
    
    init?(_ str: String) {
        let comp = str.components(separatedBy: ":")
        guard comp.count == 2 else {
            return nil
        }
        guard comp[0].isNumber, comp[1].isNumber else {
            return nil
        }
        self.num = Int(comp[0])!
        self.tap = Int(comp[1])!
    }
    
    func toString() -> String {
        return "\(num):\(tap)"
    }
    
    func save() {
        Memory.handler.save(self)
    }
    
    static func load(_ index: Int) -> LevelInfo {
        return Memory.handler.load(index)
    }
    
    var next: LevelInfo {
        get {
            return LevelInfo.load(num+1)
        }
    }
}

class Memory: ObservableObject {
    private(set) static var handler = Memory()
    private init() {}
    
    @Published var accesses:Int = 0
    
    func write(_ text: String,forKey key: String) {
        accesses += 1
        UserDefaults.standard.set(text, forKey: key)
    }
    
    func read(_ key: String) -> String? {
        accesses += 1
        return UserDefaults.standard.string(forKey: key)
    }
    
    func save(_ level: LevelInfo) {
        Memory.handler.write("\( level.tap )", forKey: "level\( level.num )")
    }
    
    func load(_ index: Int) -> LevelInfo {
        let str = read("level\( index )")
        return LevelInfo(num: index, tap: Int(str ?? "0") ?? 0)
    }
    
    var current: LevelInfo {
        get {
            let str = read("current")
            if str == nil {
                return LevelInfo(num: 1, tap: 0)
            }
            return LevelInfo(str!)!
        }
        set {
            write(newValue.toString(), forKey: "current")
        }
    }
    
    var levels: [LevelInfo] {
        get {
            var i: Int = 1
            var result = [LevelInfo]()
            while true {
                let level: LevelInfo = load(i)
                if level.tap == 0 {
                    break
                }
                result.append(level)
                i += 1
            }
            return result
        }
    }
    
    
}
