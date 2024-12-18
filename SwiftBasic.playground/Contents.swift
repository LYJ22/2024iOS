import UIKit

var greeting = "Hello, playground"
print(greeting)

UIImage(systemName: "star")

var sum = 0
for i in 1...10{
    sum += i
}

//MARK : - 주석
// 한 줄 주석
/*
 여러 줄 주석
 여러 줄 주석
 */

// 요즘 언어들은 마지막에 세미콜론을 작성하지 않는다. 스위프트도 사용하지 않아도 됨.
var greeting2 = "Hello"; print(greeting2);

// 출력하기
print(greeting)
dump(greeting)

var number = 10
print(number)
dump(number)    // 덤프형은 변수가 int인지 string인지 알 수 있게 출력해준다.

// MARK : - 이름 짓기 규칙
// lower camel case
// 함수, 메소드, 변수, 상수 등의 이름(ex. someFunction())

// upper camel case
// 타입(Int, String, Bool, Interpolation (ex. SomeClass(){} )

// 문자열 보간법
let a1 = "안녕하세요." + greeting + "반갑습니다."
let a2 = "안녕하세요. \(greeting)"
let a3 = "안녕하세요. \(100)"
print(a1)
print(a2)
print(a3)

// MARK : - 변수와 상수
// 변수는 "var" 상수는 "let" 키워드로 선언한다.
// let 이름: 타입 = 값
// var 이름: 타입 = 값

let constant: String = "차후에 변경이 불가능"
var variable: String = "차후에 변경이 가능"

variable = "새로운 값 할당"
// constant = "새로운 값 할당 불가"

var b2: String
let b3: String

b2 = "값 할당을 선언 이후에 해도 됨"
b3 = "값 할당을 선언 이후에 해도 됨"
b2 = "값 수정 가능"
// b3 = "값 수정 안됨"

// MARK : - 기본 데이터 타입
var c1: Bool = true
c1 = false
// c1 = 0   // true, false 이외의 값을 할당하면 에러
// c1 = 1
// c1 = FALSE   //에러

// Int: 정수 값만을 가질 수 있는 타입
var d1 = 100    // 할당되는 값이 확실하면 타입 생략 가능
d1 = -100
// UInt: 양의 정수 값만을 가질 수 있는 타입
var d2: UInt = 100
// d2 = -100    // 컴파일 에러: 양의 정수만 할당 가능

// 다른 타입 변수에는 값 할당X
d1 = Int(d2)
d2 = UInt(d1)

// 타입 확인하기
print("d1's type: \(type(of: d1))")


// float : 32비트 부동소수 타입
// double : 64비트 부동소수 타입
var e1: Float = 10.11
var e2: Double = 10.11
// e1 = e2 // 컴파일 오류
var e3 = 10.11 // 기본적으로 double 타입이 된다.

// 정수 랜덤값 가져오기
var e4 = Int.random(in: -100...100)
print("e4 : \(e4)")

// 양의 정수 랜덤값 가져오기
var e5 = UInt.random(in: 0...100)
print("e5 : \(e5)")

// 실수 랜덤값 가져오기
var e6 = Double.random(in: 1.5...100.3)
print("e6 : \(e6)")
var e7 = Float.random(in: 1.5...100.3)
print("e7 : \(e7)")


// 문자 Character
// 쌍따옴표 안에 문자 넣는다. (코틀린과 비교: 코트린은 작은 따옴표 안에)
var f1: Character = "a" // 유니코드 값이 들어가기 때문에 이모지도 가능

// 문자열 String
var g1: String = "abcd"
// 빈 문자열
let g2: String = ""
let g3: String = String()
g1.append("efg")
g1 = g1+"hij"
g1 += "klm"
print("g1 : \(g1)")
print("g1 count : \(g1.count)")
print("g1 is Empty : \(g1.isEmpty)")

let g4 = "abc"
let g5 = "abcd"
print("g4 == g5: \(g4 == g5)")

// 접두어, 접미어 확인
g4.hasPrefix("ab")
g4.hasSuffix("cd")
print("g4 has prefix: \(g4.hasPrefix("ab"))")
print("g4 has suffix: \(g4.hasSuffix("cd"))")

// 대소문자 변환
print("g4 upper case : \(g4.uppercased())")
print("g4 lower case : \(g4.lowercased())")

