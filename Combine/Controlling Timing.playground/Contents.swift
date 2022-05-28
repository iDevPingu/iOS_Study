import Combine
import Foundation


func example(title: String, action: () -> Void) {
    print("// \(title) 예제 코드")
    action()
    print("\n")
}

var subscriptions = Set<AnyCancellable>()

example(title: "measureInterval(using:options:)") {
    let intPublisher = PassthroughSubject<Int, Never>()
    
    intPublisher
        .measureInterval(using: DispatchQueue.main, options: nil)
        .sink(receiveCompletion: { print($0) },
              receiveValue: { nanoSecond in
            print("Measure Time: \(floor(Double(nanoSecond.magnitude) / 1_000_000_000.0))초")
        })
        .store(in: &subscriptions)
    
    intPublisher.send(1)
//    sleep(1)
    intPublisher.send(2)
//    sleep(2)
    intPublisher.send(3)
}

example(title: "debounce(for:scheduler:options:)") {
    let operationQueue: OperationQueue = {
        let operationQueue = OperationQueue()
        
        operationQueue.maxConcurrentOperationCount = 1
        return operationQueue
    }()
    
    let textField = PassthroughSubject<String, Never>()
    let bounces: [(String, TimeInterval)] = [ // (입력값, 입력 후 기다리는 시간)
        ("www", 0.5),
        (".", 0.5),
        ("p", 1),
        ("ing", 0.5),
        ("u", 0.5),
        (".", 1),
        ("co", 0.5),
        ("m", 1),
    ]
    var requestString: String = ""
    textField
        .debounce(for: .seconds(1.0), scheduler: DispatchQueue.main)
        .sink(receiveCompletion: { print($0) },
              receiveValue: { string in
//            print("이번에 받은 값: \(string) , Network Request with: \(requestString)")
        })
        .store(in: &subscriptions)
    
    for bounce in bounces {
        operationQueue.addOperation {
            requestString += bounce.0
            textField.send(bounce.0)
            
//            usleep(UInt32(bounce.1 * 1000000))
        }
    }
}

example(title: "delay(for:tolerance:scheduler:options:)") {
    let dateFormmater: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .long
        return dateFormatter
    }()
    
//    Timer.publish(every: 1.0, on: .main, in: .default)
//        .autoconnect()
//        .handleEvents(receiveOutput: { date in
//            print("Downstream으로 보낸값(현재시간): \(dateFormmater.string(from: date))")
//        })
//        .delay(for: .seconds(3), scheduler: RunLoop.main, options: .none)
//        .sink(receiveCompletion: { print($0) },
//              receiveValue: { value in
//            let now = Date()
//            print("받은 값: \(dateFormmater.string(from: value)) 보낸시간: \(String(format: "%.2f", now.timeIntervalSince(value))) secs ago", terminator: "\n")
//        })
//        .store(in: &subscriptions)
}

example(title: "throttle(for:scheduler:latest:)") {
    let operationQueue: OperationQueue = {
        let operationQueue = OperationQueue()
        
        operationQueue.maxConcurrentOperationCount = 1
        return operationQueue
    }()
    
    let textField = PassthroughSubject<String, Never>()
    let throttles: [(String, TimeInterval)] = [ // (입력값, 입력에 걸리는 시간)
        ("www", 0.5),
        (".", 0.5),
        ("p", 1),
        ("ing", 0.5),
        ("u", 0.5),
        (".", 5),
        ("co", 0.5),
        ("m", 2),
    ]
    var requestString: String = ""
    textField
        .throttle(for: .seconds(2), scheduler: DispatchQueue.main, latest: true)
        .sink(receiveCompletion: { print($0) },
              receiveValue: { string in
            print("===Throttle===\n이번시간동안 받은 값중 최신값: \(string), 현재시간: \(Date().description), Network Request with: \(requestString)\n")
        })
        .store(in: &subscriptions)
    
    textField
        .sink(receiveCompletion: { print($0) },
              receiveValue: { string in
            print("===Subject===\n현재시간: \(Date().description), 이번에 내려보낸 값: \(string)")
        })
        .store(in: &subscriptions)
    
//    for throttle in throttles {
//        operationQueue.addOperation {
//            requestString += throttle.0
//            textField.send(throttle.0)
//
//            usleep(UInt32(throttle.1 * 1000000))
//        }
//    }
}

example(title: "timeout(_:scheduler:options:customError:)") {
    struct TimeOutError: Error { }
    let intPublisher = PassthroughSubject<Int, TimeOutError>()
    
    intPublisher
        .timeout(.seconds(2), scheduler: DispatchQueue.main, customError: {
            return TimeOutError()
        }
        .sink(receiveCompletion: { print($0) },
              receiveValue: { print($0) })
        .store(in: &subscriptions)
    
    intPublisher.send(1)
    intPublisher.send(2)
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
        intPublisher.send(3)
    }
}
