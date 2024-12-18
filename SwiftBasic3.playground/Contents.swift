import UIKit

// MARK: - enum

// boolean처럼 열거형은 커스텀하게 개발자가 변수를 만들어준다고 생각.
var boolean: Bool
boolean = true
boolean = false

enum Weekday {
    case mon
    case tue
    case wed
    case thu
    case fri, sat, sun
}

// 위와 문법적으로 동일하다
enum Weekday2{
    case mon, tue, wed, thu, fri, sat, sun
}

var weekday: Weekday = Weekday.thu
weekday = .fri

// switch와 사용하는 경우 많음
switch weekday{
case .mon, .tue, .wed, .thu:
    print("평일입니다.")
case .fri, .sat, .sun:
    print("주말입니다.")
}

// 열거형의 원시값(rawValue) 지정
enum Fruit: Int{
    case apple = 0
    case orange = 1
    case grape
}

print("Fruit.apple.rawValue : \(Fruit.apple.rawValue)")
print("Fruit.apple.rawValue : \(Fruit.orange.rawValue)")
print("Fruit.apple.rawValue : \(Fruit.grape.rawValue)")


enum School: String{
    case elem = "초등학교"
    case mid = "중학교"
    case high = "고등학교"
    case univ
}
print("School.elem.rawValue: \(School.elem.rawValue)")
print("School.univ.rawValue: \(School.univ.rawValue)")


// 서버와 통신할 때 이런 형식으로 많이 사용
enum School2: String{
    case elem
    case mid
    case high
    case univ
}
print("School.elem.rawValue: \(School.elem.rawValue)")


// 원시값을 통한 초기화
let apple: Fruit = Fruit.apple
let apple2: Fruit = .apple
let apple3: Fruit? = Fruit(rawValue: 0) // 원시값이 없을 수도 있기 때문에 옵셔널

if let orange: Fruit = Fruit(rawValue: 5){
    print("원시값 5에 해당하는 케이스는 \(orange)입니다.")
}else{
    print("원시값 5에 해당하는 케이스는 없습니다.")
}

// 열거형의 메서드
enum Month{
    case dec, jan, feb
    case mar, apr, may
    case jun, jul, aug
    case sep, oct, nov
    
    func printMessage(){
        switch self{
        case .dec, .jan, .feb:
            print("추운 겨울")
        case .mar, .apr, .may:
            print("따스한 봄")
        case .jun, .jul, .aug:
            print("더운 여름")
        case .sep, .oct, .nov:
            print("선선한 가을")
        }

    }
}
let mar = Month.mar
mar.printMessage()
Month.mar.printMessage()

print("---------------------------")

// MARK: - struct

struct Sample{
    var mutableProperty: Int = 100
    let immutableProperty: Int = 200
    static let typeProperty: Int = 300
    
    func instanceMethod(){
        print("instanceMethod")
    }
    static func typeMethod(){
        print("typeMethod")
    }
}

// 가변 인스턴스 설정
var mutable: Sample = Sample()
mutable.mutableProperty = 1000
//mutable.immutableProperty = 2000  // 수정 불가

// 불변 인스턴스 생성 : 구조체 불변 인스턴스는 프로퍼티 수정 불가
let immutable: Sample = Sample()
//immutable.mutableProperty = 1000
//immutable.immutableProperty 2000

// 타입 프로퍼티에 접근
print("Sample.typeProperty: \(Sample.typeProperty)")
//mutable.typeProperty // 에러


// 구조체 정리
// 1. 상속불가
// 2. 상속하지 않아도 되는 모델 설계할 때 사용
struct Student{
    var name: String = "unknown"
    var `class`: String = "Swift"
    
    static func selfIntroduce(){
        print("학생타입입니다.")
    }
    func selfIntroduce(){
        print("저는 \(`class`)반 \(name)입니다.")
    }
}

