//
//  main.swift
//  [Kakao] 2019 Winter Intern - 징검다리 건너기
//
//  Created by Ick on 2021/04/05.
//

import Foundation
func solution(_ stones:[Int], _ k:Int) -> Int {
    var left: Int = 1
    var right = 200000000
    
    while left <= right {
        let mid = (left + right) / 2
        var temp = stones
        for i in 0..<temp.count {
            temp[i] -= mid
        }
        
        var count = 0
        var check: Bool = false
        for i in 0..<temp.count {
            if temp[i] <= 0 {
                count += 1
            } else {
                count = 0
            }
            
            if count >= k {
                check = true
                break
            }
        }
        if check {
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    
    return left
}

print(solution([2,4,5,3,2,1,4,2,5,1], 3))
