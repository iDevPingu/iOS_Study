//
//  main.swift
//  KaKao2019_실패율
//
//  Created by Ick on 2020/08/30.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    
    var fail = [Int:Double]()
    
    for i in 1...N{
        let a = stages.filter { $0 >= i }.count
        let b = a - stages.filter { $0 > i }.count
        let failCount = Double(b) / Double(a)
        
        fail[i] = failCount
    }
    
    let end = fail.sorted(by: <).sorted(by: {$0.value > $1.value})
    let result = end.map{$0.key}
    
    return result
}

print(solution(5, [2,1,2,6,2,4,3,3]))
print(solution(4, [4,4,4,4,4]))
