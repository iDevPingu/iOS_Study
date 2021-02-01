//
//  main.swift
//  2839 - 설탕 배달
//
//  Created by Ick on 2020/08/26.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

func solution() -> Int{
    var n = Int(readLine()!)!
    var result = 0
    
    if n % 5 == 0{
        return n / 5
    }
    
    while (n >= 0){
        n -= 3
        result += 1
        if n % 5 == 0{
            return result + (n / 5)
        }
    }
    
    
    return -1
}

print(solution())
