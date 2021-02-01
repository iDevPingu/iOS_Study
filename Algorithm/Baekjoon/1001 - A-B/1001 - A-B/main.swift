//
//  main.swift
//  1001 - A-B
//
//  Created by Ick on 2020/09/22.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

func solution(){
    let firstLine = readLine()!.split(separator: " ").map({Int($0)!})
    print(firstLine[0] - firstLine[1])
}
solution()
