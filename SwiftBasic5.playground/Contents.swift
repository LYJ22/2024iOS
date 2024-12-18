import UIKit

// MARK: - 열거형(enum)
enum MainDish{
    case pasta(taste: String)
    case pizza(dough: String, topping: String)
    case chicken(withSauce: Bool)
    case rice
}

// 원시값 RawValue
enum MainDish2: String{
    case pasta = "pasta"
}

var mainDish = MainDish2.pasta
var mainDish2 = MainDish2.pasta
print("mainDish: \(mainDish.rawValue)")
print("mainDish2: \(mainDish2.rawValue)")


//연관값
var pasta = MainDish.pasta(taste: "크림")
var pasta2 = MainDish.pasta(taste: "토마토")
print("pasta: \(pasta)")
print("pasta2: \(pasta2)")


//열거형을 사용하는 이유: 우리만의 데이터 타입을 만들기 위해
struct Animal{
    var name: String
//    var isMammel: Bool  // true
//    var isReptile: Bool // true를 사용할 수도.. 열거형을 사용한다.
//    var isBird: Bool
    var animalType: AnimalType2
    
    
    init(name: String, animalType: AnimalType2) {
        self.name = name
//        self.isMammel = isMammel
        self.animalType = animalType
        
    }

}

enum AnimalType {
    case mammel
    case reptile
    case bird
}

//연관값을 가지는 열거형
enum AnimalType2 {
    case mammel(shortFur: Bool)
    case reptile
    case bird
}

let lion = Animal(name: "사자", animalType: .mammel(shortFur: true))
let bear = Animal(name: "곰", animalType: .mammel(shortFur: false))
print("사자: \(lion)")
print("곰: \(bear)")
print("lion.animalType: \(lion.animalType)")
print("bear.animalType: \(bear.animalType)")

switch lion.animalType {
case .mammel(let shortFur):
    print("\(lion.name)은(는) 포유류이고 털이 \(shortFur ? "짧습니다." : "깁니다.")")
case .reptile:
    print("\(lion.name)은(는) 파충류입니다.")
case .bird:
    print("\(lion.name)은(는) 조류입니다.")
}

// MARK: - 오류처리(Error handling)
// guard의 기본 문법. if와 비슷하지만 조건이 참일 때 수행부는 없고 else일 때만 있음
//guard 조건 else{
//    return / throw / break / continue
//}

// Error 프로토콜과 주로 열거형을 통해 오류를 표현
//enum 오류종류 이름: Error {
//case 종류1:
//ase 종류2:
//case 종류3:
//}

//자판기 동작 오류의 종류를 표현한 vendingmachine 열거형
enum VendingMachineError: Error{
    case invalidInput
    case insufficientFunds(moneyNeeded: Int)
    case outOfStock
}

class VendingMachine{
    let itemePrice = 100
    var itemCount = 5
    var deposited = 0
    
    func receiveMoney(_ money: Int) throws {
        guard money>0 else{
            throw VendingMachineError.invalidInput
        }
        deposited += money
        print("\(money)원 받음")
    }
    
    func vend(numberOfItems numbersOfItemsToVend: Int) throws -> String{
        guard numbersOfItemsToVend > 0 else{
            throw VendingMachineError.invalidInput
        }
        guard numbersOfItemsToVend * itemePrice <= deposited else{
            let moneyNeeded = numbersOfItemsToVend * itemePrice - deposited
            throw VendingMachineError.insufficientFunds(moneyNeeded: moneyNeeded)
        }
        guard itemCount >= numbersOfItemsToVend else {
            throw VendingMachineError.outOfStock
        }
        let totalPrice = numbersOfItemsToVend * itemePrice
        deposited -= totalPrice
        itemCount -= numbersOfItemsToVend
        return "\(numbersOfItemsToVend)개 제공함"
    }
}

let machine = VendingMachine()
var result: String?
do{
    try machine.receiveMoney(0)
}catch VendingMachineError.invalidInput{
    print("입력이 잘못되었습니다.")
}catch VendingMachineError.insufficientFunds(let moneyNeeded){
    print("\(moneyNeeded)원이 부족합니다.")
}catch VendingMachineError.outOfStock{
    print("수량이 부족합니다.")
}


do{
    try machine.receiveMoney(300)
}catch /*let error*/{
    switch error {
    case VendingMachineError.invalidInput:
        print("입력이 잘못되었습니다.")
    case VendingMachineError.insufficientFunds(let moneyNeeded):
        print("\(moneyNeeded)원이 부족합니다.")
    case VendingMachineError.outOfStock:
        print("수량이 부족합니다.")
    default:
        print("알 수 없는 오류 \(error)")
    }
}

