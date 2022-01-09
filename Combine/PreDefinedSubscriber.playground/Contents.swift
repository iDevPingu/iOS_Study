import Combine
import Foundation

struct PreDefinedSubscriber {
    static func sinkExample() {
        print("======Sink======")
        let intArray: [Int] = [1,2,3,4,5]
        let intArrayPublisher = intArray.publisher
        
        intArrayPublisher
            .sink(receiveCompletion: { print("completion: \($0)") },
                  receiveValue: { print("value: \($0)")})
        
        let subject = PassthroughSubject<Int, Never>()
        let firstSink = Subscribers.Sink<Int, Never>(receiveCompletion: { print("first sink completion: \($0)") },
                                                receiveValue: { print("first sink value: \($0)")})
        let secondSink = Subscribers.Sink<Int, Never>(receiveCompletion: { print("second sink completion: \($0)") },
                                                receiveValue: { print("second sink value: \($0)")})
            
        subject.subscribe(firstSink)
        subject.subscribe(secondSink)
        subject.send(1)
        
        // 첫 번째 sink 취소
        firstSink.cancel()
        
        subject.send(2)
        subject.send(completion: .finished)
        
//        print("description: \(sink.description)")
//        print("playgroundDescription: \(sink.playgroundDescription)")
//        print("customMirror: \(sink.customMirror)")
    }
    
    static func assignExample() {
        class SampleObject {
            var intValue: Int {
                didSet {
                    print("intValue Changed: \(intValue)")
                }
            }
            
            init(intValue: Int) {
                self.intValue = intValue
            }
            
            deinit {
                print("sample object deinit")
            }
        }

        let myObject = SampleObject(intValue: 5)

        let intArrayPublisher = [6,7,8,9].publisher
        
        //        let assign = Subscribers.Assign<SampleObject, Int>(object: myObject, keyPath: \.intValue)
        //        intArrayPublisher.subscribe(assign)
        
        intArrayPublisher
            .assign(to: \.intValue, on: myObject)
        
        print(myObject.intValue)
    }
    
    static func demandExample() {
        class DemandTestSubscriber: Subscriber {
            typealias Input = Int
            typealias Failure = Never
            
            func receive(subscription: Subscription) {
                print("subscribe 시작!")
                // 여기서 Demand를 설정해줄 수도 있어요!
                subscription.request(.unlimited)
            }
            
            func receive(_ input: Int) -> Subscribers.Demand {
                // input 값이 2일때만 요청횟수를 1 추가합니다.
                if input == 2 {
                    return .none
                } else {
                    return .none
                }
            }
            
            func receive(completion: Subscribers.Completion<Never>) {
                print("receive completion: \(completion)")
            }
        }

        let publisher = [2, 3, 4, 5].publisher
        let subscriber = DemandTestSubscriber()
        publisher
            .print()
            .subscribe(subscriber)
    }
    
    static func completionExample() {
        enum PinguError: Error {
            case pinguIsBaboo
        }

        class PinguSubscriber: Subscriber {
            typealias Input = Int
            typealias Failure = PinguError
            
            func receive(subscription: Subscription) {
                subscription.request(.unlimited)
            }
            
            func receive(_ input: Int) -> Subscribers.Demand {
                print("receive input: \(input)")
                return .none
            }
            
            func receive(completion: Subscribers.Completion<PinguError>) {
                if completion == .failure(.pinguIsBaboo) {
                    print("Pingu는 바보입니다.")
                } else {
                    print("finished!")
                }
            }
        }

        let subject = PassthroughSubject<Int, PinguError>()
        let subscriber = PinguSubscriber()

        subject.subscribe(subscriber)

        subject.send(100)
        subject.send(completion: .failure(.pinguIsBaboo))
        subject.send(200)
    }
    
    static func anySubscriberExample() {
        enum PinguError: Error {
            case pinguIsBaboo
        }

        class PinguSubscriber: Subscriber {
            typealias Input = Int
            typealias Failure = PinguError
            
            func receive(subscription: Subscription) {
                subscription.request(.unlimited)
            }
            
            func receive(_ input: Int) -> Subscribers.Demand {
                print("receive input: \(input)")
                return .none
            }
            
            func receive(completion: Subscribers.Completion<PinguError>) {
                if completion == .failure(.pinguIsBaboo) {
                    print("Pingu는 바보입니다.")
                } else {
                    print("finished!")
                }
            }
        }

        let subject = PassthroughSubject<Int, PinguError>()
        
        let pinguSubscriber = PinguSubscriber()
        let anySubscriber = AnySubscriber(pinguSubscriber)

        subject.subscribe(pinguSubscriber)
        subject.subscribe(anySubscriber)
        subject.send(completion: .failure(.pinguIsBaboo))
    }
}

//PreDefinedSubscriber.sinkExample()
//PreDefinedSubscriber.assignExample()
//PreDefinedSubscriber.demandExample()
//PreDefinedSubscriber.completionExample()
PreDefinedSubscriber.anySubscriberExample()
