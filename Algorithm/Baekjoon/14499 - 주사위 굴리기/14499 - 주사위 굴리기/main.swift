//
//  main.swift
//  14499 - 주사위 굴리기
//
//  Created by Ick on 2021/03/11.
//

import Foundation

func solution() {
    let firstLine = readLine()!.split(separator: " ").map({Int(String($0))!})
    let n = firstLine[0]
    let m = firstLine[1]
    var dicePosition = [firstLine[2], firstLine[3]]
    
    var map: [[Int]] = []
    
    for _ in 0..<n {
        map.append(readLine()!.split(separator: " ").map({Int(String($0))!}))
    }
    let move = readLine()!.split(separator: " ").map({Int(String($0))!})
    var dice: [Int] = [Int](repeating: 0, count: 6)
    func rollDice(_ direction: Int) {
        let copyDice = dice
        if direction == 1 {
            dice[0] = copyDice[3]
            dice[2] = copyDice[0]
            dice[3] = copyDice[5]
            dice[5] = copyDice[2]
        } else if direction == 2 {
            dice[0] = copyDice[2]
            dice[2] = copyDice[5]
            dice[3] = copyDice[0]
            dice[5] = copyDice[3]
        } else if direction == 3 {
            dice[0] = copyDice[4]
            dice[1] = copyDice[0]
            dice[4] = copyDice[5]
            dice[5] = copyDice[1]
        } else if direction == 4 {
            dice[0] = copyDice[1]
            dice[1] = copyDice[5]
            dice[4] = copyDice[0]
            dice[5] = copyDice[4]
        }
    }
    func canMoveDice(_ direction: Int) -> Bool {
        // 동
        if direction == 1 {
            if dicePosition[1] + 1 >= m {
                return false
            } else {
                dicePosition[1] += 1
            }
        } else if direction == 2 {
            // 서
            if dicePosition[1] - 1 < 0 {
                return false
            } else {
                dicePosition[1] -= 1
            }
        } else if direction == 3 {
            // 북
            if dicePosition[0] - 1 < 0 {
                return false
            } else {
                dicePosition[0] -= 1
            }
        } else if direction == 4 {
            // 남
            if dicePosition[0] + 1 >= n {
                return false
            } else {
                dicePosition[0] += 1
            }
        }
        return true
    }
    
    for direction in move {
        let canMove = canMoveDice(direction)
        if canMove {
            rollDice(direction)
            if map[dicePosition[0]][dicePosition[1]] == 0 {
                // 0이라면 주사위의 값이 바닥에 복사
                map[dicePosition[0]][dicePosition[1]] = dice[5]
            } else {
                // 0이 아니라면 지도의 값이 주사위 바닥에 복사 후 지도엔 0
                dice[5] = map[dicePosition[0]][dicePosition[1]]
                map[dicePosition[0]][dicePosition[1]] = 0
            }
            print(dice[0])
        }
    }
    
}
solution()
