import Combine
import Foundation

// AnyCancellable
//var subscriptions = Set<AnyCancellable>()
//let stringArray: [String] = ["Pingu", "Pinga"]
//stringArray.publisher
//    .sink(receiveValue: { print($0) })
//    .store(in: &subscriptions)


struct YoutubeSubscriber {
    let name: String
    let age: Int
}

// Subscription
final class PinguSubscription<S: Subscriber>: Subscription where S.Input == YoutubeSubscriber {
    var requested: Subscribers.Demand = .none
    var youtubeSubscribers: [YoutubeSubscriber]
    var subscriber: S?
    
    init(subscriber: S,
         youtubeSubscribers: [YoutubeSubscriber]) {
        print("PinguSubscription이 생성됨!")
        self.subscriber = subscriber
        self.youtubeSubscribers = youtubeSubscribers
    }
    
    func request(_ demand: Subscribers.Demand) {
        print("요청받은 demand : \(demand)")
        for youtubeSubscriber in youtubeSubscribers {
            subscriber?.receive(youtubeSubscriber)
        }
        
//        subscriber?.receive(completion: .finished)
    }
    
    func cancel() {
        print("PinguSubscription이 cancel됨!")
        youtubeSubscribers.removeAll()
        subscriber = nil
    }
}

// Publisher
extension Publishers {
    struct PinguPublisher: Publisher {
        var youtubeSubscribers: [YoutubeSubscriber]
        
        func receive<S>(subscriber: S)
        where S : Subscriber, Never == S.Failure, YoutubeSubscriber == S.Input {
            let subscription = PinguSubscription(subscriber: subscriber, youtubeSubscribers: youtubeSubscribers)
            subscriber.receive(subscription: subscription)
        }
        
        typealias Output = YoutubeSubscriber
        typealias Failure = Never
        
        mutating func append(subscriber: YoutubeSubscriber) {
            youtubeSubscribers.append(subscriber)
        }
    }
    
    static func pingu(youtubeSubscribers: [YoutubeSubscriber]) -> Publishers.PinguPublisher {
        return Publishers.PinguPublisher(youtubeSubscribers: youtubeSubscribers)
    }
}

var subscriptions = Set<AnyCancellable>()
let youtubeSubscriber1 = YoutubeSubscriber(name: "Pingu", age: 7)
let youtubeSubscriber2 = YoutubeSubscriber(name: "Pinga", age: 5)

var youtubeSubscribers = [youtubeSubscriber1, youtubeSubscriber2]

let pinguPublisher = Publishers.pingu(youtubeSubscribers: youtubeSubscribers)
pinguPublisher
    .sink(receiveCompletion: { print($0) },
          receiveValue: { print("name: \($0.name), age: \($0.age)") }
    )
    .store(in: &subscriptions)

for subscription in subscriptions {
    subscription.cancel()
}


class MySubscriber: Subscriber {
    func receive(subscription: Subscription) {
            
    }
    
    func receive(_ input: Int) -> Subscribers.Demand {
        return .unlimited
    }
    
    func receive(completion: Subscribers.Completion<Never>) {
        
    }
    
    typealias Input = Int
    typealias Failure = Never
}

class MySubscription: Subscription {
    init() {
        
    }
    
    func request(_ demand: Subscribers.Demand) {
        
    }
    
    func cancel() {
        
    }
}

let mysubscriber1 = MySubscriber()
let mysubscriber2 = MySubscriber()
let mySubscription = MySubscription()
mysubscriber1.receive(subscription: mySubscription)
mysubscriber2.receive(subscription: mySubscription)


