//
//  Notification+Tests.swift
//  FitNessTests
//
//  Created by pingu.hwang on 2021/09/16.
//  Copyright © 2021 Razeware. All rights reserved.
//

import Foundation
@testable import FitNess

extension Notification {
  var alert: Alert? {
    return userInfo?[AlertNotification.Keys.alert] as? Alert
  }
}
