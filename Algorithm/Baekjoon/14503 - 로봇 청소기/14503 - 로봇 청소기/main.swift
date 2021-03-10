//
//  main.swift
//  14503 - 로봇 청소기
//
//  Created by Ick on 2021/03/07.
//

import Foundation

func solution() {
    let firstLine = readLine()!.split(separator: " ").map({Int(String($0))!})
    let n = firstLine[0]
    let m = firstLine[1]
    
    let secondLine = readLine()!.split(separator: " ").map({Int(String($0))!})
    var nowPosition: [Int] = [secondLine[0], secondLine[1]]
    var direction: Int = secondLine[2]
    
    var room: [[Int]] = []
    var clean: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    for _ in 0..<n {
        room.append(readLine()!.split(separator: " ").map({Int(String($0))!}))
    }
    var count: Int = 0
    // 북 동 남 서
    let left: [[Int]] = [[0,-1], [-1,0], [0,1], [1,0]]
    let back: [[Int]] = [[1,0], [0,-1], [-1,0], [0,1]]
    
    while true {
        // 청소한다
        if !clean[nowPosition[0]][nowPosition[1]] {
            clean[nowPosition[0]][nowPosition[1]] = true
            count += 1
        }
        var tempDirection = direction
        var tempPosition = nowPosition
        for _ in 0..<4 {
            // 왼쪽을 확인한다
            tempPosition = [nowPosition[0] + left[tempDirection][0], nowPosition[1] + left[tempDirection][1]]
            if tempPosition[0] < 0 || tempPosition[1] < 0 || tempPosition[0] >= n || tempPosition[1] >= m {
                
            } else {
                // 청소할 곳을 찾았다!
                if !clean[tempPosition[0]][tempPosition[1]] && room[tempPosition[0]][tempPosition[1]] == 0 {
                    tempDirection -= 1
                    if tempDirection < 0 {
                        tempDirection = 3
                    }
                    break
                }
            }
            tempDirection -= 1
            if tempDirection < 0 {
                tempDirection = 3
            }
        }
        
        // 만약 여기까지 수행뒤에도 바라보는 방향이 같다면?
        if direction == tempDirection {
            // 청소할 곳을 찾은경우
            if !clean[tempPosition[0]][tempPosition[1]] && room[tempPosition[0]][tempPosition[1]] == 0 {
                nowPosition = tempPosition
                direction = tempDirection
            } else {
                // 그냥 없어서 온 경우
                // 후진 시도
                let backPosition = [nowPosition[0] + back[direction][0], nowPosition[1] + back[direction][1]]
                if backPosition[0] < 0 || backPosition[1] < 0 || backPosition[0] >= n || backPosition[1] >= m {
                    // 청소할곳도 없고 후진도 못함
                    break
                } else {
                    // 청소할 곳도 없고 후진하려고 보니 벽이다
                    if room[backPosition[0]][backPosition[1]] == 1 {
                        break
                    } else {
                        // 후진했다
                        nowPosition = backPosition
                    }
                }
            }
        } else {
            // 여기서 방향이 바뀌었단 것은 청소할 곳이 있다는 뜻!
            nowPosition = tempPosition
            direction = tempDirection
        }
    }
    print(count)
}
solution()
