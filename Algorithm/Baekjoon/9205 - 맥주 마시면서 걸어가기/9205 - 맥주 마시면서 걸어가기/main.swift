//
//  main.swift
//  9205 - 맥주 마시면서 걸어가기
//
//  Created by Ick on 2020/12/27.
//

import Foundation

func solution() {
    let t = Int(readLine()!)!
    for _ in 0..<t {
        let n = Int(readLine()!)!
        let housePoint = readLine()!.split(separator: " ").map({Int(String($0))!})
        var shopPoints: [[Int]] = []
        for _ in 0..<n {
            shopPoints.append(readLine()!.split(separator: " ").map({Int(String($0))!}))
        }
        let festivalPoint = readLine()!.split(separator: " ").map({Int(String($0))!})
        
        var nodes: [[Int]] = []
        nodes.append(housePoint)
        nodes += shopPoints
        nodes.append(festivalPoint)
        
        // 좌표마다 경로가 있는지 확인한다
        var canGoTable: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: nodes.count), count: nodes.count)
        for i in 0..<nodes.count {
            for j in 0..<nodes.count {
                if abs(nodes[i][0] - nodes[j][0]) + abs(nodes[i][1] - nodes[j][1]) <= 1000 {
                    canGoTable[i][j] = true
                }
            }
        }
        var result: [Bool] = [Bool](repeating: false, count: canGoTable.count)
        result[0] = true
        
        // 상근이네 집은 0번 인덱스이므로 스택에 0 삽입
        var stack: [Int] = [0]
        // dfs 수행
        while (!stack.isEmpty) {
            let now = stack.popLast()!
            // 현재 좌표에서 갈 수 있는 좌표 탐색
            for i in 0..<canGoTable[now].count {
                // 만약 특정 좌표에 갈 수 있으면서
                if canGoTable[now][i] {
                    // 상근이네 집에서는 특정 좌표로 갈 수 없다면 상근이네 집에서 갈 수 있다고 수정
                    if !result[i] {
                        result[i] = true
                        stack.append(i)
                    }
                }
            }
        }

        // 상근이네 집에서 펜타포스 락 페스티벌로 가는 길이 있다면 happy 출력
        if result[nodes.count - 1] {
            print("happy")
        } else {
            print("sad")
        }
    }
}
solution()

//        print(result)
// 플루이드와샬
//        for k in 0..<canGoTable.count {
//            for i in 0..<canGoTable.count {
//                for j in 0..<canGoTable.count {
//                    if (i == j){
//                        continue
//                    } else if (i == k && j == k) {
//                        continue
//                    }
//                    if !canGoTable[i][j] {
//                        if canGoTable[i][k] && canGoTable[k][j] {
//                            canGoTable[i][j] = true
//                        }
//                    }
//                }
//            }
//        }
