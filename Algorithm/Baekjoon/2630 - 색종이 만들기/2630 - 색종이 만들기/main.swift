//
//  main.swift
//  2630 - 색종이 만들기
//
//  Created by Ick on 2020/07/31.
//  Copyright © 2020 jaicoco. All rights reserved.
//

import Foundation

func Main(){
    guard let N = Int(readLine()!) else { fatalError() }
    var firstPaper: Array<Array<Int>> = [[Int]]()
    for _ in 0..<N{
        guard let temp = readLine()?.split(separator: " ").map({Int($0)!}) else { fatalError() }
        firstPaper.append(temp)
    }
    let answer = CheckPaper(firstPaper)
    
    print(answer.0)
    print(answer.1)
}

func CheckPaper(_ paper: [[Int]]) -> (Int, Int){
    let first = paper[0][0]
    var white = 0
    var blue = 0
    
    if paper.count == 1 && first == 0 {
        return (1,0)
    } else if paper.count == 1 && first == 1{
        return (0,1)
    }
    
    var checknumber: Int = 2
    if first == 1 {
        checknumber = 0
    } else {
        checknumber = 1
    }
    
    
    for index in 0..<paper.count{
        if paper[index].contains(checknumber){
            let one = CheckPaper(SplitPaper(paper, (0, paper.count / 2), (0, paper.count / 2)))
            let two = CheckPaper(SplitPaper(paper, (paper.count / 2, paper.count), (0, paper.count / 2)))
            let three = CheckPaper(SplitPaper(paper, (0, paper.count / 2), (paper.count / 2, paper.count)))
            let four = CheckPaper(SplitPaper(paper, (paper.count / 2, paper.count), (paper.count / 2, paper.count)))
            
            white = one.0 + two.0 + three.0 + four.0
            blue = one.1 + two.1 + three.1 + four.1
            break
        }
    }
    
    if white == 0 && blue == 0 {
        if first == 0 {
            return (1,0)
        } else if first == 1{
            return (0,1)
        }
    }
    
    return (white,blue)
}


func SplitPaper(_ paper: [[Int]], _ width: (Int,Int),_ height: (Int,Int)) -> [[Int]] {
    var result = [[Int]]()
    for index in width.0..<width.1 {
        result.append(Array(paper[index][height.0..<height.1]))
    }
    return result
}

Main()
