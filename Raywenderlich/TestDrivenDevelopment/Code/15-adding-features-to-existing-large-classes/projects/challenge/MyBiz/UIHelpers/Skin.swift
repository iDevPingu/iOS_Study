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
import UIKit

public struct Skin {
  
  let backgroundColor: UIColor
  let controlBackground: UIColor?
  let controlBorder: UIColor?
  let controlTextColor: UIColor?
  let tableCellTextColor: UIColor?
  let stepperColor: UIColor?
  
  public static let login = Skin(backgroundColor: .bizCanary,
                          controlBackground: .bizPink,
                          controlBorder: .bizControlBorder,
                          controlTextColor: .bizYellow,
                          tableCellTextColor: nil,
                          stepperColor: nil)
  public static let loginAlert = Skin(backgroundColor: .bizPink,
                               controlBackground: nil,
                               controlBorder: nil,
                               controlTextColor: .bizYellow,
                               tableCellTextColor: nil,
                               stepperColor: nil)
  public static let announcements = Skin(backgroundColor: .bizPurple,
                                  controlBackground: nil,
                                  controlBorder: nil,
                                  controlTextColor: .darkText,
                                  tableCellTextColor: .bizLightGray,
                                  stepperColor: nil)
  public static let purchaseOrder = Skin(backgroundColor: .bizCanary,
                                  controlBackground: nil,
                                  controlBorder: nil,
                                  controlTextColor: .darkText,
                                  tableCellTextColor: .darkGray,
                                  stepperColor: .bizPurple)
  public static let orgChart = Skin(backgroundColor: .bizYellow,
                             controlBackground: nil,
                             controlBorder: nil,
                             controlTextColor: .darkText,
                             tableCellTextColor: .darkText,
                             stepperColor: nil)
}
