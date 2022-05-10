import Combine
import Foundation

func example(title: String, action: () -> Void) {
    print("// \(title) 예제 코드 결과")
    action()
    print("\n")
}

example(title: "combineLatest(_ other:, _ transform:)") {
    let firstPublisher = PassthroughSubject<String, Error>()
    let secondPublisher = PassthroughSubject<String, Error>()
    
    firstPublisher
        .combineLatest(secondPublisher) { value1, value2 in
            return value1 + value2
        }
        .sink(receiveCompletion: { print($0) },
              receiveValue: { print($0) })
    
    firstPublisher.send("First ")
    secondPublisher.send("Second")
    
    secondPublisher.send("Second-2")
    firstPublisher.send("First-2 ")
    
    secondPublisher.send(completion: .finished)
    firstPublisher.send(completion: .finished)
}

example(title: "combineLatest(_ other:)") {
    let firstPublisher = PassthroughSubject<String, Error>()
    let secondPublisher = PassthroughSubject<String, Error>()
    
    firstPublisher
        .combineLatest(secondPublisher)
        .sink(receiveCompletion: { print($0) },
              receiveValue: { print($0) })
    
    firstPublisher.send("First ")
    secondPublisher.send("Second")
    
    firstPublisher.send("First-2")
    
    secondPublisher.send(completion: .finished)
    firstPublisher.send(completion: .finished)
}

example(title: "combineLatest(_ publisher1:, _ publisher2:, _ transform:) ") {
    let firstPublisher = PassthroughSubject<String, Error>()
    let secondPublisher = PassthroughSubject<String, Error>()
    let thirdPublisher = PassthroughSubject<String, Error>()
    
    firstPublisher
        .combineLatest(secondPublisher, thirdPublisher) { value1, value2, value3 in
            return value1 + value2 + value3
        }
        .sink(receiveCompletion: { print($0) },
              receiveValue: { print($0) })
    
    firstPublisher.send("First ")
    secondPublisher.send("Second ")
    thirdPublisher.send("Third")
    
    secondPublisher.send("Second-2 ")
    
    firstPublisher.send(completion: .finished)
    secondPublisher.send(completion: .finished)
    
    thirdPublisher.send("Third-2")
    thirdPublisher.send(completion: .finished)
}

example(title: "combineLatest(_ publisher1:, _ publisher2:) ") {
    let firstPublisher = PassthroughSubject<String, Error>()
    let secondPublisher = PassthroughSubject<String, Error>()
    let thirdPublisher = PassthroughSubject<String, Error>()
    
    firstPublisher
        .combineLatest(secondPublisher, thirdPublisher)
        .sink(receiveCompletion: { print($0) },
              receiveValue: { print($0) })
    
    firstPublisher.send("First ")
    secondPublisher.send("Second ")
    thirdPublisher.send("Third")
    
    secondPublisher.send("Second-2 ")
    
    firstPublisher.send(completion: .finished)
    secondPublisher.send(completion: .finished)
    
    thirdPublisher.send("Third-2")
    thirdPublisher.send(completion: .finished)
}

example(title: "combineLatest(_ publisher1:, _ publisher2:, _ publisher3, _ transform:) ") {
    let firstPublisher = PassthroughSubject<String, Error>()
    let secondPublisher = PassthroughSubject<String, Error>()
    let thirdPublisher = PassthroughSubject<String, Error>()
    let fourthPublisher = PassthroughSubject<String, Error>()
    
    firstPublisher
        .combineLatest(secondPublisher, thirdPublisher, fourthPublisher) { value1, value2, value3, value4 in
            return value1 + value2 + value3 + value4
        }
        .sink(receiveCompletion: { print($0) },
              receiveValue: { print($0) })
    
    firstPublisher.send("First ")
    secondPublisher.send("Second ")
    thirdPublisher.send("Third ")
    fourthPublisher.send("Fourth")
    
    secondPublisher.send("Second-2 ")
    
    firstPublisher.send(completion: .finished)
    secondPublisher.send(completion: .finished)
    
    thirdPublisher.send("Third-2 ")
    thirdPublisher.send(completion: .finished)
    
    fourthPublisher.send(completion: .finished)
}

example(title: "combineLatest(_ publisher1:, _ publisher2:, _ publisher3) ") {
    let firstPublisher = PassthroughSubject<String, Error>()
    let secondPublisher = PassthroughSubject<String, Error>()
    let thirdPublisher = PassthroughSubject<String, Error>()
    let fourthPublisher = PassthroughSubject<String, Error>()
    
    firstPublisher
        .combineLatest(secondPublisher, thirdPublisher, fourthPublisher)
        .sink(receiveCompletion: { print($0) },
              receiveValue: { print($0) })
    
    firstPublisher.send("First ")
    secondPublisher.send("Second ")
    thirdPublisher.send("Third ")
    fourthPublisher.send("Fourth")
    
    secondPublisher.send("Second-2 ")
    
    firstPublisher.send(completion: .finished)
    secondPublisher.send(completion: .finished)
    
    thirdPublisher.send("Third-2 ")
    thirdPublisher.send(completion: .finished)
    
    fourthPublisher.send(completion: .finished)
}
