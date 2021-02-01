//
//  main.swift
//  2798 - 블랙잭
//
//  Created by Ick on 2020/08/17.
//  Copyright © 2020 jaicoco. All rights reserved.
//

import Foundation

let firstLine = readLine()!.split(separator: " ").map(){Int(String($0))!}
let n = firstLine[0]
let m = firstLine[1]
let cards = readLine()!.split(separator: " ").map(){Int(String($0))!}

func blackJack(_ n: Int, _ m: Int, _ cards: [Int]) -> Int{
    var nowMax: Int = 0

    for firstIndex in 0..<n{
        for secondIndex in firstIndex+1..<n{
            for thirdIndex in secondIndex+1..<n{
                let now = cards[firstIndex] + cards[secondIndex] + cards[thirdIndex]
                if m - now == 0 {
                    nowMax = now
                    return nowMax
                } else if m - now < 0 {
                    continue
                } else if m - now > 0 {
                    if nowMax < now{
                        nowMax = now
                    }
                }
            }
        }
    }
    return nowMax
}

print(blackJack(n, m, cards))
