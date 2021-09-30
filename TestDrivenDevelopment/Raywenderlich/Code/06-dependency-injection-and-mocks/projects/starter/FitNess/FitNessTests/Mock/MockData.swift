//
//  MockData.swift
//  FitNessTests
//
//  Created by pingu.hwang on 2021/09/30.
//  Copyright © 2021 Razeware. All rights reserved.
//

import Foundation
@testable import FitNess

struct MockData: PedometerData {
  let steps: Int
  let distanceTravelled: Double
}
