//
//  main.swift
//  [Kakao] 2019 Blind - 무지의 먹방 라이브
//
//  Created by Ick on 2021/04/19.
//

import Foundation

func solution(_ food_times:[Int], _ k:Int64) -> Int {
    var foodTimes = food_times
    foodTimes.sort(by: >)
    var time: Int64 = 0
    while time < k && !foodTimes.isEmpty {
        let now = foodTimes.popLast()!
        
        time += Int64(now) * Int64(foodTimes.count)
    }
    
    print(foodTimes)
    
    
    return 0
}

print(solution([3,1,2], 5))
print(solution([8,6,4], 15))
print(solution([946, 314, 757, 322, 559, 647, 983, 482, 145], 1833))
