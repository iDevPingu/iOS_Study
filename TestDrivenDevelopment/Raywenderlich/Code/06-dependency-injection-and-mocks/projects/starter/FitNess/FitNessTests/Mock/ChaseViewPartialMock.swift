//
//  ChaseViewPartialMock.swift
//  FitNessTests
//
//  Created by pingu.hwang on 2021/09/30.
//  Copyright © 2021 Razeware. All rights reserved.
//

import Foundation
@testable import FitNess

class ChaseViewPartialMock: ChaseView {
  var updateStateCalled = false
  var lastRunner: Double?
  var lastNessie: Double?
  
  override func updateState(runner: Double, nessie: Double) {
    updateStateCalled = true
    lastRunner = runner
    lastNessie = nessie
    
    super.updateState(runner: runner, nessie: nessie)
  }
}
