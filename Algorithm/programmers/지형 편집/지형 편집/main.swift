//
//  main.swift
//  지형 편집
//
//  Created by Ick on 2020/08/28.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

func findResult(_ land:[[Int]], _ middle: Int64, _ p: Int, _ q: Int) -> Int64{
    
    var result:Int64 = 0
    
    for i in 0..<land.count{
        for j in 0..<land[i].count{
            if land[i][j] < middle {
                result += Int64(((middle - Int64(land[i][j])) * Int64(p)))
            } else if land[i][j] > middle {
                result += Int64(((Int64(land[i][j]) - middle) * Int64(q)))
            }
        }
    }
    
    return result
}

func solution(_ land:[[Int]], _ p:Int, _ q:Int) -> Int64 {
    
    var max:Int64 = 0
    var min:Int64 = Int64.max
    
    for index in 0..<land.count{
        if land[index].max()! > max {
            max = Int64(land[index].max()!)
        }
        if land[index].min()! < min{
            min = Int64(land[index].min()!)
        }
    }
    
    var result: Int64 = 0
    while (max > min) {
        let middle = (max + min) / 2
        let middleResult = findResult(land, middle, p, q)
        let middlePlusOneResult = findResult(land, middle + 1, p, q)

        if middleResult > middlePlusOneResult {
            min = middle + 1
            result = middlePlusOneResult
        } else if middleResult < middlePlusOneResult{
            max = middle
            result = middleResult
        } else {
            result = middleResult
            break
        }
    }
    
    return Int64(result)
}

print(solution([[4,4,3],[3,2,2],[2,1,0]], 5, 3))

print(Int.max > Int64.max)
//func solution(_ land:[[Int]], _ p:Int, _ q:Int) -> Int64 {
//
//    var result = [Int64]()
//    var max = 0
//    var min = 1000000001
//
//    for index in 0..<land.count{
//        if land[index].max()! > max {
//            max = land[index].max()!
//        }
//        if land[index].min()! < min{
//            min = land[index].min()!
//        }
//    }
//
//    for height in min...max{
//        var temp = 0
//        for i in 0..<land.count{
//            for j in land[i]{
//                if j == height {
//                    continue
//                } else if j < height {
//                    temp += ((height - j) * p)
//                } else if j > height {
//                    temp += ((j - height) * q)
//                }
//            }
//        }
//        result.append(Int64(temp))
//    }
//
//



//
//    return result.min()!
//}

//func findResult(_ land:[[Int]], _ middle: Int64, _ p: Int, _ q: Int) -> Int64{
//    
//    var result:Int64 = 0
//    
//    for i in 0..<land.count{
//        for j in 0..<land[i].count{
//            if land[i][j] < middle {
//                result += Int64(((middle - Int64(land[i][j])) * Int64(p)))
//            } else if land[i][j] > middle {
//                result += Int64(((Int64(land[i][j]) - middle) * Int64(q)))
//            }
//        }
//    }
//    
//    return result
//}
//
//func solution(_ land:[[Int]], _ p:Int, _ q:Int) -> Int64 {
//    
//    var max:Int64 = 0
//    var min:Int64 = Int64.max
//    
//    for index in 0..<land.count{
//        if land[index].max()! > max {
//            max = Int64(land[index].max()!)
//        }
//        if land[index].min()! < min{
//            min = Int64(land[index].min()!)
//        }
//    }
//    
//    var result: Int64 = 0
//    while (max > min) {
//        let middle = (max + min) / 2
//        let middleResult = findResult(land, middle, p, q)
//        let middlePlusOneResult = findResult(land, middle + 1, p, q)
//
//        if middleResult > middlePlusOneResult {
//            min = middle + 1
//            result = middlePlusOneResult
//        } else if middleResult < middlePlusOneResult{
//            max = middle
//            result = middleResult
//        } else {
//            result = middleResult
//            break
//        }
//    }
//    
//    return Int64(result)
//}
