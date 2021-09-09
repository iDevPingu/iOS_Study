//
//  AppModelTests.swift
//  FitNessTests
//
//  Created by Ick on 2021/09/07.
//  Copyright © 2021 Razeware. All rights reserved.
//

import XCTest
@testable import FitNess

class AppModelTests: XCTestCase {

    var sut: AppModel!
    
    
    override func setUpWithError() throws {
        super.setUp()
        sut = AppModel()
    }

    override func tearDownWithError() throws {
        sut = nil
        super.tearDown()
    }
    
    func testAppModel_whenInitialized_isInNotStartedState() {
        let initialState = sut.appState
        XCTAssertEqual(initialState, AppState.notStarted)
    }
  
    func testAppModel_whenStarted_isInInProgressState() {
      // 1
//      let sut = AppModel()
      
      // 2
      sut.start()
      
      // 3
      let observedState = sut.appState
      XCTAssertEqual(observedState, .inProgress)
    }
}
