import UIKit

func example(title: String, action: () -> Void) {
    print("// \(title) 예제 코드")
    action()
    print("\n")
}

example(title: "count()") {
    let intPublisher = [1, 2, 3, 4, 5].publisher
    
    intPublisher
        .count()
        .sink(receiveValue: { print($0) })
}

example(title: "max()") {
    let intPublisher = [5, 4, 10, 2, 1].publisher
    
    intPublisher
        .max()
        .sink(receiveValue: { print($0) })
}

example(title: "max(by:)") {
    struct Person {
        let name: String
        let age: Int
    }
    
    let personPublisher = [
        Person(name: "Pingu", age: 28),
        Person(name: "Pinga", age: 23),
        Person(name: "Roby", age: 5)
    ].publisher
    
    personPublisher
        .max { $0.age < $1.age }
        .sink(receiveValue: { print($0) })
}

example(title: "tryMax(by:)") {
    struct NagativeNumberError: Error { }
    
    let intPublisher = [5, 4, 10, -2, 1].publisher
    
    intPublisher
        .tryMax { first, second in
//            if second < 0 {
            if first < 0 {
                throw NagativeNumberError()
            }
            return first < second
        }
        .sink(receiveCompletion: { print("completion: \($0)") },
              receiveValue: { print("value: \($0)") })
}

example(title: "min()") {
    let intPublisher = [1, 2, 3, 4, 5].publisher
    
    intPublisher
        .min()
        .sink(receiveValue: { print($0) })
}

example(title: "min(by:)") {
    struct Person {
        let name: String
        let age: Int
    }
    
    let personPublisher = [
        Person(name: "Pingu", age: 28),
        Person(name: "Pinga", age: 23),
        Person(name: "Roby", age: 5)
    ].publisher
    
    personPublisher
        .min {
            print("first: \($0), second: \($1)")
            return $0.age < $1.age
        }
        .sink(receiveValue: { print($0) })
}

example(title: "tryMin(by:)") {
    struct NameIsPinguError: Error { }
    
    struct Person {
        let name: String
        let age: Int
    }
    
    let personPublisher = [
        Person(name: "Pinga", age: 23),
        Person(name: "Pingu", age: 28),
        Person(name: "Roby", age: 5)
    ].publisher
    
    personPublisher
        .tryMin { first, second in
            if first.name == "Pingu" {
                throw NameIsPinguError()
            }
            return first.age < second.age
        }
        .sink(receiveCompletion: { print("completion: \($0)") },
              receiveValue: { print("completion: \($0)") })
}
