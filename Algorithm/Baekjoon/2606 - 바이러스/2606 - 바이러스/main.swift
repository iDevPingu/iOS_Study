//
//  main.swift
//  2606 - 바이러스
//
//  Created by Ick on 2020/09/05.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

func solution() -> Int{
    
    let comNum = Int(readLine()!)!
    let networkNum = Int(readLine()!)!
    
    var network = [Int:[Int]]()
    
    for num in 1...comNum{
        network[num] = []
    }
    
    for _ in 0..<networkNum{
        let temp = readLine()!.split(separator: " ").map({Int($0)!})
        network[temp[0]]?.append(temp[1])
        network[temp[1]]?.append(temp[0])
    }
    
    var visited: [Int] = []
    // 1번 컴퓨터와 연결된 컴퓨터를 찾아야 하기 때문에 시작점을 1로 정의한다.
    var stack: [Int] = [1]
    
    while stack.count != 0 {
        guard let temp = stack.popLast() else { fatalError() }
        if !visited.contains(temp){
            visited.append(temp)
            guard let temp2 = network[temp] else { fatalError() }
            stack += temp2
        }
        
    }
    
    return visited.count - 1
}

print(solution())
