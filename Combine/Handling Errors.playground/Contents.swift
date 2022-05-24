import Combine
import Foundation

func example(title: String, action: () -> Void) {
    print("// \(title) 예제 코드")
    action()
    print("\n")
}

example(title: "assertNoFailure(_:file:line:)") {
    struct PinguError: Error { }
    
    let intPublisher = PassthroughSubject<Int, PinguError>()
    
    intPublisher
        .assertNoFailure()
        .sink(receiveCompletion: { print($0) },
              receiveValue: { print($0) })
    
    intPublisher.send(1)
    intPublisher.send(2)
//    intPublisher.send(completion: .failure(PinguError())) // fatal Error 발생
}

example(title: "catch(_:)") {
    struct PinguError: Error { }
    
    let intPublisher = [4, 6, 5, 12, 7, 9, 10].publisher
    
    intPublisher
        .tryMap { value in
            guard value % 2 == 0 else { throw PinguError() }
            return value * 2
        }
        .catch { error in
            Just(-1)
        }
        .sink(receiveCompletion: { print($0) },
              receiveValue: { print($0) })

}

example(title: "tryCatch(_:)") {
    struct PinguError: Error { }
    let intPublisher = [4, 6, 7].publisher
    let anotherPublisher = [10, 11].publisher
    intPublisher
        .tryMap { value in
            guard value % 2 == 0 else { throw PinguError() }
            return value * 2
        }
        .tryCatch({ error -> AnyPublisher<Int, Never> in
            return anotherPublisher.eraseToAnyPublisher()
        })
        .sink(receiveCompletion: { print($0) },
              receiveValue: { print($0) })
}

example(title: "tryCatch(_:)") {
    struct PinguError: Error { }
    struct AnotherError: Error { }
    let intPublisher = [4, 6, 7].publisher
    let anotherPublisher = [10, 11].publisher
    intPublisher
        .tryMap { value in
            guard value % 2 == 0 else { throw PinguError() }
            return value * 2
        }
        .tryCatch({ error -> AnyPublisher<Int, Never> in
            if error is PinguError { throw AnotherError() }
            return anotherPublisher.eraseToAnyPublisher()
        })
        .sink(receiveCompletion: { print($0) },
              receiveValue: { print($0) })
}


example(title: "retry(_:)") {
    struct PinguError: Error { }
    
    var retryCount: Int = 0
    
    func retryTest() throws {
        if retryCount < 4 {
            retryCount += 1
            print("\(retryCount) 번째 재시도")
            throw PinguError()
        }
    }
    
    let intPublisher = [1, 2, 3, 4].publisher
    
    intPublisher
        .tryMap({ value -> Int in
            try retryTest()
            return value
        })
        .retry(3)
        .sink(receiveCompletion: { print($0) },
              receiveValue: { print("receive: \($0)") })
}
