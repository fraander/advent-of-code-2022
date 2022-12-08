//
//  Challenge.swift
//  advent-of-code
//
//  Created by Frank Anderson on 12/1/22.
//

import Foundation

protocol Challenge {
    static func run(input: String) -> String
    
    static func check() -> Bool
}
