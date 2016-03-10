//: Playground - noun: a place where people can play

import UIKit

//optional string
var str : String?  //nil; no initalization


str = "hello people"

str.dynamicType

func printString(phrase: String?){
    
    print(phrase!) //unwraps optionals
}

printString(str)

//optional nil
var str2 : String?

//printString(str2)
//will not work because value is nil must have value to be unwrapped


var phrase = str!
//unwraps an optional

//optional chaining

class Poll{
    var candidate: Pollbooth?
    
}

class Pollbooth {
    
    var name = "MP"
}

let cand = Poll()

if let candName = cand.candidate?.name{
    print("candidate name is \(candName)")
    
}
else{
    print("Name cannot be retreived")
}

//because no initalization of opitional type nil value is auto stored

//comparing optional
let integer1 : Int? = 3

if (integer1 == 3){
    print("the value is true")
}
else{
    print("the value is false")
    
}

let integer2 : Int? = 5

integer1 == integer2

//value is false bc different initalized value

//classes
class Human {
    
    var name : String
    var age : Int
    
    class func printingName(personName: String){
        print("the persons name is: \(personName)")
        
    }
    
    class func printingAge(personAge: Int){
        print("the persons age is: \(personAge)")
        
    }
    
    class func printingSex(personSex: String){
        print("the persons sex is: \(personSex)")
        
    }
    
    //failed initalizer cant intialize a nil string val
    init?(name : String, age: Int = 19){
        
        self.name = name
        self.age = age
        
        if age == 19{
            return nil
        }
    }
    
    
}
//class methods
Human.printingName("Albert Pierce")
Human.printingAge(19)
Human.printingSex("male")

//subscripts

class Outcome {
    
    private var winLoseDraw = ["W","L","D"]
    
    subscript(idx: Int) -> String {
    
        return winLoseDraw[idx]
    }
    
}

let player1 = Outcome()
let player2 = Outcome()

print("")
print("Player 1 vs Player 2 FIFA match (PSG vs Chelsea)")
print("The match ends Player1 is victorious!!!!!!")
print("Player1: \(player1[0])")
print("Player2: \(player1[1])")
print("")

//enums

enum Automobiles {
    
    case BMW
    case MercedesBenz
    case Audi
    case Maybach
    
}

let cars = [Automobiles.Audi, Automobiles.BMW, Automobiles.Maybach, Automobiles.MercedesBenz]

for car in cars{
    
    print(car)
}

//value of enum
let BMW = Automobiles.BMW

//structs

struct Airplane{
    
    var Make : String
    var Model : String
    var YearBuilt : Int
    
}

let a1 = Airplane(Make: "Some WW2 plane", Model: "USA", YearBuilt: 1938)

var airplane = a1

airplane.dynamicType



class Automobile{
    
    var Make: String
    var Model: String
    var Year: Int
    var Color: String
    var rimSize: Int
    
    init(Make: String, Model: String, Year: Int, Color: String, rimSize: Int){
        
        self.Make = Make
        self.Model = Model
        self.Year = Year
        self.Color = Color
        self.rimSize = rimSize
        
    }
    
    func exhaustSound(){
        print("VROOM VROOM!!")
        
    }
    
    func printCarDetails() -> String{
        
        return "Make: \(Make)" + "\nModel: \(Model)" + "\nYear: \(Year)" + "\nColor: \(Color)" + "\nRimSize: \(rimSize)"
        
        
    }
    
}

let car1 = Automobile(Make: "MercedesBenz", Model: "S63 AMG", Year: 2016, Color: "Matte Grey", rimSize: 20)

print("")
car1.exhaustSound()
car1.printCarDetails()

final class Truck : Automobile{
    
    var towingCapacity: Int
    
    
    
    init(towingCapacity: Int) {
        
        self.towingCapacity = towingCapacity
        super.init(Make: "Ford", Model: "F150", Year: 2015, Color: "Yellow", rimSize: 24)
    }
    
