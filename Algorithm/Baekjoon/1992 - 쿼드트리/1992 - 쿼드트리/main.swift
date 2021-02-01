//
//  main.swift
//  1992 - 쿼드트리
//
//  Created by Ick on 2020/08/01.
//  Copyright © 2020 jaicoco. All rights reserved.
//

import Foundation

func Main(){
    guard let n = Int(readLine()!) else { fatalError() }
    var image = [[Int]]()

    for _ in 0..<n{
        guard let temp = readLine() else { fatalError() }
        image.append(temp.map {Int(String($0))!})
    }
    
    let result = CheckImage(image,n)
    print(result)
}

func CheckImage(_ image: [[Int]], _ n: Int) -> String{
    
    if image.count == 1 && n == 1{
        return "(" + String(image[0][0]) + ")"
    }
    
    var result = "("
    let start = image[0][0]
    var checknumber: Int
    if start == 0 {
        checknumber = 1
    } else {
        checknumber = 0
    }
    for row in 0..<image.count{
        if image[row].contains(checknumber) {
            result += CheckImage(SplitImage(image, (0,image.count / 2), (0, image.count / 2)),n)
            result += CheckImage(SplitImage(image, (0,image.count / 2), (image.count / 2, image.count)),n)
            result += CheckImage(SplitImage(image, (image.count / 2,image.count), (0, image.count / 2)),n)
            result += CheckImage(SplitImage(image, (image.count / 2,image.count), (image.count / 2, image.count)),n)
            result += ")"
            return result
        }
    }
    
    if result == "("  {
        return String(image[0][0])
    }
    return result
}

func SplitImage(_ image: [[Int]],_ height: (Int,Int), _ width:(Int,Int)) -> [[Int]]{
    var result = [[Int]]()
    for index in height.0..<height.1{
        result.append(Array(image[index][width.0..<width.1]))
    }
    return result
}
Main()
