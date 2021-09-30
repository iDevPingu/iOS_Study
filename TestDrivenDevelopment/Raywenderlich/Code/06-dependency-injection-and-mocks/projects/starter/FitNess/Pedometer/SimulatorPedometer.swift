//
//  SimulatorPedometer.swift
//  FitNessTests
//
//  Created by pingu.hwang on 2021/09/30.
//  Copyright © 2021 Razeware. All rights reserved.
//

import Foundation

class SimulatorPedometer: Pedometer {
  struct Data: PedometerData {
    let steps: Int
    let distanceTravelled: Double
  }
  
  var pedometerAvailable: Bool = true
  var permissionDeclined: Bool = false
  
  var timer: Timer?
  var distance = 0.0
  
  var updateBlock: ((Error?) -> Void)?
  var dataBlock: ((PedometerData?, Error?) -> Void)?
  
  func start(
    dataUpdates: @escaping (PedometerData?, Error?) -> Void,
    eventUpdates: @escaping (Error?) -> Void
  ) {
    updateBlock = eventUpdates
    dataBlock = dataUpdates
    
    timer = Timer(timeInterval: 1, repeats: true, block: { timer in
      self.distance += 1
      print("updated distance : \(self.distance)")
      let data = Data(steps: 10, distanceTravelled: self.distance)
      self.dataBlock?(data, nil)
    })
    
    RunLoop.main.add(timer!, forMode: RunLoop.Mode.default)
    updateBlock?(nil)
  }
  
  func stop() {
    timer?.invalidate()
    updateBlock?(nil)
    updateBlock = nil
    dataBlock = nil
  }
}
