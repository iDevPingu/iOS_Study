import Foundation

var names = ["Roby", "Pinga", "Pingu"]

func sortByAlphabetOrder(_ s1: String, _ s2: String) -> Bool {
    return s1 < s2
}
//names = names.sorted(by: sortByAlphabetOrder)
names = names.sorted { (s1: String, s2: String) -> Bool in
    return s1 < s2
}

print(names)

var reversedName = names.sorted(by: sortByAlphabetOrder)


// closure 사용
reversedName = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 < s2
})
print(reversedName)

// closure 축약 1
reversedName = names.sorted(by: { (s1, s2) -> Bool in
    return s1 > s2
})
print(reversedName)

// closure 축약 2
reversedName = names.sorted(by: { s1, s2 in return s1 < s2})
print(reversedName)

// closure 축약 3
reversedName = names.sorted(by: { s1, s2 in s1 > s2})
print(reversedName)

// closure 축약 4
reversedName = names.sorted(by: { $0 < $1})
print(reversedName)

// closure 축약 5
reversedName = names.sorted(by: > )
print(reversedName)

// 후행 클로저
reversedName = names.sorted() { $0 < $1 }
print(reversedName)
reversedName = names.sorted { $0 > $1 }
print(reversedName)

let week = [0: "Sunday", 1: "Monday", 2:"Tuesday", 3:"Wedesday", 4:"Thursday", 5:"Friday", 6:"Saturday"]
let days = [63, 12, 54]

let strings = days.map { (day) -> String in
    var day = day
    var returnValue = ""
    while(day > 0) {
        returnValue += week[day % 10]!
        day /= 10
    }
    return returnValue
}

print(strings)

// Capturing Values
// 중첩 함수에서의 값 캡처
func makeIncrementer(_ number: Int) -> () -> Int {
    var nowValue = 0
    func incrementer() -> Int {
        nowValue += number
        return nowValue
    }
    return incrementer
}

let incrementerTen = makeIncrementer(10)
print(incrementerTen())
print(incrementerTen())
print(incrementerTen())
print(incrementerTen())

// 함수와 클로저는 참조 타입이므로 이렇게 해도 계속해서 값이 증가한다
let copy = incrementerTen
print(copy())
print(copy())

// Escaping 클로저 ***
var 전역변수 = [() -> Void]()
//func withEscapingClosure(completion: @escaping () -> Void) {
//    completion()
//    전역변수.append(completion)
//}

//func noEscapingClosure(completion: () -> Void) {
//    completion()
//    전역변수.append(completion)
//}





//var completionHandlers = [() -> Void]()
//func withEscapingClosure(completion: @escaping () -> Void) {
//    completion()
//    completionHandlers.append(completion)
//}

//func nonEscapingClosure(completion: () -> Void) {
//    completion()
//    // completion 클로저가 escaping이 아니므로 밖의 것에서 사용 불가?
//    completionHandlers.append {
//        print("This is nonEscapingClosure")
//    }
//}
//let testClosure = { print("testClosure 호출") }
//let escapingClosureTest: () = withEscapingClosure(completion: testClosure)
//let nonEscapingClosureTets: () = nonEscapingClosure(completion: testClosure)
//print(completionHandlers[1])

// escaping closure

전역변수 = [() -> Void]()

func withEscapingClosure(closure: @escaping () -> Void){
    closure()
}

func withoutEscapingClosure(closure: () -> Void) {
    closure()
}
var x = 0
class exampleClass {
    var x = 0
    func testFunction() {
        withEscapingClosure { [self] in
            x = 100
        }
        withoutEscapingClosure {
            x = 50
        }
    }
}

let a = exampleClass()
a.testFunction()
print(x)
print(a.x)

struct exampleStruct {
    var y = 10
    mutating func testFunction() {
//        withEscapingClosure {
//            y = 100
//        }
        withoutEscapingClosure {
            self.y = 200
        }
    }
}


var b = exampleStruct()
b.testFunction()
print(x)
print(b.y)

// AutoClosure
var customersInLine = ["Pingu", "Pinga", "JiWorm", "Roby"]
print(customersInLine.count)

let customersProvider = { customersInLine.removeLast() }
print(customersInLine.count)

func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())")
}
serve(customer: customersProvider)

// AutoClosure를 사용하면 클로저를 반환 타입처럼 사용가능하다.
func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())")
}

serve(customer: customersInLine.removeLast())

var customersProviders: [() -> String] = []
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customersProviders.append(customerProvider)
}

collectCustomerProviders(customersInLine.removeLast())
collectCustomerProviders(customersInLine.removeLast())
print(customersInLine)

for customersProvider in customersProviders {
    print("Now serving \(customersProvider())")
}


// Auto Closure
func returnPinguFunction() -> String {
    return "Pingu"
}

func exampleFunction(_ autoclosure: @autoclosure () -> String) {
    print(autoclosure())
}

exampleFunction(returnPinguFunction())

exampleFunction("hello")