// RawString : 큰따옴표 세개로 있는 그대로 문자열 값을 할당할 수 있다. 반드시 """ 아래줄부터 작성
var g6 = """
안녕하세요.
    반갑습니다.
"""
print("g6: \(g6)")

// MARK : - Any, AnyObject, nil
var someAny: Any = 100
someAny = "어떤 타입의 값도 할당 가능"
// var someString: String = someAny // Any도 마찬가지로 타입이 다르기 때문에 다른 타입 변수에 할당 불가

//class SomeClass2 {}
//var someAnyObject: AnyObject = SomeClass2()
// someAnyObject = 10 // 클래스의 객체(인스턴스)만 할당 가능

// nil: 아무것도 없는 것(null)
// someAny = nil    //컴파일 에러
// someAnyObject = nil    //컴파일 에러

var someAny2: Any? = 200
someAny2 = nil

// MARK - 튜플
var someData: (String, Int, Double, String) = ("abc", 10, 10.11, "efg")    // 엄밀히 말하면 컬렉션은 아니다.
print("someData 0 : \(someData.0)")
print("someData 1 : \(someData.1)")
print("someData 2 : \(someData.2)")
print("someData 3 : \(someData.3)")

// MARK - 컬렉션: Array, Dictionary, Set
// Array: 순서가 있는 리스트 컬렉션
// Dictionary: "키"와 "값"의 쌍으로 이루어진 컬렉션
// Set: 순서가 없고, 멤버가 유일한 컬렉션

// 빈 array
var integers: Array<Int> = Array<Int>()
// var integers: Array<Int> = [Int]()
// var integers: Array<Int> = []
// var integers: [Int] = Array<Int>
// var integers: [Int] = [Int]()
// var integers: [Int] = []
// var integers = [Int]()
// 위처럼 다양한 표현 방식이 있다.

integers.append(1)
integers.append(2)
print("integers: \(integers)")


print("integers contains 1: \(integers.contains(1))")
print("integers contains 3: \(integers.contains(3))")

integers[0] = 10
print("integers: \(integers)")

integers.remove(at: 0)
print("integers: \(integers)")

var integers2 = [0,1,2,3]
print("integers2: \(integers2)")

integers2.removeFirst()
integers2.removeLast()
print("integers2: \(integers2)")
integers2.removeAll()

let integers3 = [0,1,2,3]
// integers3.append(4)
// integers3.remove(at: 0)
// integers3[0] = 10


var anyDictionary: Dictionary<String, Any> = [String: Any]()
//var anyDictionary: Dictionary<String, Any> = Dictionary<String, Any>()
//var anyDictionary: Dictionary<String, Any> = [:]
//var anyDictionary: [String: Any] = Dictionary<String, Any>()
//var anyDictionary: [String: Any] = [String: Any]()
//var anyDictionary: [String: Any] = [:]
//var anyDictionary = [String: Any]

anyDictionary["someKey"] = "value"
print("anyDictionary: \(anyDictionary)")
anyDictionary["someKey"] = 3
print("anyDictionary: \(anyDictionary)")
anyDictionary["anotherKey"] = 30.33
print("anyDictionary: \(anyDictionary)")

anyDictionary.removeValue(forKey: "someKey")
print("anyDictionary: \(anyDictionary)")
anyDictionary["anotherKey"] = nil
print("anyDictionary: \(anyDictionary)")

let otherDictionary: [String: Any] = [:]
// otherDictionary["someKey"] = 100

anyDictionary["thirdKey"] = "String"
print("anyDictionary: \(anyDictionary)")


var integerSet: Set<Int> = Set<Int>()
integerSet.insert(1)
integerSet.insert(100)
print(integerSet)

let setA: Set<Int> = [1,2,3,4,5]
let setB: Set<Int> = [3,4,5,6,7]

// 합집합
let union: Set<Int> = setA.union(setB)
print(union)

let sortedUnion: [Int] = union.sorted(by: >)
print(sortedUnion)
let sortedDescending: [Int] = union.sorted()
print(sortedDescending)

let intersection: Set<Int> = setA.intersection(setB)
print(intersection)

let subtracting: Set<Int> = setA.subtracting(setB)
print(subtracting)
