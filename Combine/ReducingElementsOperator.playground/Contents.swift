import Combine
import Foundation
var subscription = Set<AnyCancellable>()
func example(title: String, action: () -> Void) {
    print("// \(title) 예제 코드")
    action()
    print("\n")
}

example(title: "Collect") {
    let intPublisher = [1, 2, 3, 4, 5].publisher
    intPublisher
        .collect()
        .sink(receiveValue: { print($0) })
}

example(title: "CollectByCount") {
    let intPublisher = [1, 2, 3, 4, 5].publisher
    intPublisher
        .collect(2)
        .sink(receiveValue: { print($0) })
}

example(title: "CollectByTime-byTime") {
//    let timerPublisher = Timer.publish(every: 0.5, on: .main, in: .default)
//
//    timerPublisher
//        .autoconnect()
//        .collect(.byTime(RunLoop.main, .seconds(5)))
//        .sink(receiveValue: { print($0) })
//        .store(in: &subscription)
//
//    timerPublisher
//        .autoconnect()
//        .collect(.byTime(DispatchQueue.main, .seconds(1)))
//        .sink(receiveValue: { print($0) })
//        .store(in: &subscription)
}

example(title: "CollectByTime-byTimeOrCount") {
//    let timerPublisher = Timer.publish(every: 0.5, on: .main, in: .default)
//
//    timerPublisher
//        .autoconnect()
//        .collect(.byTimeOrCount(DispatchQueue.main, .seconds(4), 2))
//        .sink(receiveValue: { print($0) })
//        .store(in: &subscription)
}

example(title: "IgnoreOutput") {
    let intPublisher = [1, 2, 3, 4, 5].publisher
    
    intPublisher
        .ignoreOutput()
        .sink(receiveCompletion: { print($0) },
              receiveValue: { print($0) })
}

example(title: "Reduce") {
    let intPublisher = [1, 2, 3, 4, 5].publisher
    
    intPublisher
        .reduce(0, { $0 + $1 })
        .sink(receiveCompletion: { print($0) },
              receiveValue: { print($0) })
}

example(title: "Reduce-String") {
    let stringPublisher = ["P", "I", "N", "G", "U"].publisher
    
    stringPublisher
        .reduce("", { $0 + $1 })
        .sink(receiveCompletion: { print($0) },
              receiveValue: { print($0) })
}

example(title: "TryReduce") {
    enum PinguError: Error {
        case nagativeNumber
    }
    
    func checkNagativeNumber(_ number: Int) throws -> Int {
        guard number < 0 else {
            throw PinguError.nagativeNumber
        }
        return number
    }
    
    let intPublisher = [1, 2, 3, -10, 4].publisher
    
    intPublisher
        .tryReduce(0) { reduceValue, newValue in
            try checkNagativeNumber(reduceValue + newValue)
            return reduceValue + newValue
        }
        .sink(receiveCompletion: { print($0) },
              receiveValue: { print($0) })
}
