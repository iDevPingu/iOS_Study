//
//  main.swift
//  2156 - 포도주 시식
//
//  Created by Ick on 2020/10/09.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

func solution() -> Int {
    let n = Int(String(readLine()!))!
    var wine: [Int] = []
    
    for _ in 0..<n{
        wine.append(Int(String(readLine()!))!)
    }
    
    if n == 1 {
        return wine[0]
    } else if n == 2 {
        return wine[0] + wine[1]
    } else if n == 3 {
        return max(wine[0] + wine[1], wine[1] + wine[2], wine[0] + wine[2])
    } else {
        var drink: [Int] = [Int](repeating: 0, count: n)
        drink[0] = wine[0]
        drink[1] = wine[0] + wine[1]
        drink[2] = max(wine[0] + wine[1], wine[1] + wine[2], wine[0] + wine[2])
        
        for i in 3..<n{
            drink[i] = max(drink[i-2] + wine[i], drink[i-3] + wine[i-1] + wine[i])
            drink[i] = max(drink[i], drink[i-1])
        }
        // drink[n] = drink[n-2] + wine[n]
        // drink[n] = drink[n-3] + wine[n-1] + wine[n]
//        print(drink)
        return drink.max()!
    }
}
print(solution())
