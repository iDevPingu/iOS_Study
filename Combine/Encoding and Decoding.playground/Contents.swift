import Combine
import Foundation


func example(title: String, action: () -> Void) {
    print("// \(title) 예제 코드")
    action()
    print("\n")
}

var subscriptions = Set<AnyCancellable>()

example(title: "encode(encoder:)") {
    struct Penguin: Codable {
        let name: String
        let age: Int
        let address: String
    }
    
    let penguinPublisher = PassthroughSubject<Penguin, Never>()
    penguinPublisher
        .encode(encoder: JSONEncoder())
        .sink(receiveCompletion: { print($0) },
              receiveValue: { data in
            print("인코딩 된 값: \(data)")
            guard let string = String(data: data, encoding: .utf8) else { return }
            print("문자열 표현: \(string)")
        })
    
    penguinPublisher.send(.init(name: "Pingu", age: 5, address: "Antarctic igloo"))
}

example(title: "decode(type:decoder:)") {
    struct Penguin: Codable {
        let name: String
        let age: Int
        let address: String
    }
    
    let dataPublisher = PassthroughSubject<Data, Never>()
    dataPublisher
        .decode(type: Penguin.self, decoder: JSONDecoder())
        .sink(receiveCompletion: { print($0) },
              receiveValue: { print("디코딩 된 값: \($0)") })
    
    let jsonString = """
        {"name":"Pingu","age":5,"address":"Antarctic igloo"}
    """
    
    dataPublisher.send(Data(jsonString.utf8))
}
