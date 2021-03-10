//
//  main.swift
//  1756 - 피자 굽기
//
//  Created by Ick on 2021/03/09.
//

import Foundation

func solution() -> Int{
    let firstLine = readLine()!.split(separator: " ").map({Int(String($0))!})
    // 오븐의 깊이
    let d = firstLine[0]
    // 피자 반죽 개수
    let n = firstLine[1]
    
    var min: Int = 77777777777
    var oven = readLine()!.split(separator: " ").map { (width) -> Int in
        let width = Int(String(width))!
        if width < min {
            min = width
            return width
        } else {
            return min
        }
    }
    let pizzas = readLine()!.split(separator: " ").map({Int(String($0))!})

    var end: Int = d-1
    func binarySearch(_ target: Int) -> Int {
        var left: Int = 0
        var right: Int = end
        while left <= right {
            let mid = (left + right) / 2
            if oven[mid] >= target {
                left = mid + 1
            } else if oven[mid] < target {
                right = mid - 1
            }
        }
        return left - 1
    }
    var pizzaPosition: Int = 0
    print(oven)
    for i in 0..<pizzas.count {
        let pizza = pizzas[i]
        // 남은 오븐 칸이 없음
        if end < 0 {
            return 0
        }
        // 오븐의 가장 큰 부분보다 피자가 더 큼 -> 못 넣음
        if pizza > oven[0] {
            return 0
        }
        pizzaPosition = binarySearch(pizza)
        end = pizzaPosition - 1
    }
    
    return pizzaPosition + 1
}

print(solution())
