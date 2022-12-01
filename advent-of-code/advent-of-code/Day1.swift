//
//  Day1.swift
//  advent-of-code
//
//  Created by Frank Anderson on 12/1/22.
//

import Foundation

class Day1: Challenge {
    func run(input: String, output: String) -> Bool {
        
        let split = input.components(separatedBy: "\n") // separate every new line into an element of the array
        
        var queue = [String]()
        var sums = [Int]()
        split.forEach { line in
            if (line.isEmpty) {
                // erase queue, sum and add to answer
                let ints: [Int] = queue.compactMap { str in
                    Int(str)
                } // convert strs to ints
                sums.append(ints.reduce(0, +)) // sum the ints, add to sums
                queue.removeAll() // clear queue
            } else {
                queue.append(line)
            }
        }
        
        let answer = sums.max()
        
        return answer?.description == output
    }
}

let Day1_SampleInput: String = """
1000
2000
3000

4000

5000
6000

7000
8000
9000

10000
"""
// 1st elf has 1000 + 2000 + 3000 = 6000 calories
// 2nd elf has 4000 calories
// 3rd elf has 5000 + 6000 = 11000 calories
// 4th elf has 7000 + 8000 + 9000 = 24000 calories
// 5th elf has 10000 calories

// find the elf carrying the most calories. how many calories is that elf carrying?

let Day1_SampleOutput: String = "24000" // 4th elf has the most, 24000 calories
