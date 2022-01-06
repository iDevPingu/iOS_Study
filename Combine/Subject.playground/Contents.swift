import UIKit
import Combine

struct CurrentValueSubjectSample {
    static func run() {
        // CurrentValueSubject
        print("========CurrentValueSubject========")
        let currentValueSubject = CurrentValueSubject<String, Never>("Pingu 첫번째 값")
        let firstSubscription = currentValueSubject
            .sink(receiveCompletion: { print("1 번째 sink completion: \($0)") },
                  receiveValue: { print("1 번째 sink value: \($0)") })
        
        currentValueSubject.send(completion: .finished)
        
        let secondSubscription = currentValueSubject
            .sink(receiveCompletion: { print("2 번째 sink completion: \($0)") },
                  receiveValue: { print("2 번째 sink value: \($0)") })
        
        
        // 현재 Subscriber들에게 모두 보냄
        currentValueSubject.send("Pingu 두번째 값")
        //currentValueSubject.send(completion: .finished)
        
        print(currentValueSubject.value)
    }
}

struct PassthroughSubjectSample {
    static func run() {
        // PassthroughSubject
        print("========PassthroughSubject========")

        let passthroughSubject = PassthroughSubject<String, Never>()
        let firstSubscription = passthroughSubject
            .sink(receiveCompletion: { print("1번째 sink completion: \($0)") },
                  receiveValue: { print("1번째 sink value: \($0)")}
            )

        passthroughSubject.send("PassthroughSubject 1번째 값")

        let secondSubscription = passthroughSubject
            .sink(receiveCompletion: { print("2번째 sink completion: \($0)") },
                  receiveValue: { print("2번째 sink value: \($0)")}
            )

        passthroughSubject.send("PassthroughSubject 2번째 값")

    }
}

CurrentValueSubjectSample.run()
PassthroughSubjectSample.run()
