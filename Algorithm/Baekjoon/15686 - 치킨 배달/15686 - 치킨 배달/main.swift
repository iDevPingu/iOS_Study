//
//  main.swift
//  15686 - 치킨 배달
//
//  Created by Ick on 2021/03/10.
//

import Foundation

func solution() {
    let firstLine = readLine()!.split(separator: " ").map({Int(String($0))!})
    let n = firstLine[0]
    let m = firstLine[1]
    
    var townMap: [[Int]] = []
    var chickenMap: [[Int]] = []
    var housePosition: [[Int]] = []
    for i in 0..<n {
        var count: Int = 0
        townMap.append(readLine()!.split(separator: " ").map({ (info) -> Int in
            let info = Int(String(info))!
            if info == 2 {
                chickenMap.append([i, count])
            } else if info == 1 {
                housePosition.append([i, count])
            }
            count += 1
            return info
        }))
    }
    
    var chickenChoose: [[Int]] = []
    var visited: [Bool] = [Bool](repeating: false, count: chickenMap.count)
    var stack: [Int] = []
    
    func dfs(_ index: Int) {
        if stack.count == m {
            // 치킨 거리 구하기 위해 0을 추가
            chickenChoose.append(stack + [0])
            return
        }
        for i in index..<chickenMap.count {
            if !visited[i] {
                visited[i] = true
                stack.append(i)
                dfs(i + 1)
                stack.removeLast()
                visited[i] = false
            }
        }
    }
    // 치킨집을 m개 고르는 모든 경우의 수 구함
    dfs(0)
    
    // m개를 고른 치킨집 위치 조합을 사용하여 각자의 집에서 가장 가까운 치킨집을 찾고 이를 추가
    for i in 0..<chickenChoose.count {
        let chickenCombination = chickenChoose[i]
        for j in 0..<housePosition.count {
            let house = housePosition[j]
            var minDistance: Int = 999999
            for k in 0..<m {
                let chicken = chickenMap[chickenCombination[k]]
                let distance = abs(house[0] - chicken[0]) + abs(house[1] - chicken[1])
                minDistance = min(minDistance, distance)
            }
            chickenChoose[i][m] += minDistance
        }
    }
    chickenChoose.sort { (c1, c2) -> Bool in
        return c1[m] < c2[m]
    }
    print(chickenChoose[0][m])
}

solution()
