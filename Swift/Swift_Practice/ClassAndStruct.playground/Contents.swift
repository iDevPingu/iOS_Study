import UIKit

class SimpleClass {
    var count: Int = 0
    
    deinit {
        print("할당 해제")
    }
}
struct SimpleStruct {
    var count: Int = 0
}

var class1 = SimpleClass()
var class2 = class1
var class3 = class1

class3.count = 3

print(class1.count) // class3의 값을 변경했지만 참조타입이므로 class1도 변경 되는 것을 볼 수 있다.

var struct1 = SimpleStruct()
var struct2 = struct1
var struct3 = struct1

struct2.count = 2
struct3.count = 3

print(struct1.count) // 0
print(struct2.count) // 2 <- 구조체는 값 타입이므로 항상 새로운 메모리가 할당된다.
print(struct3.count) // 3

// ARC
print("ARC\n")
var classARC1: SimpleClass? = SimpleClass()
print(CFGetRetainCount(classARC1)) // 2가 기본 값

var classARC2 = classARC1
print(CFGetRetainCount(classARC1)) // 참조 카운트가 1 증가한 3이 됩니다.

classARC1 = nil
print(CFGetRetainCount(classARC2)) // 참조 카운트가 1감소하여 2가 됩니다.
classARC2 = nil // 참조 카운트가 1 감소하여 더 이상 참조하는 곳이 없으모르 deinit이 실행됩니다.


// ratain cycle
print("reatin cycle\n")
class StrongRefClassA {
    weak var classB: StrongRefClassB?
    deinit {
        print("ClassA 할당 해제")
    }
}

class StrongRefClassB {
    weak var classA: StrongRefClassA?
    deinit {
        print("ClassB 할당 해제")
    }
}

var classA: StrongRefClassA? = StrongRefClassA()
var classB: StrongRefClassB? = StrongRefClassB()

print(CFGetRetainCount(classA)) // reference count = 2(기본값)
print(CFGetRetainCount(classB)) // reference count = 2(기본값)

classA?.classB = classB
classB?.classA = classA

print(CFGetRetainCount(classA)) // reference count = 2(기본값)
print(CFGetRetainCount(classB)) // reference count = 2(기본값) -> 약한 참조를 사용했기 때문에 참조카운트 증가하지 않음

classA = nil
classB = nil // <- 더 이상 classA, classB의 데이터에 접근 할 수 없지만 deinit 실행되지 않았음 -> 메모리 누수 발생


