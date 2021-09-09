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
@testable import MyBiz

func mockEvents() -> [Event] {
  let events = [
    Event(name: "Event 1", date: Date(),
          type: .Appointment, duration: .hours(1)),
    Event(name: "Event 2", date: Date(timeIntervalSinceNow: .days(20)),
          type: .Meeting, duration: .minutes(30)),
    Event(name: "Event 3", date: Date(timeIntervalSinceNow: -.days(1)),
          type: .DomesticHoliday, duration: .days(1))
  ]
  return events
}

func mockEmployees() -> [Employee] {
  let employees = [
    Employee(id: "Cap", givenName: "Steve",
             familyName: "Rogers", location: "Brooklyn",
             manager: nil, directReports: [], birthday: "07-04-1920"),
    Employee(id: "Surfer", givenName: "Norrin",
             familyName: "Radd", location: "Zenn-La",
             manager: nil, directReports: [], birthday: "03-01-1966"),
    Employee(id: "Wasp", givenName: "Hope",
             familyName: "van Dyne", location: "San Francisco",
             manager: nil, directReports: [], birthday: "01-02-1979")
  ]
  return employees
}

func mockBirthdayEvents() -> [Event] {
  let dateFormatter = DateFormatter()
  dateFormatter.dateFormat = Employee.birthdayFormat
  return [
    Event(name: "Steve Rogers Birthday",
          date: dateFormatter.date(from: "07-04-1920")!.next()!,
          type: .Birthday, duration: 0),
    Event(name: "Norrin Radd Birthday", date:
      dateFormatter.date(from: "03-01-1966")!.next()!,
          type: .Birthday, duration: 0),
    Event(name: "Hope van Dyne Birthday", date:
      dateFormatter.date(from: "01-02-1979")!.next()!,
          type: .Birthday, duration: 0)
  ]
}

class MockAPI: API {

  var mockEvents: [Event] = []

  override func getEvents() {
    DispatchQueue.main.async {
      self.delegate?.eventsLoaded(events: self.mockEvents)
    }
  }

  var mockEmployees: [Employee] = []

  override func getOrgChart() {
    DispatchQueue.main.async {
      self.delegate?.orgLoaded(org: self.mockEmployees)
    }
  }
}
