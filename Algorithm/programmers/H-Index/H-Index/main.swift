//
//  main.swift
//  H-Index
//
//  Created by Ick on 2020/11/09.
//

import Foundation

func solution(_ citations:[Int]) -> Int {
    
    let a = citations.sorted(by: >)
    var result = 0
    print(a)
    for i in 0..<a.count {
        if i + 1 <= a.count - i {
            result = i + 1
        } else {
            break
        }
    }
    return result
}

print(solution([3,0,6,1,5]))
//print(solution([31,66]))
