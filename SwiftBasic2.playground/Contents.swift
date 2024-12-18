import UIKit

var greeting = "Hello, playground"


// MARK: - 타입 별칭
typealias MyInt = Int
typealias YourInt = Int
var myInt: MyInt = 10
var yourInt: YourInt = 20
print("myInt: \(myInt)")
print("yourInt: \(yourInt)")
let justInt: Int = myInt
print("justInt: \(justInt)")

// MARK: - 연산자
// 단항 연산자 !A
// 이항 연산자 A + B
// 삼항 연산자 A ? B : C
// 전위 연산자 ++A
// 후위 연산자 A++
// 중위 연산자 A + B

// 할당 연산자
var a = 10
// 산술 연산자 +, -, *, /, %
var a1 = 10 + 20

// 비교 연산자 ==, >=, <=, >, <, !=
var b1 = a == a1

// 삼항 조건 연산자
var c = (a == a1) ? "같음" : "다름"

// 범위 연산자
var d = 1...10 // 1부터 10까지 : 폐쇄 연산자(ClosedRange)
print("d: \(d)")
var d1 = 1..<10 // 반폐쇄 연산자
print("d1: \(d1)")
var d2 = 1...
print("d2: \(d2)")
var d3 = ...10
print("d3: \(d3)")

// 논리 연산자
var e1 = true
!e1
var e2 = false
var e3 = e1 && e2
var e4 = e1 || e2

// 복합 할당 연산자
var f1 = 10
var f2: Int = 0
f2 += 10
f2 -= 10
f2 *= 10
f2 /= 10

// MARK: - 흐름 제어 : 조건문, 반복문
// 조건문: if, switch, guard(옵셔널에서 학습)
let first: Int = 5
let second: Int = 7
if first > second {
    print("first > second")
}else if first < second{
    print("first < second")
}else{
    print("first == second")
}

// switch 문
let integerValue = 5
switch integerValue {
case 0:
    print("Value == zero")
case 1...10:
    print("Value == 1~10")
    fallthrough
case Int.min..<0, 101..<Int.max:
    print("Value < 0 or Value > 100")
    break
default:
    print("10 < Value <= 100")
}

for i in 0...2{
    print("i: \(i)")
}

for i in 0...5{
    if i.isMultiple(of: 2){
        print(i)
        continue
    }
    print("\(i)는 홀수입니다.")
}


for _ in 0...5{
    print("출력만 할래")
}


let friends: [String: Int] = ["Jay" : 35, "June" : 30, "Johnny" : 32]
for tuple in friends{
    print(tuple)
}

for (name, age) in friends{
    print("name: \(name), age: \(age)")
}

// while문
var names: [String] = ["Calvin", "July"]
while names.isEmpty == false{
    print("Goodbye \(names.removeFirst())")
}
print("-------------------------")

// repeat - while: 다른 언어에서의 do-while과 같다
var names2: [String] = ["Calvin", "July", "May", "Junho"]
repeat{
    print("Goodbye \(names2.removeFirst())")
}while names2.isEmpty == false


// 구문 이름표
// 중첩 for문이 있을 때 원하는 for문으로 빠져나갈 때 사용할 수 있다.
var numbers: [Int] = [3, 2342, 6, 4352]
numbersLoop: for num in numbers{
    if num > 5 || num < 1 {
        continue numbersLoop
    }
}


// MARK: - 함수 기본
func sum(a: Int, b: Int) -> Int {
    return a + b
}

// 반환값 없는 경우
func sum2(a: Int, b: Int) -> Void {
    print(a+b)
}
// void 생략 가능
func sum3(a: Int, b: Int){
    print(a+b)
}

// 매개변수 없는 경우
func sum4() -> Int{
    return 4
}

// 매개변수 & 반환값 없는 경우
func sum5(){
    print(2+3)
}

// 함수 구현이 짧은 경우 한줄 작성 가능
func hello() -> Void { print("Hello!") }

// 함수 호출
sum(a: 3, b: 6)

// 매개변수의 기본값을 설정할 수 있다
func hi(a: String, b: String = "Hi"){
    print("\(a) \(b)")
}
hi(a: "AAA")
hi(a: "bbb", b: "ccc")

// 전달인자 레이블 설정
func greeting(to friend: String, from me: String){
    print("Hello \(friend)! I'm \(me)")
}
greeting(to: "친구", from: "나")

// 가변 매개변수(함수 하나에 하나만 사용가능)
func sayHelloToFriends(me: String, friends: String...) -> String{
    return "Hello \(friends)! I'm \(me)"
}
print(sayHelloToFriends(me: "mmm", friends: "hana", "eric", "wing"))
print(sayHelloToFriends(me: "mmm"))


// 데이터 타입으로서의 함수
var someFunction: (String, String) -> Void = greeting(to:from:)
someFunction("eric", "gom")

func runAnother(function: (String, String) -> Void){
    function("jenny", "mike")
}
runAnother(function: someFunction)



// MARK: - 함수 고급
func sum10(_ a: Int, second b: Int) -> Int{
    return a + b
}
func sum11(_ a: Int, _ b: Int) -> Int{
    return a + b
}
sum10(3, second: 10)
sum11(5, 4)



// MARK: - 옵셔널
// ?를 붙이면 int와 nil이 담기는 박스가 2개 있는 느낌
// !는 강제 언랩핑
var aa: Int? = 10
var bb: Int? = nil
var cc: Int = aa!    //에러 발생하지 않음
//var dd: Int = bb!    //런타임 에러 발생

// 암시적 추출
var ee: Int! = 10
var ff: Int! = nil

print("ee: \(ee)")
//print("ff: \(ff)")    //null pointer exception 발생

// 옵셔널 언래핑: if - let, guard - let
// null이 아니면 함수 수행. null인 경우 if문 탈출
// aa1 구문 밖에서 사용 불가
if let aa1 = aa {
    print("aa1: \(aa1)")
}else{
    print("aa는 nil이네요")
}

// guard - let은 반드시 함수 안에서 사용해야 한다
// aa1 구문 밖에서 사용 가능
func guardLetTest(){
    var aa: Int? = 10
    // 옵셔널 값이 nil이 아닌 경우 aa1에 aa 할당
    guard let aa1 = aa else{
        print("aa1 == nil")
        return
    }
    print("aa1: \(aa1)")
}

// 옵셔널 체이닝
var testClass1: TestClass? = TestClass()
var testClass2: TestClass? = nil
print("testClass1?.a1: \(testClass1?.a1)")
testClass1?.method()
print("testClass2?.a1: \(testClass2?.a1)")
testClass2?.method()

class TestClass{
    var a1 = 10
    func method(){
        print("method입니다.")
    }
}

