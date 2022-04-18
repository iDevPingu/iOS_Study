import Combine
import Foundation

func example(title: String, action: () -> Void) {
    print("// \(title) 예제 코드 결과")
    action()
    print("\n")
}

example(title: "contains(_:)") {
    let intPublisher = [1, 2, 3, 4, 5].publisher
    
    intPublisher
        .contains(3)
        .sink(receiveValue: { print($0) })
}

example(title: "contains(_:)") {
    let intPublisher = [3, 3, 3].publisher
    
    intPublisher
        .contains(3)
        .sink(receiveValue: { print($0) })
}

example(title: "contains(where:)") {
    let intPublisher = [1, 2, 3, 4, 5].publisher
    
    intPublisher
        .contains(where: {
            print($0)
            return $0 % 2 == 0
        })
        .sink(receiveValue: { print($0) })
}

example(title: "tryContains(where:)") {
    struct MoreThenTenError: Error { }
    
    let intPublisher = [1, 3, 5, 7, 9, 11].publisher
    
    intPublisher
        .tryContains { value in
            guard value < 10 else {
                throw MoreThenTenError()
            }
            return value < 10
        }
        .sink(receiveCompletion: { print("completion: \($0)") },
              receiveValue: { print("value: \($0)") })
}

example(title: "tryContains(where:)") {
    struct MoreThenTenError: Error { }
    
    let intPublisher = [11, 9, 7, 5, 3, 1].publisher
    
    intPublisher
        .tryContains { value in
            guard value < 10 else {
                throw MoreThenTenError()
            }
            return value < 10
        }
        .sink(receiveCompletion: { print("completion: \($0)") },
              receiveValue: { print("value: \($0)") })
}

example(title: "allSatisfy(_:)") {
    let intPublisher = [2, 2, 2, 2].publisher
    
    intPublisher
        .allSatisfy { $0 == 2 }
        .sink(receiveCompletion: { print("completion: \($0)") },
              receiveValue: { print("value: \($0)")})
}

example(title: "allSatisfy(_:)") {
    let intPublisher = [2, 2, 3, 2].publisher
    
    intPublisher
        .allSatisfy {
            print("Upstream에게 받은 값: \($0)")
            return $0 == 2
        }
        .sink(receiveCompletion: { print("completion: \($0)") },
              receiveValue: { print("value: \($0)")})
}

example(title: "tryAllSatisfy(_:)") {
    struct MoreThenTenError: Error { }
    
    let intPublisher = [7, 9, 11, 13].publisher
    
    intPublisher
        .tryAllSatisfy { value in
            print("Upstream에게 받은 값: \(value)")
            guard value < 10 else {
                throw MoreThenTenError()
            }
            return value < 10
        }
        .sink(receiveCompletion: { print("completion: \($0)") },
              receiveValue: { print("value: \($0)") })
}
