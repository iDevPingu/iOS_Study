import Foundation
import Combine

//class IntSubscriber: Subscriber {
//    typealias Input = Int
//    typealias Failure = Never
//
//    // Publisher가 Subscription주면 호출됨
//    func receive(subscription: Subscription) {
//        // Subscription에게 값을 요청
//        subscription.request(.max(2))
//    }
//
//    // Publisher가 주는 값을 처리
//    func receive(_ input: Int) -> Subscribers.Demand {
//        print("Received value: \(input)")
//        // Publisher에게 한 번 더 달라고 요청
//        return .max(1)
//        // Publisher에게 값 더 이상 안줘도 된다고 알림
////        return .none
//        // Publisher에게 끝없이 값을 달라고 요청
////        return .unlimited
//    }
//
//    func receive(completion: Subscribers.Completion<Never>) {
//        print("Received completion: \(completion)")
//    }
//}

// IntArray를 하나 만듭니다.
//let intArray: [Int] = [1,2,3,4,5]

// IntSubscriber를 만듭니다.
//let intSubscriber = IntSubscriber()

// IntArray Publisher를 subscribe 합니다.
// intSubscriber가 intArray.publisher에게 값을 요청하면 달라고 말합니다.
//intArray.publisher
//    .subscribe(intSubscriber)
//
//var sample: [AnyCancellable] = []
//intArray.publisher
//    .sink { _ in
//
//    } receiveValue: { _ in
//
//    }
//    .store(in: &sample)


// AnyCancellable
let subject = PassthroughSubject<Int, Never>()
let anyCancellable = subject
    .sink(receiveCompletion: { completion in
        print("received completion: \(completion)")
    }, receiveValue: { value in
        print("received value: \(value)")
    })

subject.send(1)
anyCancellable.cancel()
subject.send(2)
    
//
//class IntSubscriber: Subscriber {
//    typealias Input = Int
//    typealias Failure = Never
//
//    // Publisher가 Subscription주면 호출됨
//    func receive(subscription: Subscription) {
//        // Subscription에게 값을 요청
//        subscription.request(.max(1))
//    }
//
//    // Publisher가 주는 값을 처리
//    func receive(_ input: Int) -> Subscribers.Demand {
//        print("Received value: \(input)")
//        return .max(1)
//    }
//
//    func receive(completion: Subscribers.Completion<Never>) {
//        print("Received completion: \(completion)")
//    }
//}
//
//// AnyCancellable cancel 클로저 구현해보기
//final class PinguSubscription: Subscription {
//    private let cancellable: Cancellable
//
//    init(_ cancel: @escaping () -> Void) {
//        self.cancellable = AnyCancellable(cancel)
//    }
//
//    func request(_ demand: Subscribers.Demand) {
//
//    }
//
//    func cancel() {
//        self.cancellable.cancel()
//    }
//}
//
//let subject = PassthroughSubject<Int, Never>()
//let anyCancellable = subject
//    .handleEvents(
//        receiveCancel: {
//            // cancel()이 불렸을 때 호출될 클로저
//            print("Cancel 불렸음!")
//        })
//    .sink(receiveValue: { value  in
//        print("Receive Value: \(value)")
//    })
//subject.send(1)
//anyCancellable.cancel()
