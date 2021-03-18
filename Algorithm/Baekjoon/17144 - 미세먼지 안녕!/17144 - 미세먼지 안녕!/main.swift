//
//  main.swift
//  17144 - 미세먼지 안녕!
//
//  Created by Ick on 2021/03/18.
//

import Foundation

func solution() {
    let firstLine = readLine()!.split(separator: " ").map({Int(String($0))!})
    let r = firstLine[0]
    let c = firstLine[1]
    let t = firstLine[2]
    
    var map: [[Int]] = []
    var airCleaner: [[Int]] = []
    for i in 0..<r {
        var count: Int = 0
        map.append(readLine()!.split(separator: " ").map{ (str) -> Int in
            let num = Int(String(str))!
            if num == -1 {
                airCleaner.append([i, count])
            }
            count += 1
            return num
        })
    }
    let dx: [Int] = [0,0,-1,1]
    let dy: [Int] = [-1,1,0,0]
    
    var time: Int = 0
    
    func clockwise() {
        var start = airCleaner[1]
        map[start[0] + 1][start[1]] = 0
        start[0] += 1
        while start != airCleaner[1] {
            if start[1] == airCleaner[1][1] {
                if start[0] == r-1 {
                    // 오른쪽으로
                    map[start[0]][start[1]] = map[start[0]][start[1] + 1]
                    map[start[0]][start[1] + 1] = 0
                    start[1] += 1
                    continue
                } else {
                    // 내려가야함
                    map[start[0]][start[1]] = map[start[0] + 1][start[1]]
                    map[start[0] + 1][start[1]] = 0
                    start[0] += 1
                    continue
                }
            } else if start[0] == r-1 {
                if start[1] == c-1 {
                    // 올라가야함
                    map[start[0]][start[1]] = map[start[0] - 1][start[1]]
                    map[start[0] - 1][start[1]] = 0
                    start[0] -= 1
                    continue
                } else {
                    // 오른쪽으로
                    map[start[0]][start[1]] = map[start[0]][start[1] + 1]
                    map[start[0]][start[1] + 1] = 0
                    start[1] += 1
                    continue
                }
            } else if start[1] == c-1 {
                if start[0] == airCleaner[1][0] {
                    // 왼쪽으로
                    map[start[0]][start[1]] = map[start[0]][start[1] - 1]
                    map[start[0]][start[1] - 1] = 0
                    start[1] -= 1
                    continue
                } else {
                    // 위쪽으로
                    map[start[0]][start[1]] = map[start[0] - 1][start[1]]
                    map[start[0] - 1][start[1]] = 0
                    start[0] -= 1
                    continue
                }
            } else if start[0] == airCleaner[1][0] {
                // 공기청정기 위치에선 끝내기
                if map[start[0]][start[1] - 1] == -1 {
                    start[1] -= 1
                    continue
                } else {
                    // 왼쪽으로
                    map[start[0]][start[1]] = map[start[0]][start[1] - 1]
                    map[start[0]][start[1] - 1] = 0
                    start[1] -= 1
                    continue
                }
            }
        }
    }
    func anticlockwise() {
        var start = airCleaner[0]
        map[start[0] - 1][start[1]] = 0
        start[0] -= 1
        while start != airCleaner[0] {
            if start[1] == airCleaner[0][1] {
                if start[0] == 0 {
                    // 오른쪽으로
                    map[start[0]][start[1]] = map[start[0]][start[1] + 1]
                    map[start[0]][start[1] + 1] = 0
                    start[1] += 1
                    continue
                } else {
                    // 올라가야함
                    map[start[0]][start[1]] = map[start[0] - 1][start[1]]
                    map[start[0] - 1][start[1]] = 0
                    start[0] -= 1
                    continue
                }
            } else if start[0] == 0 {
                if start[1] == c-1 {
                    // 내려가야함
                    map[start[0]][start[1]] = map[start[0] + 1][start[1]]
                    map[start[0] + 1][start[1]] = 0
                    start[0] += 1
                    continue
                } else {
                    // 오른쪽으로
                    map[start[0]][start[1]] = map[start[0]][start[1] + 1]
                    map[start[0]][start[1] + 1] = 0
                    start[1] += 1
                    continue
                }
            } else if start[1] == c-1 {
                if start[0] == airCleaner[0][0] {
                    // 왼쪽으로
                    map[start[0]][start[1]] = map[start[0]][start[1] - 1]
                    map[start[0]][start[1] - 1] = 0
                    start[1] -= 1
                    continue
                } else {
                    // 아래쪽으로
                    map[start[0]][start[1]] = map[start[0] + 1][start[1]]
                    map[start[0] + 1][start[1]] = 0
                    start[0] += 1
                    continue
                }
            } else if start[0] == airCleaner[0][0] {
                // 공기청정기 위치에선 끝내기
                if map[start[0]][start[1] - 1] == -1 {
                    start[1] -= 1
                    continue
                } else {
                    // 왼쪽으로
                    map[start[0]][start[1]] = map[start[0]][start[1] - 1]
                    map[start[0]][start[1] - 1] = 0
                    start[1] -= 1
                    continue
                }
            }
        }
    }
    
    while time < t {
        time += 1
        // 미세먼지확산
        var tempMap = map
        for i in 0..<r {
            for j in 0..<c {
                if map[i][j] == -1 {
                    continue
                }
                var count: [[Int]] = []
                for k in 0..<4 {
                    let newX = j + dx[k]
                    let newY = i + dy[k]
                    if newX < 0 || newY < 0 || newX >= c || newY >= r {
                        continue
                    } else {
                        // 공기청정기가 있는 곳에는 확산 안됨
                        if map[newY][newX] == -1 {
                            continue
                        } else {
                            count.append([newY, newX])
                        }
                    }
                }
                let dust = map[i][j] / 5
                tempMap[i][j] -= (dust * count.count)
                for p in count {
                    tempMap[p[0]][p[1]] += dust
                }
            }
        }
        map = tempMap
        
        // 공기 순환
        // 시계방향 순환먼저 airCleaner[1]이 항상 시계방향 순환
        clockwise()
        anticlockwise()
        
    }
    var result: Int = 0
    for i in 0..<r {
        for j in 0..<c {
            result += map[i][j]
        }
    }
    print(result + 2)
}
solution()