// 가변 인스턴스 생성
var mike = Student()
mike.name = "mike"
mike.class = "7"
mike.selfIntroduce()

// 불변 인스턴스 생성
let jina = Student()
//jina.name = "jina"
//jina.class = "8"
jina.selfIntroduce()

// 타입 메서드 사용
Student.selfIntroduce()


// MARK: - class

class Sample1 {
    var mutableProperty: Int = 100
    let immutableProperty: Int = 200
    static let typeProperty: Int = 300
    
    func instanceMethod(){
        print("instanceMethod")
    }
    //재정의 불가
    static func typeMethod(){
        print("typeMethod - static")
    }
    //재정의 가능
    class func classMethod(){
        print("typeMethod - class")
    }
}








class Student2{
    var name: String = "unknown"
    var `class`: String = "Swift"
    
    static func selfIntroduce(){
        print("학생타입입니다.")
    }
    func selfIntroduce(){
        print("저는 \(`class`)반 \(name)입니다.")
    }
}

Student2.selfIntroduce()

// 가변 인스턴스 생성
var gom = Student2()
mike.name = "gom"
mike.class = "7"
mike.selfIntroduce()

// 불변 인스턴스 생성
let hana = Student2()
//jina.name = "hana"
//jina.class = "8"
jina.selfIntroduce()

print("---------------------------")


// MARK: - 구조체와 클래스 비교
struct ValueType{
    var prop = 1
}
class ReferenceType{
    var prop = 1
}

let firstStructInstance = ValueType()
var secondStructInstance = firstStructInstance
secondStructInstance.prop = 2

// 두 구조체를 복사해서 사용하면 별도의 인스턴스이기 때문에 프로퍼티 값 영향 없음
print("firstStructInstance.prop : \(firstStructInstance.prop)")
print("secondStructInstance.prop : \(secondStructInstance.prop)")

let firstClassInstance = ReferenceType()
var secondClassInstance = firstClassInstance
secondClassInstance.prop = 2

// 참조값이기 때문에 영향을 받는다.
print("firstClassInstance.prop : \(firstClassInstance.prop)")
print("secondClassInstance.prop : \(secondClassInstance.prop)")


struct Student3 {
    
    // 인스턴스 저장 프로퍼티
    var name: String = ""
    var `class`: String = "Swift"
    var koreanAge: Int = 0
    
    // 인스턴스 연산 프로퍼티
    var westernAge: Int {
        get {
            return koreanAge - 1
        }
        
        set(inputValue) {
            koreanAge = inputValue + 1
        }
    }
    
    // 타입 저장 프로퍼티
//    static var typeDescription: String = "학생"
    
    /*
    // 인스턴스 메서드
    func selfIntroduce() {
        print("저는 \(self.class)반 \(name)입니다")
    }
     */
    
    // 읽기전용 인스턴스 연산 프로퍼티
    // 간단히 위의 selfIntroduce() 메서드를 대체할 수 있습니다
    var selfIntroduction: String {
        get {
            return "저는 \(self.class)반 \(name)입니다. 한국 나이: \(koreanAge), 외국 나이: \(westernAge),"
        }
    }
        
    /*
     // 타입 메서드
     static func selfIntroduce() {
     print("학생타입입니다")
     }
     */
    
    // 읽기전용 타입 연산 프로퍼티
    // 읽기전용에서는 get을 생략할 수 있습니다
    static var selfIntroduction: String {
        return "학생타입입니다"
    }
}

// 인스턴스 생성
var keon = Student3()
keon.name = "keon"
//keon.koreanAge = 30
keon.westernAge = 29
print(keon.selfIntroduction)


// 프로퍼티 감시자
struct Money {
    // 프로퍼티 감시자 사용
    var currencyRate: Double = 1100 {
        willSet(newRate) {
            print("환율이 \(currencyRate)에서 \(newRate)으로 변경될 예정입니다")
        }
        
        didSet(oldRate) {
            print("환율이 \(oldRate)에서 \(currencyRate)으로 변경되었습니다")
        }
    }

