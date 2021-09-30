//
//  CMPedometer+Pedometer.swift
//  FitNess
//
//  Created by pingu.hwang on 2021/09/30.
//  Copyright © 2021 Razeware. All rights reserved.
//

import Foundation
import CoreMotion

extension CMPedometer: Pedometer {
  var pedometerAvailable: Bool {
    return CMPedometer.isStepCountingAvailable() &&
      CMPedometer.isDistanceAvailable() &&
      CMPedometer.authorizationStatus() != .restricted
  }
  
  var permissionDeclined: Bool {
    return CMPedometer.authorizationStatus() == .denied
  }
  
  func start(
    dataUpdates: @escaping (PedometerData?, Error?) -> Void,
    eventUpdates: @escaping (Error?) -> Void) {
    startEventUpdates { event, error in
      eventUpdates(error)
    }
    startUpdates(from: Date()) { data, error in
      dataUpdates(data, error)
    }
  }
}

extension CMPedometerData: PedometerData {
  var steps: Int {
    return numberOfSteps.intValue
  }
  
  var distanceTravelled: Double {
    return distance?.doubleValue ?? 0
  }
}
