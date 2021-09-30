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
  var permissionDeclined: Bool = false
  
  var error: Error?
  
  var updateBlock: ((Error?) -> Void)?
  var dataBlock: ((PedometerData?, Error?) -> Void)?
  
  func start(
    dataUpdates: @escaping (PedometerData?, Error?) -> Void,
    eventUpdates: @escaping (Error?) -> Void) {
    started = true
    updateBlock = eventUpdates
    dataBlock = dataUpdates
    DispatchQueue.global(qos: .default).async {
      self.updateBlock?(self.error)
    }
  }
  
  func sendData(_ data: PedometerData?) {
    dataBlock?(data, error)
  }
  
  static let notAuthorizedError = NSError(domain: CMErrorDomain,
                                          code: Int(CMErrorMotionActivityNotAuthorized.rawValue),
                                          userInfo: nil)
}
