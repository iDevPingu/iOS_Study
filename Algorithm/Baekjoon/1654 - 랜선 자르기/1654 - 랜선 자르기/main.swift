//
//  main.swift
//  1654 - 랜선 자르기
//
//  Created by Ick on 2020/08/29.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation
func solution() -> Int {
    let firstLine = readLine()!.split(separator: " ").map({Int($0)!})
    let k = firstLine[0]
    let n = firstLine[1]
    
    var lines = [Int]()
    for _ in 0..<k{
        lines.append(Int(readLine()!)!)
    }
    
    var first = 1
    var last = lines.max()!
    
    var result = 0

    while (first <= last){
        let middle = (first + last) / 2
        var temp = 0
        for line in lines{
            temp += line / middle
        }
        
        if temp >= n{
           if result < middle{
                result = middle
            }
            first = middle + 1
        } else {
            last = middle - 1
        }
    }

    return result
}

print(solution())
