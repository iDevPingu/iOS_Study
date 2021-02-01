//
//  main.swift
//  10026 - 적록색약
//
//  Created by Ick on 2020/12/05.
//

import Foundation

func solution() {
    let n = Int(String(readLine()!))!
    var picture: [[String]] = []
    
    for _ in 0..<n {
        picture.append(readLine()!.map({String($0)}))
    }
    var normal: Int = 0
    var abnormal: Int = 0
    
    var normalVisit: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    var abnormalVisit: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    
    var stack: [[Int]] = []
    
    let dx: [Int] = [0,0,-1,1]
    let dy: [Int] = [-1,1,0,0]
    
    // 정상인 사람
    for i in 0..<n {
        for j in 0..<n {
            if normalVisit[i][j] == 0 {
                normalVisit[i][j] = 1
                normal += 1
                stack.append([i,j])
                while(!stack.isEmpty) {
                    let now = stack.popLast()!
                    let nowColor = picture[now[0]][now[1]]
                    for k in 0..<dx.count {
                        let newX = now[1] + dx[k]
                        let newY = now[0] + dy[k]
                        
                        // 범위를 벗어나는 것 처리
                        if newX < 0 || newX > n-1 || newY < 0 || newY > n-1 {
                            continue
                        } else {
                            // 이미 방문한 픽셀이면 패스
                            if normalVisit[newY][newX] == 1 {
                                continue
                            // 아직 방문하지 않은 픽셀일 경우
                            } else {
                                // 현재 색과 방문한 픽셀의 색이 같을 때
                                if nowColor == picture[newY][newX] {
                                    normalVisit[newY][newX] = 1
                                    stack.append([newY, newX])
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    // 적록색약인 사람
    for i in 0..<n {
        for j in 0..<n {
            if abnormalVisit[i][j] == 0 {
                abnormalVisit[i][j] = 1
                abnormal += 1
                stack.append([i,j])
                while(!stack.isEmpty) {
                    let now = stack.popLast()!
                    let nowColor = picture[now[0]][now[1]]
                    for k in 0..<dx.count {
                        let newX = now[1] + dx[k]
                        let newY = now[0] + dy[k]
                        
                        // 범위를 벗어나는 것 처리
                        if newX < 0 || newX > n-1 || newY < 0 || newY > n-1 {
                            continue
                        } else {
                            // 이미 방문한 픽셀이면 패스
                            if abnormalVisit[newY][newX] == 1 {
                                continue
                            } else {
                                // 적록색약인 사람의 경우 G, B가 모두 같은색으로 보이기 때문에 함께 처리
                                if nowColor == "G" || nowColor == "R" {
                                    if picture[newY][newX] == "G" || picture[newY][newX] == "R" {
                                        abnormalVisit[newY][newX] = 1
                                        stack.append([newY, newX])
                                    }
                                // B는 따로 처리한다.
                                } else if nowColor == "B" {
                                    if picture[newY][newX] == "B" {
                                        abnormalVisit[newY][newX] = 1
                                        stack.append([newY, newX])
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    print("\(normal) \(abnormal)")
}

solution()
