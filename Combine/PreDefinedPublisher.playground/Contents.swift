import Foundation
import Combine

var subscriptions = Set<AnyCancellable>()

// Just
//let just = Just("This is Output")
//just
//    .sink(
//        receiveCompletion: { completion in
//            print("received completion: \(completion)")
//        },
//        receiveValue: { value in
//            print("received value: \(value)")
//        })
//    .store(in: &subscriptions)

// Future
//var emitValue: String = "내보내진 값"
//var delay: TimeInterval = 3
//
//
//let future = Future<String, Never> { promise in
//    delay -= 1
//    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
//        promise(.success(emitValue))
//    }
//}
//
//future
//    .sink(receiveCompletion: { print("첫번째 Subsrciber Completion: \($0)") },
//          receiveValue: { print("첫번째 Subscriber value: \($0)") })
//    .store(in: &subscriptions)
//
//future
//    .sink(receiveCompletion: { print("두번째 Subscriber completion: \($0)") },
//          receiveValue: { print("두번째 Subscriber value: \($0)") })
//    .store(in: &subscriptions)

// Deferred

struct PinguPublisher: Publisher {
    typealias Output = String
    typealias Failure = Never
    
    func receive<S>(subscriber: S) where S : Subscriber, Never == S.Failure, String == S.Input {
        subscriber.receive("안녕 나는 pinguPublisher")
        subscriber.receive(completion: .finished)
    }
}
//
//print("deferred publisher가 만들어짐")
//let deferred = Deferred { () -> PinguPublisher in
//    print("pinguPublisher가 만들어짐\n")
//    return PinguPublisher()
//}
//
//deferred
//    .sink(receiveCompletion: { print($0) },
//          receiveValue: { print($0) })

// AnyPublisher

//let originalPublisher = [1, nil, 3].publisher
//
//let anyPublisher = originalPublisher.eraseToAnyPublisher()
//anyPublisher.sink { value in
//    print(value)
//}

// Empty

//let empty = Empty<String, Never>()
//empty
//    .sink(receiveCompletion: { print("completion: \($0)") },
//          receiveValue: { print("value: \($0)") }
//    )
//
//let notCompleteImmediatelyEmpty = Empty<String, Never>(completeImmediately: false)
//notCompleteImmediatelyEmpty
//    .sink(receiveCompletion: { print("completion: \($0)") },
//          receiveValue: { print("value: \($0)") }
//    )
//
//let anyPublisher = [1, nil, 3].publisher
//    .flatMap { value -> AnyPublisher<Int, Never> in
//        if let value = value {
//            return Just(value).eraseToAnyPublisher()
//        } else {
//            return Empty().eraseToAnyPublisher()
//        }
//    }
//
//
//anyPublisher.sink(receiveCompletion: { print("AnyPublisher completion: \($0)") },
//                  receiveValue: { print("value: \($0)") }
//)

// Fail

//enum PinguError: Error {
//    case itIsNil
//}
//
//let fail = Fail<String, PinguError>(error: .itIsNil)
//
//fail.sink(receiveCompletion: { print("receive completion: \($0)") },
//          receiveValue: { print("receive value: \($0)") }
//)
//
//let anyPublisher = [1, nil, 3].publisher
//    .flatMap { value -> AnyPublisher<Int, PinguError> in
//        if let value = value {
//            let just = Just(value).setFailureType(to: PinguError.self)
//            return just.eraseToAnyPublisher()
//        } else {
//            return Fail<Int, PinguError>(error: .itIsNil).eraseToAnyPublisher()
//        }
//    }
//    .sink(receiveCompletion: { print("Completion: \($0)") },
//          receiveValue: { print("value: \($0)") }
//    )

// Recode

let record = Record<String, Never>(output: ["Pingu", "Pinga", "Roby"], completion: .finished)

record
    .sink(receiveCompletion: { print("completion: \($0)") },
          receiveValue: { print("value: \($0)") }
    )