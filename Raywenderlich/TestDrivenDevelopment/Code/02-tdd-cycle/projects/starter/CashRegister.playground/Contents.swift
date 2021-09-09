/// Copyright (c) 2019 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import Foundation
import XCTest

class CashRegisterTests: XCTestCase {
    var availableFunds: Decimal!
    var sut: CashRegister!
    var itemCost: Decimal!
    // setUp() : 테스트 메서드 실행되기 직전에 호출
    // 1
    override func setUp() {
        super.setUp()
        availableFunds = 100
        sut = CashRegister(availableFunds: availableFunds)
        itemCost = 42
    }
    
    // tearDown() : 테스트 메서드 완료 직후에 호출
    // 2
    override func tearDown() {
        availableFunds = nil
        sut = nil
        itemCost = nil
        super.tearDown()
    }
    
    
    // 필요 없어짐
//    // 1
//    func testInitCreatesCashRegister() {
//        // 2 : 매개변수가 nil이 아님을 보장하는 메서드 -> nil이면 테스트 실패!
//        XCTAssertNotNil(CashRegister())
//    }
    
    func testInitAvailableFunds_setAvailableFunds() {
        // given
//        let availableFunds = Decimal(100)
        
        // when
        // sut = system under test의 약자
//        let sut = CashRegister(availableFunds: availableFunds)
        
        // then
//        XCTAssertEqual(sut.availableFunds, availableFunds)
        XCTAssertEqual(sut.availableFunds, availableFunds)
    }
    
    func testAddItem_oneItem_addsCostToTransactionTotal() {
        // given
//        let availableFunds = Decimal(100)
//        let sut = CashRegister(availableFunds: availableFunds)
        
        // given
//        let itemCost = Decimal(42)
        
        // when
        sut.addItem(itemCost)
        
        // then
        XCTAssertEqual(sut.transactionTotal, itemCost)
    }
    
    func testAddItem_twoItems_addsCostsToTransactionTotal() {
        // given
//        let itemCost = Decimal(42)
        let itemCost2 = Decimal(20)
        let expectedTotal = itemCost + itemCost2
        
        // when
        sut.addItem(itemCost)
        sut.addItem(itemCost2)
        
        // then
        XCTAssertEqual(sut.transactionTotal, expectedTotal)
    }
    
    func testAcceptCashPayment_subtractsPaymentFromTransactionTotal() {
        sut.addItem(itemCost)
        
        let payment = Decimal(30)
        let expectedTotal = itemCost - payment
        
        sut.acceptCashPayment(payment)
        
        XCTAssertEqual(sut.transactionTotal, expectedTotal)
    }
    
    func testAcceptCashPayment_addsPaymentToAvailableFunds() {
        sut.addItem(itemCost)
        
        let payment = Decimal(30)
        let expectedTotal = sut.availableFunds - payment
        
        sut.acceptCashPayment(payment)
        
        XCTAssertEqual(sut.availableFunds, expectedTotal)
    }
}

class CashRegister {
    var availableFunds: Decimal
    var transactionTotal: Decimal = 0
    
    init(availableFunds: Decimal = 0) {
        self.availableFunds = availableFunds
    }
    
    func addItem(_ cost: Decimal) {
        transactionTotal += cost
    }
    
    func acceptCashPayment(_ payment: Decimal) {
        transactionTotal -= payment
        availableFunds -= payment
    }
}

CashRegisterTests.defaultTestSuite.run()
