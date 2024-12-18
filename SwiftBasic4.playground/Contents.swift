import UIKit

// MARK: - Closure
// - 코틀린 또는 다른 언어의 람다와 비슷
// - 일정 기능을 하는 코드를 모아놓은 것
// - 함수는 클로저의 한 형태. 클로저는 이름 없는 함수

// 기본 클로저 문법
/*{ (매개변수 목록) -> 반환타입 in
    실행 코드
}*/


// 실제 클로저 형태
/*{ (a: Int, b: Int) -> Int in
    return a+b
}*/

func function(a: Int, b: Int) -> Int {
    var c = 0
    var d = 1
    return a + b
}

// 변수에 대입 가능.
let sum = { (a: Int, b: Int) -> Int in
    return a+b
}

// 클로저 호출
let result = sum(4,5)
let result2 = function(a: 5, b: 7)
//print("result: \(result)")
print("result2: \(result2)")


let sum2: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in
    return a+b
}


// 전달 인자로서의 클로저
// - 클로저는 주로 함수의 전달인자로 사용한다.
let add: (Int, Int) -> Int
add = { (a: Int, b: Int) -> Int in
        return a + b
}

let subtract: (Int, Int) -> Int
subtract = { (a: Int, b: Int) -> Int in
        return a - b
}

let divide: (Int, Int) -> Int
divide = { (a: Int, b: Int) -> Int in
        return a / b
}


func calculate(a: Int, b: Int, method: (Int, Int) -> Int) -> Int {
    return method(a,b)
}
var calculated: Int
calculated = calculate(a: 50, b: 10, method: divide)
print("calculated: \(calculated)")
calculated = calculate(a: 50, b: 10, method: add)
print("calculated: \(calculated)")
calculated = calculate(a: 50, b: 10, method: subtract)
print("calculated: \(calculated)")


// 따로 클로저를 상수/변수에 넣어 전달하지 않고, 함수를 호출할 때 클로저 작성하여 전달
calculated = calculate(a: 50, b: 10, method: {(left: Int, right: Int) -> Int in
    return left * right
})
print("calculated: \(calculated)")


// 전달인자로 전달된 클로저의 축약. 기본적인 형태
func calculate2(a: Int, b: Int, method: (Int, Int) -> Int) -> Int {
    return method(a,b)
}
var result3: Int

result3 = calculate2(a: 10, b: 10){ (left: Int, right: Int) -> Int in
    return left + right
}

// 반환 타입 생략
// calculate2의 매개변수는 Int 타입을 반환할 것이라는 사실을 컴파일러도 알기 때문.
// 대신 "in" 키워드는 생략할 수 없다.
result3 = calculate2(a: 10, b: 10){ (left: Int, right: Int) in
    return left + right
}

// 후행 클로저 아닌 원래 형태에서도 Int 타입 생략 가능
result3 = calculate2(a: 10, b: 10, method: { (left: Int, right: Int) in
    return left + right
})


// 단축 인자 이름
// 클로저 매개변수 이름 불필요시, 단축 인자이름 활용 가능
// 클로저 매개변수 순서대로 $0, $1, $2 ... 처럼 표현한다
result3 = calculate(a: 10, b: 10, method: {
    return $0 + $1
})
// 후행 클로저에서도 가능
result3 = calculate(a: 10, b: 10){
    return $0 + $1
}

// 암시적 반환 표현
// 클로저가 반환하는 값이 있다면 마지막 줄의 결과값은 암시적으로 반환값으로 취급한다
result3 = calculate(a: 10, b: 10){
    $0 + $1
}

// 결론
// 축약 전
result3 = calculate(a: 10, b: 10, method: {(left: Int, right: Int) in
    return left + right
})
// 축약 후
result3 = calculate(a: 10, b: 10){ $0 + $1 }



// MARK: - 고차함수
// - 고차함수는 '다른 함수를 전달인자로 받거나 함수실행의 결과를 함수로 반환하는 함수'
// - 스위프트 표준 라이브러리에서 제공하는 유용한 고차함수들에 대해 알아본다.
// - 주로 컬렉션(컨테이너) 관련 (Array, Set, Dictionary 등)
// - map, filter, reduce 등이 있다.

// map
// - map 함수는 컬렉션 내부의 기존 데이터를 변형하여 새로운 컬렉션을 생성
let numbers: [Int] = [0, 1, 2, 3, 4]
var doubledNumbers: [Int]
var strings: [String]

doubledNumbers = [Int]()
strings = [String]()
for number in numbers {
    doubledNumbers.append(number * 2)
    strings.append("\(number)")
}
print(doubledNumbers)
print(strings)


doubledNumbers = numbers.map({(number: Int) -> Int in return number * 2})
doubledNumbers = numbers.map{$0 * 2}


// filter
// 컬렉션 내부 값을 걸러서 새로운 컬렉션을 추출
var filtered: [Int] = [Int]()
for number in numbers {
    if number % 2 == 0 {
        filtered.append(number)
    }
}
print(filtered) // [0, 2, 4]

// numbers의 요소 중 짝수를 걸러내어 새로운 배열로 반환
let evenNumbers: [Int] = numbers.filter { (number: Int) -> Bool in
    return number % 2 == 0
}
print(evenNumbers) // [0, 2, 4]

let oddNumbers: [Int] = numbers.filter{$0 % 2 != 0}
print(oddNumbers)

// reduce
let someNumbers: [Int] = [2, 8, 15]
// 변수 사용에 주목하세요
var result4: Int = 0
// someNumbers의 모든 요소를 더합니다
for number in someNumbers {
    result4 += number
}
print(result4) // 25

let sum1: Int = someNumbers.reduce(0, { (first: Int, second: Int) -> Int in
    return first + second
})
print("sum1: \(sum1)")

// 초깃값이 0이고 someNumbers 내부의 모든 값을 뺍니다.
var subtract1: Int = someNumbers.reduce(0, { (first: Int, second: Int) -> Int in
    return first - second
})

let sumFromThree = someNumbers.reduce(3) { $0 + $1 }


let someStrings: [String] = ["a", "b", "c"]
let sum3: String = someStrings.reduce("z", { (first: String, second: String) -> String in
    print("\(first) + \(second)") //어떻게 동작하는지 확인해보세요
    return first + second
})
print("sum3: \(sum3)")
