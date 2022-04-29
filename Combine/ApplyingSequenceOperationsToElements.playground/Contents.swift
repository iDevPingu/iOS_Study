import Combine
import Foundation

func example(title: String, action: () -> Void) {
    print("// \(title) 예제 코드")
    action()
    print("\n")
}

example(title: "drop(untilOutputFrom:)") {
    let upstreamPublisher = PassthroughSubject<Int, Never>()
    let secondPublisher = PassthroughSubject<String, Never>()
    
    upstreamPublisher
        .drop(untilOutputFrom: secondPublisher)
        .sink(receiveValue: { print($0)})
    
    upstreamPublisher.send(1)
    upstreamPublisher.send(2)
    
    secondPublisher.send("a")
    
    upstreamPublisher.send(3)
    upstreamPublisher.send(4)
}

example(title: "dropFirst(_:)") {
    let intPublisher = [1, 2, 3, 4, 5].publisher
    
    intPublisher
        .dropFirst(3)
        .sink(receiveValue: { print($0) })
}

example(title: "drop(while:)") {
    let intPublisher = [2, 4, 6, 1, 2, 3, 4, 5].publisher
    
    intPublisher
        .drop { value in
            return value % 2 == 0
        }
        .sink(receiveValue: { print($0) })
}

example(title: "tryDrop(while:)") {
    struct PinguError: Error { }
    
//    let intPublisher = [2, 4, 6, 1, 2, -1, 3, 4].publisher
    let intPublisher = [2, 4, 6, -1, 1, 2, 3, 4].publisher
    intPublisher
        .tryDrop { value in
            guard value >= 0 else { throw PinguError() }
            return value % 2 == 0
        }
        .sink(receiveCompletion: { print($0) },
              receiveValue: { print($0) })
}

example(title: "append(_:)") {
    let intPublisher = [1, 2, 3, 4].publisher
    
    intPublisher
        .append(5, 6)
        .sink(receiveCompletion: { print($0) },
              receiveValue: { print($0) })
}

example(title: "append(_:) using Sequence") {
    let stringPublisher = ["My", "Name"].publisher
    
    stringPublisher
        .append(["Is", "Pingu"])
        .sink(receiveCompletion: { print($0) },
              receiveValue: { print($0) })
}

example(title: "append(_:) using Publisher") {
    let firstPublisher = ["My", "Name"].publisher
    let secondPublisher = ["Is", "Pingu"].publisher
    
    firstPublisher
        .append(secondPublisher)
        .sink(receiveCompletion: { print($0) },
              receiveValue: { print($0) })
}

example(title: "prepend(_:) using values") {
    let intPublisher = [1, 2, 3, 4].publisher
    
    intPublisher
        .prepend(5, 6)
        .sink(receiveCompletion: { print($0) },
              receiveValue: { print($0) })
}

example(title: "prepend(_:) using Sequence") {
    let intPublisher = [1, 2, 3, 4].publisher
    
    intPublisher
        .prepend([5, 6])
        .sink(receiveCompletion: { print($0) },
              receiveValue: { print($0) })
}

example(title: "prepend(_:) using Publisher") {
    let firstPublisher = [1, 2, 3, 4].publisher
    let secondPublisher = [5, 6].publisher
    
    firstPublisher
        .prepend(secondPublisher)
        .sink(receiveCompletion: { print($0) },
              receiveValue: { print($0) })
}

example(title: "prefix(_:)") {
    let intPublisher = [1, 2, 3, 4, 5].publisher
    
    intPublisher
        .prefix(6)
        .sink(receiveCompletion: { print($0) },
              receiveValue: { print($0) })
}

example(title: "prefix(while:)") {
    let intPublisher = [1, 2, 3, 4, 3, 2, 1].publisher
    
    intPublisher
        .prefix { value in
            return value <= 3
        }
        .sink(receiveCompletion: { print($0) },
              receiveValue: { print($0) })
}

example(title: "tryPrefix(while:)") {
    struct PinguError : Error { }
    
    let intPublisher = [1, 2, 3, 4, 3, 2, 1].publisher
    
    intPublisher
        .tryPrefix { value in
            guard value <= 3 else { throw PinguError() }
            return value <= 3
        }
        .sink(receiveCompletion: { print($0) },
              receiveValue: { print($0) })
}

example(title: "prefix(untilOutputFrom:)") {
    let upstreamPublisher = PassthroughSubject<Int, Never>()
    let otherPublisher = PassthroughSubject<String, Never>()
    
    upstreamPublisher
        .prefix(untilOutputFrom: otherPublisher)
        .sink(receiveCompletion: { print($0) },
              receiveValue: { print($0) })
    
    upstreamPublisher.send(1)
    upstreamPublisher.send(2)
    
    otherPublisher.send("Pingu")
    
    upstreamPublisher.send(3)
    upstreamPublisher.send(4)
}
