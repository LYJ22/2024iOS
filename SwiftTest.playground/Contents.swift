import UIKit

// MARK: - 기본 문법
// 변수 상수 - 변수(var): 변경 가능, 상수(let): 변경 불가
var  variable = 10
let constant = 20

variable = 30
//constant = 40

//선언 이후에 초기화 할 수 있다.
var  variable2: Int
let constant2: Int
variable2 = 200
constant2 = 300
//constant2 = 400   //상수 초기화는 1번만

var  variable3: Int
let constant3: Int
//print(variable3)  //초기화 하기 전 변수(상수) 사용 불가

class TestClass{
    //var variable4: Int = 0  //선언과 동시에 초기화
    var variable4: Int
    let constant4: Int
    
    init(variable4: Int, constant4: Int) {
        self.variable4 = variable4
        self.constant4 = constant4
    }
}


// 데이터 타입
// - 주요 데이터 타입: Int, Double, Float, String, Bool, Character

// 타입 추론
var variable5 = 10
let constant5 = "hi"


// MARK: - 옵셔널
// 값이 있을수도, 없을수도 있는 상태 표현
// 옵셔널 선언: ?
var name: String? = "John"
name = nil
print("name: \(name)")
var name2: String! = "John"
print("name2: \(name2)")

// 옵셔널 바인딩
// 옵셔널 변수를 안전하게 추출
if let unwrappedName = name {
    print("unwrappedName: \(unwrappedName)")
}else{
    print("이름이 없습니다.")
}

// 옵셔널 체이닝
// 중첩된 옵셔널에 접근
let length = name2?.count // 옵셔널 반환
print("length: \(length)")  //"Optional(6)"


// MARK: - 조건문
let age = 20
if age > 19{
    print("어른입니다.")
}else{
    print("어른이 아닙니다.")
}

// 스위치문

// MARK: - 반복문
// for-in 문
let numbers = [1,2,3,4,5,6]
for number in numbers {
    print("number: \(number)")
}

// while 문
var count = 3
while count > 0 {
    print("count: \(count)")
    count -= 1
}


// MARK: - 함수
// 함수 정의 및 호출
func greet(name: String) -> String{
    return "Hello, \(name)!"
}
print(greet(name: "Swift"))

// 기본값 있는 매개변수
func greet2(name: String = "Guset"){
    print("Hello, \(name)!")
}
greet2()

// 가변 매개변수
func sum(numbers: Int...) -> Int{
    return numbers.reduce(0, +)
}
print(sum(numbers: 1,2,3))

func subtract(from a: Int, to b: Int) -> Int{
    return a-b
}
print(subtract(from: 10, to: 5))

// 전달인자 레이블
func subtract(_ a: Int, _ b: Int) -> Int{
    return a-b
}
print(subtract(10, 5))


// MARK: - 함수형 프로그래밍
// 클로저 - 코드 블록을 변수(값)처럼 사용 가능
let multiply = { (a: Int, b: Int) -> Int in
    return a * b
}
print("multiply: \(multiply(2,3))")

// 후행 클로저
func calculate(a: Int, b: Int, method: (Int, Int) -> Int){
    let result = method(a, b)
    print("결과: \(result)")
}

let add:(Int, Int) -> Int
add = { (a: Int, b: Int) in
    return a + b
}
calculate(a: 10, b: 5, method: multiply)
calculate(a: 10, b: 20, method: add)
calculate(a: 10, b: 20, method: {(left: Int, right: Int) -> Int in
    return left + right
})
calculate(a: 10, b: 20){$0 + $1}


// 컬랙션
// 배열
var numbers2: [Int] = [1,2,3]
numbers2.append(4)

// 딕셔너리
var user: [String: String] = ["name": "John", "age": "25"]
print(user["name"] ?? "Unknown")

var fruits: Set = ["Apple", "Banana", "Grape"]
fruits.insert("Orange")

// map, filter, reduce
let number3 = [1,2,3,4,5]

let doubled = number3.map {$0 * 2}
let evens = number3.filter{$0 % 2 == 0}
let sum = number3.reduce(0, +)


// 구조체 - 값 타입
struct Person {
    var name: String
    var age: Int
}
let tom = Person(name: "Tom", age: 30)

// 클래스 - 참조 타입
class Car{
    var brand: String = ""
    func drive(){
        print("Driving \(brand)")
    }
}
let car = Car()
car.brand = "Tesla"
car.drive()


// MARK: - 프로토콜
// 특정 공동 기능이나 동작을 정의. 공통의 기능이나 속성을 강제하는 역할
protocol Animal{
    var name: String {get}
    func makeSound()
}

struct Dog: Animal{
    var name: String
    
    func makeSound() {
        print("멍멍!")
    }
}

struct Cat: Animal{
    var name: String
    
    func makeSound() {
        print("야옹!")
    }
}


// MARK: - 열거형 enum
enum Direction{
    case north, south, east, west
}
let move = Direction.north

enum Result{
    case success(data: String)
    case failure(error: String)
}
let result = Result.success(data: "OK")

switch result{
case .success(let data):
    print(data)
case .failure(let error):
    print(error)
default: break
}

// MARK: - 에러 처리
// do - catch문
enum VendingError: Error{
    case outofstock
}

func vend(item: String) throws{
    throw VendingError.outofstock
}

do{
    try vend(item: "Chips")
}catch{
    print("Error occurred: \(error)")
}
