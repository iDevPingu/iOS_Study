//
//  DataModelTest.swift
//  FitNessTests
//
//  Created by pingu on 2021/09/08.
//  Copyright © 2021 Razeware. All rights reserved.
//

import XCTest
@testable import FitNess

class DataModelTest: XCTestCase {
    
    var sut: DataModel!
    
    override func setUp() {
        super.setUp()
        sut = DataModel()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testModel_whenStepsReachGoal_goalIsReached() {
        // given
        sut.goal = 1000
        
        // when
        sut.steps = 1000
        
        // then`ㅎ
        XCTAssertTrue(sut.goalReached)
    }
    
    // MARK: - Goal
    func testModel_whenStarted_goalIsNotReached() {
        XCTAssertFalse(sut.goalReached, "goalReached should be false when the model is created")
    }

    // MARK: - Nessie
    func testModel_whenStarted_userIsNotCaught() {
        XCTAssertFalse(sut.caught)
    }

    func testModel_WhenUserAheadOfNessie_isNotCaught() {
        // given
        sut.distance = 1000
        sut.nessie.distance = 100
        
        // then
        XCTAssertFalse(sut.caught)
    }
    
    func testModel_whenNessieAheadofUser_isCaught() {
        sut.nessie.distance = 1000
        sut.distance = 100
        
        // then
        XCTAssertTrue(sut.caught)
    }
    
    func testCoal_whenUserCaught_cannotBeReached() {
        // given goal should be reached
        sut.goal = 1000
        sut.steps = 1000
        
        // when caught by nessie
        sut.distance = 100
        sut.nessie.distance = 100
        
        // then
        XCTAssertFalse(sut.goalReached)
    }
}
