//
//  ViewControllers.swift
//  FitNessTests
//
//  Created by pingu on 2021/09/09.
//  Copyright © 2021 Razeware. All rights reserved.
//

import UIKit
@testable import FitNess

func loadRootViewController() -> RootViewController {
  let window = UIApplication.shared.windows[0]
  return window.rootViewController as! RootViewController
}
