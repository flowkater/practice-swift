//import UIKit

import Darwin

var greeting = "Hello, playground"
var name = "flowkater"


let b = 10
var a = 5
a = b

let (x, y) = (1, 2)

let sentence = greeting + ", " + name


let sentence2 = "Hello, \(name)."

Int.random(in: 1...1000)
name.count

let age = 33

10...19 ~= age

switch age {
case 10...19:
    print("10s")
case 20...29:
    print("20s")
case 30...39:
    print("30s")
default:
    break
}

let num = 10

switch num {
case let x where x % 2 == 0:
    print("Even \(x)")
default:
    print("Odd \(x)")
}

let gameStrings = ["가위","바위","보"]



0 - 2 // Win
1 - 0 // Win
2 - 1 // Win


func rule(a: Int, b: Int) -> String {
    if a == b {
        return "Draw"
    } else if a > b {
        if a == 2 && b == 0 {
            return "Win"
        }
        return "Lose"
    } else {
        if b == 2 && a == 0 {
            return "Lose"
        }
        return "Win"
    }
}

func game(myNumber: Int) {
    if myNumber < 0 || myNumber > 2 {
        print("Error")
        return
    }
    let computerNumber = Int.random(in: 0...2)
    print("computer: \(gameStrings[computerNumber]), me: \(gameStrings[myNumber])")
    
    print("You \(rule(a: computerNumber, b: myNumber))")
}

for i in 0..<10 {
    let r = i % 3
    game(myNumber: r)
}

for i in 0..<10 {
    let n = Int.random(in: 1...10)
    let ii = i+1
    
    if n == ii {
        print("Bingo \(n) \(ii)")
    } else if n > ii {
        print("Up \(n) \(ii)")
    } else {
        print("Down \(n) \(ii)")
    }
}


let _ = (1...10).reversed()
for i in stride(from: 1, to: 15, by: 2) {
    print(i)
}

print(
    (2...9).map{ a in
        (1...9).map{ b in
            "\(a)x\(b)=\(a*b)"
        }.joined(separator: "\n")
    }.joined(separator: "\n\n")
)


func plusFunction(number1 a: Int, number2 b: Int) -> Int {
    return a + b
}

print(plusFunction(number1: 1, number2: 2))

func plusNumbersFunction(numbers: Int..., num: Int = 5) -> Int {
    return numbers.reduce(0){ $0 + $1 } + num
}


print(plusNumbersFunction(numbers: 1, 2, 3, 4, 5, num: 100))


func validate(id: String?) -> Bool {
    guard let id = id, id.count >= 6 else {
        return false
    }
    
    return true
}

print(validate(id: "asbdf"))

@discardableResult
func doSomething() -> String {
    return "Swift"
}

doSomething()


func extractRandomCh(strings: String) -> Character {
    let index = Int.random(in: 0..<strings.count)
    
    return strings[strings.index(strings.startIndex, offsetBy: index)]
}

print(extractRandomCh(strings: "Showmethemoney"))

func isPrime(n: Int) -> Bool {
    let x = Int(sqrt(Double(n)))
    print(x)
    
    return x >= 2 ? (2..<x).filter{ n % $0 == 0 }.first == nil : true
}

print(isPrime(n: 2))
print(isPrime(n: 3))
print(isPrime(n: 4))
print(isPrime(n: 5))
print(isPrime(n: 7))
print(isPrime(n: 10))


func factorial(_ n: Int) -> Int {
    return n<=0 ? 1: n * factorial(n - 1)
}

print(factorial(10))

func f1(_ i: Int) -> Int {
    return i * 2
}

func f2(_ i: Int) -> String {
    return "\(i)"
}

let result = f2(f1(100))


func ff(_ pf1: @escaping (Int) -> Int, _ pf2: @escaping (Int) -> String) -> (Int) -> String {
    return { i in
        return pf2(pf1(i))
    }
}
let f3 = ff(f1, f2)
let result2 = f3(100)


func comp<A, B, C>(_ pf1: @escaping (A) -> B, _ pf2: @escaping (B) -> C) -> (A) -> C {
    return { i in
        return pf2(pf1(i))
    }
}
let f4 = comp(f1, f2)
let result3 = f3(100)


func filterEven(_ ns: [Int]) -> [Int] {
    return ns.filter{ $0 % 2 == 0 }
}

func sum(_ ns: [Int]) -> Int {
    return ns.reduce(0){ $0 + $1 }
}

let filteredSum = comp(filterEven, sum)

func solution(_ nums: [Int]) -> Int {
    return filteredSum(nums)
}

solution([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])

// 커링(Currying) - 여러개의 파라미터를 받는 함수를 하나의 파라미터를 받는 여러 개의 함수로 함수로 쪼개는 것
func multiply(_ a: Int) -> (Int) -> Int {
    return { b in
        return a + b
    }
}

let area = multiply(10)(20)


func filterSum(_ ns: [Int], _ n: Int) -> Int {
    return ns.filter{$0 % n == 0}.reduce(0, +)
}

func filterSum2(_ n: Int) -> ([Int]) -> Int {
    return { ns in
        return ns.filter{$0 % n == 0}.reduce(0, +)
    }
}

let filtererdR = filterSum2(3)
filtererdR([1, 2, 3, 4, 5, 6, 7, 8, 9,10])


func solution3(_ nums: [Int], _ r: Int) -> Int {
    let filteredR = filterSum2(r)
    return filteredR(nums)
}


//func af(_ nums: [Int], _ result: @escaping (Int) -> Void) {
//    DispatchQueue.main.async {
//        sleep(1)
//        let sum = nums.reduce(0, +)
//        result(sum)
//    }
//}
