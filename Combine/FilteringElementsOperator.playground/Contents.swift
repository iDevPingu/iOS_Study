import Combine
import Foundation

func example(title: String, action: () -> Void) {
    print("\(title) 예제 코드")
    action()
    print("\n")
}

example(title: "Filter") {
    let intPublisher = [1, 2, 3, 4, 5, 6, 7].publisher
    intPublisher
        .filter { element in
            return element % 2 == 0
        }
        .sink { print($0) }
}

example(title: "TryFilter") {
    enum PinguError: Error {
        case oddNumber
    }
    
    func checkEvenNumber(_ number: Int) throws -> Bool {
        guard number % 2 == 0 else {
            throw PinguError.oddNumber
        }
        return true
    }
    
    let intPublisher = [2, 2, 4, 4, 5, 6].publisher
    intPublisher
        .tryFilter { element in
            try checkEvenNumber(element)
        }
        .sink(receiveCompletion: { completion in
            switch completion {
            case .failure(let error):
                print(error.localizedDescription)
            case .finished:
                print("모두 짝수네용")
            }
        }, receiveValue: { print($0) })
}

example(title: "CompactMap") {
    let stringPublisher = ["1", "2", "a.b", "3"].publisher
    stringPublisher
        .compactMap { element in
            return Int(element)
        }
        .sink(receiveValue: { print($0) })
}

example(title: "TryCompactMap") {
    enum PinguError: Error {
        case thisIsNil
    }
    
    func checkTranformIntAvailable(string: String) throws -> Int {
        guard let intValue = Int(string) else {
            throw PinguError.thisIsNil
        }
        return intValue
    }
    
    let stringPublisher = ["1", "2", "a.b", "3"].publisher
    stringPublisher
        .tryCompactMap { element in
            try checkTranformIntAvailable(string: element)
        }
        .sink(receiveCompletion: { completion in
            switch completion {
            case .failure(let error):
                print(error.localizedDescription)
            case .finished:
                print("모두 Int로 변환가능해요")
            }
        }, receiveValue: { print($0) })
}

example(title: "RemoveDuplicates") {
    let intPublisher = [1, 2, 3, 1, 1, 2, 2, 3].publisher
    intPublisher
        .removeDuplicates()
        .sink(receiveValue: { print($0) })
}

example(title: "RemoveDuplicates(by:)") {
    struct Name {
        let lastName: String
        let firstName: String
        
        func printName() {
            print(lastName + firstName)
        }
    }
    
    let namePublisher = [
        Name(lastName: "Pin", firstName: "gu"),
        Name(lastName: "Pin", firstName: "ga"),
        Name(lastName: "Ro", firstName: "By"),
        Name(lastName: "O", firstName: "dung")
    ].publisher
    
    namePublisher
        .removeDuplicates(by: { prev, current in
            return prev.lastName == current.lastName
        })
        .sink(receiveValue: { $0.printName() })
}

example(title: "TryRemoveDuplicates") {
    enum PinguError: Error {
        case duplicate
    }
    
    let intPublisher = [1, 2, 2, 3, 3].publisher
    intPublisher
        .tryRemoveDuplicates { prev, current in
            if prev == current {
                throw PinguError.duplicate
            }
            return prev == current
        }
        .sink(receiveCompletion: { completion in
            switch completion {
            case .failure(let error):
                print(error.localizedDescription)
            case .finished:
                print("중복값 없음")
            }
        }, receiveValue: { print($0) })
}

example(title: "ReplaceEmpty") {
    let intPublisher = [].publisher
    intPublisher
        .replaceEmpty(with: 5)
        .sink(receiveValue: { print($0) })
}

example(title: "ReplaceError") {
    enum PinguError: Error {
        case thisIsNil
    }
    
    func checkTranformIntAvailable(string: String) throws -> Int {
        guard let intValue = Int(string) else {
            throw PinguError.thisIsNil
        }
        return intValue
    }
    
    let stringPublisher = ["1", "2", "a.b", "3"].publisher
    stringPublisher
        .tryCompactMap { element in
            try checkTranformIntAvailable(string: element)
        }
        // Error를 0으로 모두 대체
        .replaceError(with: 0)
        .sink(receiveCompletion: { completion in
            switch completion {
            case .failure(let error):
                print(error.localizedDescription)
            case .finished:
                print("모두 Int로 변환가능해요")
            }
        }, receiveValue: { print($0) })
}

example(title: "ReplaceError With Catch") {
    enum PinguError: Error {
        case thisIsNil
    }
    
    func checkTranformIntAvailable(string: String) throws -> Int {
        guard let intValue = Int(string) else {
            throw PinguError.thisIsNil
        }
        return intValue
    }
    
    let stringPublisher = ["1", "2", "a.b", "3"].publisher
    stringPublisher
        .tryCompactMap { element in
            try checkTranformIntAvailable(string: element)
        }
        // Error를 0으로 모두 대체
        .catch { error in
            Just(0)
        }
        .sink(receiveCompletion: { completion in
            switch completion {
            case .failure(let error):
                print(error.localizedDescription)
            case .finished:
                print("모두 Int로 변환가능해요")
            }
        }, receiveValue: { print($0) })
}
