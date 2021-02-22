import UIKit

class Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    deinit {
        print("메모리에서 해제!")
    }
}
// Strong Reference - 강한 참조

//var pingu: Person?
//var pinga: Person?
//var roby: Person?
//
//pingu = Person(name: "pingu", age: 5) // reference count = 1
//pinga = pingu // reference count = 2
//roby = pingu // reference count = 3
//
//pingu = nil // reference count = 2
//pinga = nil // reference count = 1
//roby = nil // reference count = 0 -> 메모리 해제!

// Strong Reference Cycle

//class Room {
//    var roomNumber: Int
//    var customer: Customer?
//
//    init(roomNumber: Int) {
//        self.roomNumber = roomNumber
//    }
//
//    deinit {
//        print("Room 인스턴스 메모리에서 해제")
//    }
//}
//
//class Customer {
//    var name: String
//    var room: Room?
//
//    init(name: String) {
//        self.name = name
//    }
//
//    deinit {
//        print("Customer 인스턴스 메모리에서 해제")
//    }
//}
//
//var suiteRoom: Room?
//var tom: Customer?
//
//suiteRoom = Room(roomNumber: 1004) // Room RC = 1
//tom = Customer(name: "tom") // Customer RC = 1
//
//suiteRoom?.customer = tom // Customer RC = 2
//tom?.room = suiteRoom // Room RC = 2
//
//suiteRoom = nil // Room RC = 1
//tom = nil // Customer RC = 1

// String Reference Cycle 해결 - weak reference 사용
//class Room {
//    var roomNumber: Int
//    weak var customer: Customer?
//
//    init(roomNumber: Int) {
//        self.roomNumber = roomNumber
//    }
//
//    deinit {
//        print("Room 인스턴스 메모리에서 해제")
//    }
//}
//
//class Customer {
//    var name: String
//    var room: Room?
//
//    init(name: String) {
//        self.name = name
//    }
//
//    deinit {
//        print("Customer 인스턴스 메모리에서 해제")
//    }
//}
//
//var suiteRoom: Room?
//var tom: Customer?
//
//suiteRoom = Room(roomNumber: 1004) // Room RC = 1
//tom = Customer(name: "tom") // Customer RC = 1
//
//suiteRoom?.customer = tom // Customer RC = 1
//tom?.room = suiteRoom // Room RC = 2
//
//suiteRoom = nil // Room RC = 1
//tom = nil // Customer RC = 0 -> Customer, Room 인스턴스 메모리에서 해제!

// unowned Reference

class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit {
        print("Customer 인스턴스 메모리 해제!")
    }
}
class CreditCard {
    let cardCompany: String
    unowned var customer: Customer?
    init(cardCompany: String, customer: Customer) {
        self.cardCompany = cardCompany
        self.customer = customer
    }
    deinit {
        print("CreditCard 인스턴스 메모리 해제!")
    }
}

var pingu: Customer?
pingu = Customer(name: "Pingu") // Customer RC = 1
var card: CreditCard?
card = CreditCard(cardCompany: "Korea", customer: pingu!)
pingu?.card = card
pingu = nil

print(card?.customer?.name)