    // 프로퍼티 감시자 사용
    var dollar: Double = 0 {
        // willSet의 암시적 매개변수 이름 newValue
        willSet {
            print("\(dollar)달러에서 \(newValue)달러로 변경될 예정입니다")
        }
        
        // didSet의 암시적 매개변수 이름 oldValue
        didSet {
            print("\(oldValue)달러에서 \(dollar)달러로 변경되었습니다")
        }
    }

    // 연산 프로퍼티
    var won: Double {
        get {
            return dollar * currencyRate
        }
        set {
            dollar = newValue / currencyRate
        }
        
        /* 프로퍼티 감시자와 연산 프로퍼티 기능을 동시에 사용할 수 없습니다
        willSet {
            
        }
         */
    }
}

var moneyInMyPocket = Money()
moneyInMyPocket.currencyRate = 1150




// MARK: - 상속

class Person{
    var name: String = ""
    
    func selfIntroduce(){
        print("저는 \(name)입니다.")
    }
    
    //final 키워드를 사용하여 재정의를 방지할 수 있다.
    final func sayHello(){
        print("Hello")
    }
    
    // 타입 메서드 - 재정의 불가
    static func typeMethod(){
        print("Person - typeMethod")
    }
    
    class func classMethod(){
        print("Person - classMethod")
    }
    
    // final을 붙이면 static과 같아진다.
    final class func finalclassMethod(){
        print("Person - classMethod")
    }
}

class Student5: Person{
    var major: String = ""
    override func selfIntroduce() {
        print("저는 \(name)입니다. 전공은 \(major)입니다.")
    }
    
    // final 키워드가 붙은 멤버는 재정의할 수 없다.
    //override func sayHello() {
    //}
    
    // 부모 클래스에서 static이 붙어서 재정의 불가
    //override static func typeMethod(){
    //    print("Student - typeMethod")
    //}
    
    override class func classMethod(){
        print("Student - classMethod")
    }
    
    // 부모 클래스에서 final이 붙어서 재정의 불가
    //override class func finalclassMethod(){
    //    print("Student - classMethod")
    //}
}

let john = Person()
let tom = Student5()

john.name = "john"
tom.name = "tom"
tom.major = "computer science"

john.selfIntroduce()
tom.selfIntroduce()

john.sayHello()
tom.sayHello()

Person.typeMethod()
Person.classMethod()
Student5.classMethod()

print("---------------------------")

// MARK: - 인스턴스의 생성과 소멸
class PersonA {
    var name: String = "이름 아직 없음"
    var age: Int = 0
    var nickname: String = "별명 아직 없음"
}

// 인스턴스 생성
let jason = PersonA()
jason.name = "Jason"
jason.age = 29
jason.nickname = "똑똑이"

// 클래스 밖에서는 상관없음
let name: String
name = "name"

// 객체 선언과 동시에 초기화
class PersonB {
    var name: String
    var age: Int
    var nickname: String
    
    init(name: String, age: Int, nickname: String) {
        self.name = name
        self.age = age
        self.nickname = nickname
    }
}

let jacob = PersonB(name: "Jacob", age: 23, nickname: "J")


class PersonC {
    var name: String
    var age: Int
    var nickname: String?
    
    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
    
    init(name: String, age: Int, nickname: String){
        self.name = name
        self.age = age
        self.nickname = nickname
    }
}

let jenny = PersonC(name: "Jenny", age: 36)
let thomas = PersonC(name: "Thomas", age: 36, nickname: "tommy")

class Puppy {
    var name: String
    var owner: PersonC!
    
    init(name: String) {
        self.name = name
    }
    
    // 강아지 산책 메서드
    func goOut(){
        print("\(name)가 주인 \(owner.name)와 산책을 합니다.")
    }
}

let author = Puppy(name: "author")
// author.goOut()   // 에러 발생


