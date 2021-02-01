//
//  main.swift
//  2748 - 피보나치 수 2
//
//  Created by Ick on 2020/08/04.
//  Copyright © 2020 jaicoco. All rights reserved.
//

import Foundation

guard let n = Int(readLine()!) else { fatalError() }

func fibonacci(_ n: Int) -> Int {
    
    var numbers: Array<Int> = [0,1,1]
    for i in 0...n{
        if i == 0 || i == 1 || i == 2{
            continue
        } else {
            numbers.append(numbers[i-1] + numbers[i-2])
        }
    }
    return numbers[n]
}

print(fibonacci(n))
