import Combine
import Foundation

func example(title: String, action: () -> Void) {
    print("// \(title) 예제 코드")
    action()
    print("\n")
}

example(title: "merge(with:)") {
    let firstPublisher = PassthroughSubject<Int, Never>()
    let secondPublisher = PassthroughSubject<Int, Never>()
    
    firstPublisher
        .merge(with: secondPublisher)
        .sink(receiveCompletion: { print($0) },
              receiveValue: { print($0) })
    
    firstPublisher.send(1)
    secondPublisher.send(11)
    firstPublisher.send(2)
    secondPublisher.send(12)
}

example(title: "MergeMany") {
    var publishers: [PassthroughSubject<Int, Never>] = []

    for _ in 0...20 {
        let publisher = PassthroughSubject<Int, Never>()
        publishers.append(publisher)
    }
    
    Publishers.MergeMany(publishers)
        .sink(receiveValue: { print($0, terminator: " ") })
    
    for index in 0..<publishers.count {
        publishers[index].send(index)
    }
}
