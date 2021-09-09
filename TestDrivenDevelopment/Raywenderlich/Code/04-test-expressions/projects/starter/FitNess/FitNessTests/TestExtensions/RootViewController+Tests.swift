//
//  RootViewController+Tests.swift
//  FitNessTests
//
//  Created by pingu on 2021/09/09.
//  Copyright © 2021 Razeware. All rights reserved.
//

import UIKit
@testable import FitNess

extension RootViewController {
  var stepController: StepCountController {
    return children.first { $0 is StepCountController } as! StepCountController
  }
}