author.owner = jenny
author.goOut()


class PuppyB {
    var name: String
    var owner: PersonC?
    
    init(name: String) {
        self.name = name
    }
    
    // 강아지 산책 메서드
    func goOut(){
        guard let owner2 = self.owner else{
            print("강아지는 주인 없이 산책하면 안됩니다.")
            return
        }
        print("\(name)가 주인 \(owner2.name)와 산책을 합니다.")
    }
}

let happy = PuppyB(name: "Happy")
happy.goOut()

happy.owner = thomas
happy.goOut()


class PersonD {
    var name: String
    var age: Int
    var nickname: String?
    
    init?(name: String, age: Int){
        if(0...120).contains(age) == false{
            return nil
        }
        if name.count == 0 {
            return nil
        }
        self.name = name
        self.age = age
    }
}


let maria: PersonD? = PersonD(name: "maria", age: 23)
let joker: PersonD? = PersonD(name: "joker", age: 42)
let batman: PersonD? = PersonD(name: "", age: 34)

print("maria: \(maria)")
print("joker: \(joker)")
print("batman: \(batman)")


// 디이니셜라이저
class PersonE {
    var name: String
    var pet: Puppy?
    var child: PersonC
    
    init(name: String, child: PersonC) {
        self.name = name
        self.child = child
    }
    
    // 인스턴스가 메모리에서 해제되는 시점에 자동으로 호출
    deinit {
        if let petName = pet?.name{
            print("\(name)가 \(child.name)에게 \(petName)을 인도합니다.")
            self.pet?.owner = child
        }
    }
}

var donald: PersonE? = PersonE(name: "Donald", child: jenny)
donald?.pet = author
donald = nil


// MARK: - protocol: 다른 언어에서의 인터페이스와 같다.
protocol TestProtocol{
    // 정의부
    var member: String {get}    // 멤버 변수 구현을 요구
    func method()               // 멤버 메서드 구현을 요구
}

protocol Talkable{
    // get set : 읽기 쓰기 모두 가능한 프로퍼티를 요구
    var topic: String {get set}
    // get : 읽기만 가능해도 무방
    var language: String {get}
    
    // 메서드 구현 요구
    func talk()
    
    // init 구현 요구
    init(topic: String, language: String)
}

// PersonF 구조체는 talkable 프로트콜을 채택했습니다.
struct PersonF: Talkable{
//    var topic: String
//    let language: String
    
    var language: String {return "한국어"}
    var subject: String = ""
    var topic: String {
            set {
                self.subject = newValue
            }
    //        set(inputValue) { // set value 명칭 지정 가능
    //            self.subject = inputValue
    //        }
            get {
                return self.subject
            }
        }
    
    func talk() {
        print("\(topic)에 대해 \(language)로 말합니다.")
    }
    
    init(topic: String, language: String) {
        self.topic = topic
//        self.language = language
    }
    
}

var person = PersonF(topic: "겨울", language: "영어")
person.talk()


// 프로토콜 상속
protocol Readable{
    func read()
}
protocol Writeable{
    func write()
}
protocol ReadSpeakable: Readable{
    func speak()
}
protocol ReadWriteSpeakable: Readable, Writeable {
    func speak()
}

struct SomeType: ReadWriteSpeakable{
    func speak(){
        print("Speak")
    }
    
    func write(){
        print("Write")
    }
    
    func read(){
        print("Read")
    }
}

class SomeClass: Readable, Writeable{
    func write(){
        print("Write")
    }
    
    func read(){
        print("Read")
    }
}


//  MARK: - Extension

class CustomClass {
    var member = ""
    
}

// 클래스 확장. test 메소드 customclass에서 호출 가능
extension CustomClass{
    func test(){
        print("test")
    }
}

var customClass = CustomClass()
customClass.test()

extension String{
    func test(){
        print("확장되었습니다.")
    }
}

var someVar = "스트링"
someVar.test()
