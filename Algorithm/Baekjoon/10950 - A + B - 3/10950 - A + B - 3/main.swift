//
//  main.swift
//  10950 - A + B - 3
//
//  Created by Ick on 2021/02/27.
//

import Foundation

func solution() {
    let t = Int(String(readLine()!))!
    
    for _ in 0..<t {
        let ab = readLine()!.split(separator: " ").map({Int(String($0))!})
        
        print(ab[0] + ab[1])
    }
}

solution()
