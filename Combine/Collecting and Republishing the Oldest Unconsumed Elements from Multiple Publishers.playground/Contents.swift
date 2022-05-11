import Combine
import Foundation

func example(title: String, action: () -> Void) {
    print("// \(title) 예제 코드")
    action()
    print("\n")
}

example(title: "zip(_ other:)") {
    let firstPublisher = PassthroughSubject<Int, Never>()
    let secondPublisher = PassthroughSubject<Int, Never>()
    
    firstPublisher
        .zip(secondPublisher)
        .sink(receiveCompletion: { print($0) },
              receiveValue: { print($0) })
    
    firstPublisher.send(1)
    secondPublisher.send(11)
    
    firstPublisher.send(2)
    secondPublisher.send(12)
    
    firstPublisher.send(3)
    firstPublisher.send(4)
    
    secondPublisher.send(13)
    firstPublisher.send(completion: .finished) // firstPublisher가 내보낸 4는 아직 남아있음.
    secondPublisher.send(14) // 모든 값이 처리되어 finished 됨
}

example(title: "zip(_ other:, _ transform:)") {
    let firstPublisher = PassthroughSubject<String, Never>()
    let secondPublisher = PassthroughSubject<String, Never>()
    
    firstPublisher
        .zip(secondPublisher) { value1, value2 in
            return value1 + " " + value2
        }
        .sink(receiveCompletion: { print($0) },
              receiveValue: { print($0) })
    
    firstPublisher.send("I'm First")
    secondPublisher.send("I'm Second")
    
    firstPublisher.send("I'm First!")
    firstPublisher.send("I'm First!!")
    
    secondPublisher.send("I'm Second!")
    
    firstPublisher.send(completion: .finished) // firstPublisher가 내보낸 "I'm First!!"는 아직 남아있음

    secondPublisher.send("Bye~") // 모든 값이 처리되어 finished 됨
}
