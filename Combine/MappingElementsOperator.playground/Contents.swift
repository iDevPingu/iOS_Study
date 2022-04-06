import Combine
import Foundation

func example(title: String, action: () -> Void) {
    print("\(title) 예제 코드")
    action()
    print("\n")
}

example(title: "Map") {
    let intPublisher = [1, 2, 3, 4, 5, 6, 7].publisher
    intPublisher
        .map { element in
            return element * 2
        }
        .sink(receiveValue: { print($0) })
}

example(title: "Map Key Path") {
    struct Point {
        let x: Int
        let y: Int
        let z: Int
    }
    
    let publisher = PassthroughSubject<Point, Never>()
    
    publisher
        .map(\.x, \.y, \.z)
        .sink(receiveValue: { x, y, z in
            print("x: \(x), y: \(y), z: \(z)")
        })
        
    publisher.send(Point(x: 1, y: 2, z: 3))
}

example(title: "TryMap") {
    enum PinguError: Error {
        case elementIsNil
    }
    func checkNil(element: Int?) throws -> Int {
        guard let element = element else {
            throw PinguError.elementIsNil
        }
        return element
    }
    
    let publisher = [1, 2, nil, 4].publisher
    publisher
        .tryMap { try checkNil(element: $0) }
        .sink(receiveCompletion: {
            switch $0 {
            case .failure(let error):
                print(error.localizedDescription)
            case .finished:
                print("끝~")
            }
        }, receiveValue: { print($0) })
}

example(title: "MapError") {
    enum AnyError: Error {
        case any
    }
    enum PinguError: Error {
        case elementIsNil
    }
    func checkNil(element: Int?) throws -> Int {
        guard let element = element else {
            throw AnyError.any
        }
        return element
    }
    
    let publisher = [1, 2, nil, 4].publisher
    publisher
        .tryMap { try checkNil(element: $0) }
        .mapError { $0 as? PinguError ?? .elementIsNil }
        .sink(receiveCompletion: {
            switch $0 {
            case .failure(let error):
                if error == .elementIsNil {
                    print("elementIsNil 에러")
                } else {
                    print(error.localizedDescription)
                }
            case .finished:
                print("끝~")
            }
        }, receiveValue: { print($0) })
}

example(title: "Scan") {
    let publisher = [1, 2, 3, 4, 5].publisher
    
    publisher
        .scan(0) { (latest, current) -> Int in
            print("latest: \(latest), current: \(current)")
            return latest + current
        }
        .sink(receiveValue: { print($0) })
}

example(title: "TryScan") {
    enum PinguError: Error {
        case evenNumber
    }
    
    func checkEvenNumberAndSum(_ latest: Int, _ current: Int) throws -> Int {
        guard current % 2 != 0 else { throw PinguError.evenNumber }
        return latest + current
    }
    
    let publisher = [1, 2, 3, 4, 5].publisher
    
    publisher
        .tryScan(0) { latest, current in
            try checkEvenNumberAndSum(latest, current)
        }
        .sink(receiveCompletion: { print($0) },
              receiveValue: { print($0) }
        )
}

example(title: "SetFailureType") {
    enum PinguError: Error {
        case pingu
    }
    
    Just("Hello~")
        .setFailureType(to: PinguError.self)
        .eraseToAnyPublisher()
    
    let publisher = [1, 2, 3, 4].publisher
    let pinguErrorPublisher = PassthroughSubject<Int, PinguError>()
    
    publisher
        .setFailureType(to: PinguError.self) // <Int, PinguError> 타입으로 변경
        .combineLatest(pinguErrorPublisher) // Output, Failure 타입이 같기 때문에 combineLatest 사용 가능!
        .sink(receiveCompletion: { print($0) },
              receiveValue: { print($0) }
        )
    
    pinguErrorPublisher.send(0)
    
}
