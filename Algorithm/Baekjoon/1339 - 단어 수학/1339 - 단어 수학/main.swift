//
//  main.swift
//  1339 - 단어 수학
//
//  Created by Ick on 2020/08/27.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

func solution(){
    let n = Int(readLine()!)!
    var words = [[String]]()
    var hash: [String: Int] = [:]
    for _ in 0..<n{
        words.append(readLine()!.map({String($0)}))
    }
    
    print(words)
}

solution()
