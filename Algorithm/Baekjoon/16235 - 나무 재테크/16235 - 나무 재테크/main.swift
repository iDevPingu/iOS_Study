//
//  main.swift
//  16235 - 나무 재테크
//
//  Created by Ick on 2021/03/17.
//

import Foundation

// 답은 맞는데 입출력 함수의 속도 때문에 시간초과가 뜸
func solution() {
    let firstLine = readLine()!.split(separator: " ").map({Int(String($0))!})
    let n = firstLine[0]
    let m = firstLine[1]
    let k = firstLine[2]
    
    var foodMap: [[Int]] = []
    for _ in 0..<n {
        foodMap.append(readLine()!.split(separator: " ").map({Int(String($0))!}))
    }
    var nowFoodMap = [[Int]](repeating: [Int](repeating: 5, count: n), count: n)
    var treeMap: [[[Int]]] = [[[Int]]](repeating: [[Int]](repeating: [], count: n), count: n)
    for _ in 0..<m {
        let tree = readLine()!.split(separator: " ").map({Int(String($0))!})
        treeMap[tree[0]-1][tree[1]-1].append(tree[2])
    }
    
    var year: Int = 0
    let nearPosition: [(Int, Int)] = [(-1,-1), (-1,0), (-1,1), (0,-1), (0,1), (1,-1), (1,0), (1,1)]
    while year < k {
        year += 1
        // 봄, 여름
        for i in 0..<n {
            for j in 0..<n {
                var aliveTree: [Int] = []
                while true {
                    if treeMap[i][j].isEmpty {
                        break
                    }
                    treeMap[i][j].sort(by: >)
                    if treeMap[i][j].last! > nowFoodMap[i][j] {
                        // 양분이없어 이제 앞의 것들은 모두 죽어서 양분이됨
                        var sum: Int = 0
                        for k in 0..<treeMap[i][j].count {
                            sum += treeMap[i][j][k] / 2
                        }
                        nowFoodMap[i][j] += sum
                        treeMap[i][j] = []
                        break
                    } else {
                        // 마지막거 팝! 한 뒤 땅의 양분 빼고 한살 추가하여 생존 나무에 추가
                        let growTree = treeMap[i][j].popLast()!
                        nowFoodMap[i][j] -= growTree
                        aliveTree.append(growTree + 1)
                    }
                }
                if aliveTree.isEmpty {
                    continue
                } else {
                    treeMap[i][j] = aliveTree
                }
            }
        }
        // 가을
        for i in 0..<n {
            for j in 0..<n {
                for k in 0..<treeMap[i][j].count {
                    if treeMap[i][j][k] % 5 == 0 {
                        for p in 0..<8 {
                            let newX = j + nearPosition[p].1
                            let newY = i + nearPosition[p].0
                            if newX < 0 || newY < 0 || newX >= n || newY >= n {
                                continue
                            } else {
                                treeMap[newY][newX].append(1)
                            }
                        }
                    }
                }
            }
        }
        
        // 겨울
        for i in 0..<n {
            for j in 0..<n {
                nowFoodMap[i][j] += foodMap[i][j]
            }
        }
    }
    
    var treeCount: Int = 0
    for i in 0..<n {
        for j in 0..<n {
            treeCount += treeMap[i][j].count
        }
    }
    print(treeCount)
}
solution()
