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
  
  
  func start() {
    startEventUpdates { event, error in
      // do nothing here for now
    }
  }
}
