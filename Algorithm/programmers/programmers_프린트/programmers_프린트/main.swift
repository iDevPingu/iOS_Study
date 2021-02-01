//
//  main.swift
//  programmers_프린트
//
//  Created by Ick on 2020/07/15.
//  Copyright © 2020 Ick. All rights reserved.
//

import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var priorities = priorities
    var complete = [Int]()
    var completeindex = [Int]()
    var stack = [Int]()
    
    for index in 0..<priorities.count{
        let nowmax = priorities.max()!
        let now = priorities.remove(at: 0)
        if now >= nowmax {
            complete.append(now)
            completeindex.append(index)
        } else{
            stack.append(index)
            priorities.append(now)
        }
    }
    while priorities.count != 0{
        for _ in 0..<priorities.count{
            if priorities[0] >= priorities.max()! {
                complete.append(stack.remove(at: 0))
                priorities.remove(at: 0)
            }
            else{
                stack.append(stack.remove(at: 0))
                priorities.append(priorities.remove(at: 0))
            }
        }
    }
    
    for index in 0..<completeindex.count{
        if completeindex[index] == location{
            return index + 1
        }
    }
    return 0
}

print(solution([2,1,3,2],2))