    func printTruckDetails() -> String{
        
        return "Make: \(Make)" + "\nModel: \(Model)" + "\nYear: \(Year)" + "\nColor: \(Color)" + "\nRimSize: \(rimSize)" + "\nTowingCapacity: \(towingCapacity)"
        
        
    }
    
}


let truck1 = Truck(towingCapacity: 1500)
truck1.printTruckDetails()

protocol Animal {
    
    var furColor : String {get}
    
    func type()
    func scream()
    
}

class Bear : Animal {
    
    var furColor : String = "Brown"
    
    func type(){
        print("Grizzly Bear")
    }
    
    func scream(){
        print("RAAWWWWWRRR")
        
    }
    
    
    
}

let bear = Bear()


func printBear(b: Animal){
    
    b.type()
    print("Fur color: \(b.furColor)")
    b.scream()
    
}


printBear(bear)

//umbrella types

func Object(obj: AnyObject){}

Object(bear)
Object(truck1)
Object(car1)

func Class(cls : AnyClass){}

Class(Bear)
Class(Automobile)
Class(Truck)


func Any(any: Any){}

Any(Truck)
Any(Bear)
Any(truck1)
Any(car1)

//extension

extension Double {
    
    func celsiusToF() -> Double {
        return self * 9 / 5 + 32
        
    }
    
    func fahrenheitToC() -> Double{
        
        return (self - 32) * 5 / 9
        
    }
}

let boilingPointC = 100.0

let boilingPointF = boilingPointC.celsiusToF()
print("")
print(boilingPointF)


extension String {
    
    func replace(target: String, withString: String) -> String {
        return self.stringByReplacingOccurrencesOfString(target, withString: withString)
    }
}

let newString = "hey how are you".replace("you", withString: "thy")

print(newString)

//Collection Types

var integers = [Int]()
//.append
integers.append(3)
print(integers)

var shoppingList = ["Eggs", "Milk"]
//.count
print("The shopping list contains \(shoppingList.count) items.")

//check is shopping list is empty
if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list is not empty.")
}

shoppingList.append("Flour")
shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]

print(shoppingList)

var firstItem = shoppingList[0] //eggs

shoppingList.insert("Maple Syrup", atIndex: 0)

print(shoppingList)

//iteration through array
for (index, value) in shoppingList.enumerate() {
    print("Item \(index + 1): \(value)")
}

//dictionaries

var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

//adding

airports["LHR"] = "London"

//changing values

airports["LHR"] = "London Heathrow"

print("")
//iteration through dictionaries
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
    

}

//ternary

let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)


//while loops "Snakes and ladders"

let fSquare = 25
var gameboard = [Int](count: fSquare + 1, repeatedValue: 0)

gameboard[03] = +08
gameboard[06] = +11
gameboard[09] = +09
gameboard[10] = +02
gameboard[14] = -10
gameboard[19] = -11
gameboard[22] = -02
gameboard[24] = -08


var square = 0
var dRoll = 0
while square < fSquare {
    if ++dRoll == 7 { dRoll = 1 }
    square += dRoll
    if square < gameboard.count {
        // if we're still on the board, move up or down for a snake or a ladder
        square += gameboard[square]
    }
}
print("Game over!")

//switch statements

let someC: Character = "e"
switch someC {
    
case "a", "e", "i", "o", "u":
    print("\(someC) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m","n", "p", "q", "r", "s", "t", "v", "w", "x", "y",
    "z":
    print("\(someC) is a consonant")
default:
    print("\(someC) is not a vowel or a consonant")
}



//error handling

enum VendingMachineError: ErrorType {
    case InvalidSelection
    case InsufficientFunds(coinsNeeded: Int)
    case OutOfStock
}

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0
    func dispenseSnack(snack: String) {
        print("Dispensing \(snack)")
    }
    
    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.InvalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.OutOfStock
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.InsufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        dispenseSnack(name)
    }
}





