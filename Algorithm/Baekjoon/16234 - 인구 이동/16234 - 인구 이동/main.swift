//
//  main.swift
//  16234 - 인구 이동
//
//  Created by Ick on 2021/03/15.
//

import Foundation

func solution() {
    let firstLine = readLine()!.split(separator: " ").map({Int(String($0))!})
    let n = firstLine[0]
    let l = firstLine[1]
    let r = firstLine[2]
    
    var map: [[Int]] = []
    for _ in 0..<n {
        map.append(readLine()!.split(separator: " ").map({Int(String($0))!}))
    }
    var count: Int = 0
    let dx: [Int] = [0,0,-1,1]
    let dy: [Int] = [-1,1,0,0]
    while true {
        var visited: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
        var openCount: Int = 0
        for i in 0..<n {
            for j in 0..<n {
                if !visited[i][j] {
                    visited[i][j] = true
                    var temp: [[Int]] = [[i,j]]
                    var stack: [[Int]] = [[i,j]]
                    while !stack.isEmpty {
                        let now = stack.popLast()!
                        for k in 0..<4 {
                            let newX = now[1] + dx[k]
                            let newY = now[0] + dy[k]
                            
                            if newX < 0 || newY < 0 || newX >= n || newY >= n {
                                continue
                            } else {
                                let diff = abs(map[now[0]][now[1]] - map[newY][newX])
                                if diff >= l && diff <= r && !visited[newY][newX] {
                                    visited[now[0]][now[1]] = true
                                    visited[newY][newX] = true
                                    openCount += 1
                                    stack.append([newY, newX])
                                    temp.append([newY, newX])
                                }
                            }
                        }
                    }
                    if temp.count != 1 {
                        var sum: Int = 0
                        for p in temp {
                            sum += map[p[0]][p[1]]
                        }
                        let population = sum / temp.count
                        for p in temp {
                            map[p[0]][p[1]] = population
                        }
                    }
                }
            }
        }
        if openCount == 0 {
            break
        } else {
            count += 1
        }
    }
    
    print(count)
}
solution()
