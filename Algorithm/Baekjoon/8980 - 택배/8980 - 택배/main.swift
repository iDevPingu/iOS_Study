//
//  main.swift
//  8980 - 택배
//
//  Created by Ick on 2021/01/09.
//

import Foundation

func solution() {
    let firstLine = readLine()!.split(separator: " ").map({Int($0)!})
    let n = firstLine[0]
    let c = firstLine[1]
    let m = Int(readLine()!)!
    
    var infos = [[Int]](repeating: [Int](repeating: 0, count: n+1), count: n+1)
    
    for _ in 0..<m {
        let info = readLine()!.split(separator: " ").map({Int(String($0))!})
        infos[info[0]][info[1]] = info[2]
    }
    
    var truck = [Int](repeating: 0, count: n+1)
    var nowWeight: Int = 0
    var result: Int = 0
    
    print(infos)
    for from in 1...n {
        // 배달완료한 물건에 대한 정보 처리
        // 결과값에 배달 완료한 값 추가
        result += truck[from]
        // 트럭의 현재 무게 감소
        nowWeight -= truck[from]
        // 트럭의 현재 마을로의 물건 0으로 초기화
        truck[from] = 0
        for to in from...n {
            // 이미 최대 적재량보다 크거나 같다면 더이상 실을 수 없다
            if nowWeight >= c {
                continue
                // 만약 현재 물건을 모두 담을 수 있다면
            } else {
                // 담을 수 있는 물건의 수 측정
                let can = c - nowWeight
                // 현재 담을 수 있는 물건수랑 비교해서 더 작은걸 적재
                if (can > infos[from][to]) {
                    truck[to] += infos[from][to]
                    nowWeight += infos[from][to]
                    
                } else {
                    truck[to] += can
                    nowWeight += can
                }
            }
        }
    }
    print(result)
    
}

solution()
