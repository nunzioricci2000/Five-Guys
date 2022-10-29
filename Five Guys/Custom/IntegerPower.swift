//
//  IntegerPower.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 28/10/22.
//

import Foundation

precedencegroup PowerPrecedence { higherThan: MultiplicationPrecedence }
infix operator ^^ : PowerPrecedence
func ^^ (radix: Int, power: Int) -> Int {
    return Int(pow(Double(radix), Double(power)))
}
