//
//  main.swift
//  13458 - 시험 감독
//
//  Created by Ick on 2021/03/15.
//

import Foundation

func solution() {
    let n = Int(String(readLine()!))!
    var a = readLine()!.split(separator: " ").map({Int(String($0))!})
    let thirdLine = readLine()!.split(separator: " ").map({Int(String($0))!})
    let b = thirdLine[0]
    let c = thirdLine[1]
    
    var result: Int = n
    
    for i in 0..<n {
        a[i] -= b
        if a[i] > 0 {
            if a[i] % c == 0 {
                result += (a[i] / c)
            } else {
                result += (a[i] / c) + 1
            }
        }
    }
    
    print(result)
}
solution()
