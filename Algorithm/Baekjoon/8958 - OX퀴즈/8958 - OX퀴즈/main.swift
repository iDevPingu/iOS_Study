//
//  main.swift
//  8958 - OX퀴즈
//
//  Created by Ick on 2020/09/30.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

func solution(){
    let n = Int(readLine()!)!
    
    for _ in 0..<n{
        let line = readLine()!.map({String($0)})
        var count = 1
        var result = 0
        for i in line {
            if i == "O"{
                result += count
                count += 1
            } else if i == "X"{
                count = 1
            }
        }
        print(result)
    }
}
solution()
