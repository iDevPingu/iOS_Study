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

import UIKit

@IBDesignable class ChaseView: UIView {

  let nessieView = UIImageView()
  let runnerView = UIImageView()

  var state: AppState = .notStarted {
    didSet {
      nessieView.image = state.nessieImage
      runnerView.image = state.runnerImage
    }
  }

  private func commonSetup() {
    addSubview(nessieView)
    addSubview(runnerView)
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonSetup()
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    commonSetup()
  }

  override func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()

    let bundle = Bundle(for: ChaseView.self)
    nessieView.image = UIImage(named: "Nessie", in: bundle, compatibleWith: nil)
    runnerView.image = UIImage(named: "Runner", in: bundle, compatibleWith: nil)
  }
}

extension AppState {
  var nessieImage: UIImage {
    let imageName: String
    switch self {
    case .notStarted:
      imageName = "NessieSleeping"
    case .inProgress:
      imageName = "Nessie"
    case .paused:
      imageName = "NessieSleeping"
    case .completed:
      imageName = "NessieLost"
    case .caught:
      imageName = "NessieWon"
    }
    return UIImage(named: imageName)!
  }

  var runnerImage: UIImage {
    let imageName: String
    switch self {
    case .notStarted:
      imageName = "RunnerPaused"
    case .inProgress:
      imageName = "Runner"
    case .paused:
      imageName = "RunnerPaused"
    case .completed:
      imageName = "RunnerWon"
    case .caught:
      imageName = "RunnerEaten"
    }
    return UIImage(named: imageName)!
  }
}
