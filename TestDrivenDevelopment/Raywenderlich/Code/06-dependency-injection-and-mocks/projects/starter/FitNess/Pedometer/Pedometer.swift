//
//  Pedometer.swift
//  FitNess
//
//  Created by pingu.hwang on 2021/09/29.
//  Copyright © 2021 Razeware. All rights reserved.
//

import Foundation

protocol Pedometer {
  var pedometerAvailable: Bool { get }
  var permissionDeclined: Bool { get }
  func start()
}
