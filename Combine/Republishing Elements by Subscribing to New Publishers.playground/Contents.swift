import Combine
import Foundation
import UIKit

func example(title: String, action: () -> Void) {
    print("// \(title) 예제 코드")
    action()
    print("\n")
}

var subscriptions = Set<AnyCancellable>()

example(title: "flatMap(maxPublishers:_:)") {
    func decodeOnlyAlphabet(_ codes: [Int]) -> AnyPublisher<String, Never> {
        Just(
            codes
                .compactMap { code in
                    guard (65...90).contains(code) || (97...122).contains(code) else { return nil }
                    return String(UnicodeScalar(code) ?? " ")
                }
                .joined()
        )
        .eraseToAnyPublisher()
    }
    
    let intArrayPublisher = PassthroughSubject<[Int], Never>()
    intArrayPublisher
        .flatMap(decodeOnlyAlphabet)
        .sink(receiveCompletion: { print($0) },
              receiveValue: { print($0) })
    
    intArrayPublisher.send([1, 80, 105, 110, 103, 117])
    intArrayPublisher.send([1, 80, 105, 110, 103, 97])
    intArrayPublisher.send(completion: .finished)
}

example(title: "flatMap(maxPublishers:_:)") {
    let publisher1 = PassthroughSubject<String, Never>()
    let publisher2 = PassthroughSubject<String, Never>()
    
    let publishers = PassthroughSubject<PassthroughSubject<String, Never>, Never>()
    
    publishers
        .flatMap(maxPublishers: .max(1)) { $0 }
        .sink(receiveCompletion: { print($0) },
              receiveValue: { print($0) })
    
    publishers.send(publisher1)
    publishers.send(publisher2)
    
    publisher1.send("Hello")
    publisher1.send("Pingu")
    
    publisher2.send("Good Bye")
    publisher2.send("Pinga")
    
    publisher1.send(completion: .finished)
    publishers.send(completion: .finished)
}

example(title: "flatMap(_:)") {
    let url = URL(string: "https://source.unsplash.com/random")!
    
    func getImage() -> AnyPublisher<UIImage?, Never> {
        URLSession.shared
            .dataTaskPublisher(for: url)
            .map { data, _ in UIImage(data: data) }
            .replaceError(with: nil)
            .eraseToAnyPublisher()
    }
    
    let publisher = PassthroughSubject<Void, Never>()
    
    publisher
        .flatMap(maxPublishers: .max(1), getImage)
        .sink(receiveCompletion: { print($0) },
              receiveValue: { print($0) })
        .store(in: &subscriptions)
    
    publisher.send()
    publisher.send()
    publisher.send()
    publisher.send(completion: .finished)
}

example(title: "switchToLatest()") {
    let publisher1 = PassthroughSubject<Int, Never>()
    let publisher2 = PassthroughSubject<Int, Never>()
    let publisher3 = PassthroughSubject<Int, Never>()
    
    let publishers = PassthroughSubject<PassthroughSubject<Int, Never>, Never>()
    
    publishers
        .switchToLatest()
        .sink(receiveCompletion: { print($0) },
              receiveValue: { print($0) })
    
    publishers.send(publisher1)
    publisher1.send(1)
    
    publishers.send(publisher2)
    publisher1.send(2)  // downstream으로 전달이 안된다
    publisher2.send(11)
    
    publishers.send(publisher3)
    publisher1.send(3)  // downstream으로 전달이 안된다
    publisher2.send(12)  // downstream으로 전달이 안된다
    publisher3.send(111)
    
    publisher3.send(completion: .finished)
    publishers.send(completion: .finished)
}

example(title: "switchToLatest with network request") {
    let url = URL(string: "https://source.unsplash.com/random")!
    
    func getImage() -> AnyPublisher<UIImage?, Never> {
        URLSession.shared
            .dataTaskPublisher(for: url)
            .map { data, _ in UIImage(data: data) }
            .replaceError(with: nil)
            .eraseToAnyPublisher()
    }
    
    let userTap = PassthroughSubject<Void, Never>()
    
    userTap
        .map { _ in getImage() }
        .switchToLatest()
        .sink(receiveCompletion: { print($0) },
              receiveValue: { print($0) })
        .store(in: &subscriptions)
    
    userTap.send()
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
        userTap.send()
    }
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 3.01) {
        userTap.send()
    }
}
