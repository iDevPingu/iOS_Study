import Combine
import Foundation

func example(title: String, action: () -> Void) {
    print("// \(title) 예제 코드")
    action()
    print("\n")
}

example(title: "first()") {
    let intPublisehr = [1, 2, 3, 4].publisher
    
    intPublisehr
        .first()
        .sink(receiveCompletion: { print($0) },
              receiveValue: { print($0) })
}

example(title: "first(where:)") {
    let intPublisher = [1, 3, 2, 4].publisher
    
    intPublisher
        .first(where: { value in
            return value % 2 == 0
        })
        .sink(receiveCompletion: { print($0) },
              receiveValue: { print($0) })
}

example(title: "tryFirst(where:)") {
    struct PinguError: Error { }
    
    let intPubisher = [1, -1, 2, 3].publisher
    
    intPubisher
        .tryFirst(where: { value in
            guard value < 0 else { throw PinguError() }
            return value % 2 == 0
        })
        .sink(receiveCompletion: { print($0) },
              receiveValue: { print($0) })
}

example(title: "last()") {
    let intPublisehr = [1, 2, 3, 4].publisher
    
    intPublisehr
        .last()
        .sink(receiveCompletion: { print($0) },
              receiveValue: { print($0) })
}

example(title: "last(where:)") {
    let intPublisher = [1, 5, 7, 3, 4, 9, 2].publisher
    
    intPublisher
        .last(where: { value in
            return value > 4
        })
        .sink(receiveCompletion: { print($0) },
              receiveValue: { print($0) })
}

example(title: "tryLast(where:)") {
    struct PinguError: Error { }
    
    let intPublisher = [1, 3, 7, -4, 6, 4].publisher
    
    intPublisher
        .tryLast(where: { value in
            guard value < 0 else { throw PinguError() }
            return value > 5
        })
        .sink(receiveCompletion: { print($0) },
              receiveValue: { print($0) })
}

example(title: "output(at:)") {
    let intPublisher = [0, 1, 2, 3, 4].publisher
    
    intPublisher
        .output(at: 2)
        .sink(receiveCompletion: { print($0) },
              receiveValue: { print($0) })
}

example(title: "output(in:)") {
    let intPublisher = [0, 1, 2, 3, 4, 5, 6].publisher
    
    intPublisher
//        .print()
        .output(in: 3...5)
        .sink(receiveCompletion: { print($0) },
              receiveValue: { print($0) })
    
}
