//
//  utils.swift
//  advent-of-code
//
//  Created by Frank Anderson on 12/7/22.
//

import Foundation

/// Get the substring of strings more easily
/// - Parameters:
///   - str: string to take a part of
///   - from: starting index
///   - upto: up to ending index. the char at this index is not included
/// - Returns: a substring of the given string from the start to the end (inclusive, exclusive)
func substring(of str: String, from: Int = -1, upto: Int = -1) -> String {
    var start = from
    if from < 0 {
        start = 0
    }

    var end = upto
    if end < 0 {
        end = str.count + end
    }
    
    let removeStart = str
        .suffix(str.count - start)
        .prefix(end - start)
    return String(removeStart)
}


/// Print 2D arrays in an easier-to-read fashion
/// - Parameter twoD: a 2d array of elements
func print<T: CustomStringConvertible>(_ twoD: [[T]]) {
    var out = ""
    for row in twoD {
        for col in row {
            out += col.description + " "
        }
        out.removeLast()
        out += "\n"
    }
    print(out)
}
