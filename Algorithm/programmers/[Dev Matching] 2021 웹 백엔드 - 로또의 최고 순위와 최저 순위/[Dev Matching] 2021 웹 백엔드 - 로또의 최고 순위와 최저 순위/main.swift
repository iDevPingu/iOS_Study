//
//  main.swift
//  [Dev Matching] 2021 웹 백엔드 - 로또의 최고 순위와 최저 순위
//
//  Created by Ick on 2021/04/27.
//

import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    var jokerCount: Int = 0
    for lotto in lottos where lotto == 0 {
        jokerCount += 1
    }
    var correctCount: Int = 0
    for winNum in win_nums where lottos.contains(winNum) {
        correctCount += 1
    }
    let minRank: Int = 7 - correctCount
    let maxRank: Int = 7 - jokerCount - correctCount
    if minRank == 7 && maxRank == 7 {
        return [6,6]
    } else if minRank == 7 {
        return [maxRank, 6]
    } else if maxRank == 7 {
        return [6, minRank]
    } else {
        return [maxRank, minRank]
    }
}

//print(solution([44,1,0,0,31,25], [31,10,45,1,6,19]))
print(solution([1,2,3,4,5,6], [7,8,9,10,11,12]))