// 딱히 케이스별로 오류를 처리할 필요가 없으면 catch 구문 내부를 간략화해도 무방하다
do{
    try machine.receiveMoney(10000)
} catch {
    print(error)
}

// 에러가 캐치될 때 원시값이 변수명이 출력된다 생각해도 무방
do{
    result = try machine.vend(numberOfItems: 2)
} catch {
    print(error)
}
print(result)


// try? 와 try!
// 별도의 오류처리 결과를 통보받지 않고 오류가 발행했으면 결과값을 nil로 돌려받을 수 있다. 정상동작 후에는 옵셔널 타입으로 정상 반환값을 돌려받는다.
result = try? machine.vend(numberOfItems: 1)
print("result: \(result)")
// 런타임 에러 발생.
//result = try! machine.vend(numberOfItems: 200)
//print("result: \(result)")


// try? 옵셔널 반환
try machine.receiveMoney(1000)
if let result = try? machine.vend(numberOfItems: 2){
    print("result: \(result)")
}else{
    print("정상적인 동작이 아닙니다.")
}

// MARK: - 접근 제어
/* 위일수록 개방적. 아래일수록 제한적
 open
 public
 internal
 filePrivate
 private
 */

// open - 다른 모듈에서도 상속과 재정의가 가능하다
open class OpenClass{
    open func openMethod(){
        print("This is an open method")
    }
}

// public - 외부 모듈에서 접근 가능하지만 상속, 재정의 불가
// 일반적으로 api 공개할 때 사용
public class PublicClass{
    public func publicMethod(){
        print("This is an public method")
    }
}

// internal(기본 수준) - 동일 모듈 내에서만 접근 가능
internal class InternalClass{
    internal func InternalMethod() {
        print("This is an internal method")
    }
}

// filePrivate - 같은 파일 내에서 접근 가능.
fileprivate class FilePrivateClass{
    fileprivate func doSomething() {
        print("This is an filePrivate ")
    }
}

// private - 동일한 선언 블록 안에서만 접근 가능. 가장 제한적
private class PrivateClass {
    private var secret = "Top Secret"
    
}


// 접근 제어 규칙
// Higher Level 제한: 특정 코드가 더 제한적인 접근 수준을 가진 코드(예: private)보다 높은 접근 수준을 가질 수 없습니다
public class PublicClass1 {
    private var privateProperty = "Secret" // 가능
    
    // 읽기와 쓰기 따로 접근제어자 지정 할 수 있다.
    public private(set) var second = "Second"
}

private class PrivateClass1 {
    public var publicProperty = "Exposed" // 오류 발생
}

print("--------------------------")

// MARK: - 옵셔널 체이닝
class Person{
    var name: String
    var job: String?
    var home: Apartment?
    
    init(name: String) {
        self.name = name
    }
}

class Apartment {
    var buildingNumber: String
    var roomNumber: String
    var `guard`: Person?
    var owner: Person?
    
    init(dong: String, ho: String){
        buildingNumber = dong
        roomNumber = ho
    }
}

let david: Person? = Person(name: "david")
let apart: Apartment? = Apartment(dong: "101", ho: "202")
let superman: Person? = Person(name: "superman")

// 옵셔널 체이닝을 사용하지 않는 경우
func guardJob(owner: Person?){
    if let owner = owner{
        if let home = owner.home{
            if let `guard` = home.guard{
                if let guardJob = `guard`.job{
                    print("우리집 경비원의 직업은 \(guardJob)입니다.")
                }else{
                    print("우리집 경비원은 직업이 없어요.")
                }
            }
            else{
                
            }
        }
        else{
            print("\(owner.name)은 집이 없어요.")
        }
    }
}
guardJob(owner: david)

func guardJobWithOptionalChaining(owner: Person?){
    if let guardJob = owner?.home?.guard?.job{
        print("우리집 경비원의 직업은 \(guardJob)입니다.")
    }else{
        print("우리집 경비원은 직업이 없어요.")
    }
}

david?.home = apart
david?.home?.guard = superman
david?.home?.guard?.job = "경비원"

guardJobWithOptionalChaining(owner: david)


var person: Person? = Person(name: "kevin")
print("person?.name: \(person?.name)" )


var guardJob2: String?
guardJob2 = david?.home?.guard?.job ?? "수퍼맨"
print("guardJob2: \(guardJob2)")

