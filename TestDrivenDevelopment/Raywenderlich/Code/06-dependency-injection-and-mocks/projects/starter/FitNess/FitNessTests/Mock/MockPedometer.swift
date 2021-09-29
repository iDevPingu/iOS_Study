//
//  MockPedometer.swift
//  FitNessTests
//
//  Created by pingu.hwang on 2021/09/30.
//  Copyright © 2021 Razeware. All rights reserved.
//

import Foundation
import CoreMotion
@testable import FitNess

class MockPedometer: Pedometer {
  private(set) var started: Bool = false
  var pedometerAvailable: Bool = true
  var pedometerDeclined: Bool = false
  
  func start() {
    started = true
  }
}
