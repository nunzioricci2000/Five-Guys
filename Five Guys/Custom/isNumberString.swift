//
//  isNumberString.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 27/10/22.
//

extension String {
    var isNumber: Bool {
        return self.range(
            of: "^[0-9]*$", // 1
            options: .regularExpression) != nil
    }
}
