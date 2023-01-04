import UIKit
import Foundation


//  Challenge 1
func challenge1( input : String) -> Bool{
    var result = true
    for a1 in input {
        var count = 0
        for a2 in input{
            if a1 == a2{
                count += 1
            }
            if result == true && count > 1 {
                result = false
            }
        }
    }
    return result
}
// Check Output
//print(challenge1(input: "No duplicates"))
//print(challenge1(input: "abcdefghijklmnopqrstuvwxyz"))
//print(challenge1(input: "AaBbCc"))
//print(challenge1(input: "Hello, world"))


// CHALLENGE 2
func challenge2(input : String) -> Bool{
    var result = true
    let newInput = input.uppercased()
    let a = Array(newInput)
    for i in 0...((a.count-1)/2) {
        if a[i] != a[a.count - 1 - i]{
            result = false
        }
    }
    return result
}
//Check Ouput
//challenge2(input: "rotator")
//challenge2(input: "Rats live on no evil star")
//challenge2(input: "Never odd or even")
//challenge2(input: "Hello, world")


// CHALLENGE 3

func setUpValue(input: String) -> [String:Int] {
    var result = [String: Int]()
    for i in input{
        result["\(i)"] = 0
    }
    return result
}
func challenge3(input1: String, input2: String) -> Bool{
    var result = true
    
    var count1 = setUpValue(input: input1)
    var count2 = setUpValue(input: input2)
    for i in input1{
        count1["\(i)"]! += 1
    }
    for i in input2{
        count2["\(i)"]! += 1
    }
    print(count1)
    print(count2)
    
    result = count1 == count2
    return result
}
// check Output
//challenge3(input1: "abca", input2: "abca")
//challenge3(input1: "abc", input2: "cba")
//challenge3(input1: " a1 b2 ", input2: " b1 a2 ")
//challenge3(input1: "abc", input2: "Abc")
//challenge3(input1: "abc", input2: "cbAa")
//challenge3(input1: "abcc", input2: "abca")


//CHALLENGE 4
var input1 = "abcd"
var input2 = "d"
extension String{
    func fuzzyContains(input2: String) -> Bool{
        var box = [String]()
        for i in 0...(self.count - input2.count){
            let a = self[self.index(self.startIndex, offsetBy: i)...self.index(self.startIndex, offsetBy: (i + input2.count - 1))]
            box.append("\(a)")
        }
        dump(box)
        for i in box{
            if i == input2{
                return true
            }
        }
        
        return false
    }
}
// Check Output
//input1.fuzzyContains(input2: input2)


// CHALLENGE 5
func countCharac(input: String){
    let characterArray = Array(input)
    var countCharacter = characterArray.reduce([String: Int]()) { (dict, character1) -> [String: Int] in
        var dict = dict
        dict["\(character1)"] = 0
        return dict
    }
    characterArray.map { (character1) in
        countCharacter["\(character1)"]! += 1
    }
    countCharacter.removeValue(forKey: " ")
    countCharacter.map{(character) in
        print("Ky tu \(character.key) xuat hien \(character.value) lan")
    }
}
// Check Output
//countCharac(input: "The rain in Spain")
//countCharac(input: "Hacking with Swift")
//countCharac(input: "Mississippi")


// CHALLENGE 6

func removeDuplicate(input: String) -> String{
    var arraySubString = [String]()
    var newInput = input
    for i in newInput{
        arraySubString = newInput.components(separatedBy: "\(i)")
        arraySubString[0] += "\(i)"
        newInput = ""
        for newI in arraySubString{
            newInput += newI
        }
    }
    
    print(newInput)
    return newInput
    }
          
//print(removeDuplicate(input: "abcAbCbbbbb"))

// CHALLENGE 7
func removeMultipleWhitePlace(input: String){
    let newInput = input
    var arraySubString = newInput.components(separatedBy: " ")
    arraySubString.removeAll{$0 == ""}
    var newArr = [String]()
    for i in arraySubString{
        let newI = " " + i
        newArr.append(newI)
    }
    var newString = ""
    for i in newArr{
        newString += i
    }
    newString.removeFirst()
    dump(newString)
}
//removeMultipleWhitePlace(input: "em an     com  chua     ?")


// CHALLENGE 8
func checkRotatedString(input1: String,input2: String)-> Bool{
    let arrayCharacter = Array(input1)
    for i in 0...(arrayCharacter.count - 2){
        var newString1 = ""
        var newString2 = ""
        for y in 0...i{
            newString1 += "\(arrayCharacter[y])"
        }
        for y in (i+1)...(arrayCharacter.count - 1){
            newString2 += "\(arrayCharacter[y])"
        }
        let finalString = newString2 + newString1
        if finalString == input2 {
            return true
        }
    }
    
    return false
}
//checkRotatedString(input1: "abcde", input2: "abced")



// CHALLENGE 9
func checkPangram(input: String) -> Bool{
    let newInput = input.lowercased()
    let nonDuplicateString = removeDuplicate(input: newInput)
    let finalString =  nonDuplicateString.filter{ $0 >= "a" && $0 <= "z"}
    return finalString.count == 26
}
//checkPangram(input: "The quick brown fox jumped over the lazy dog")



// CHALLENGE 10
func challenge10(input: String) -> (Vowels: Int, consonants: Int){
    let newInput = input.lowercased()
    let finalString =  newInput.filter{ $0 >= "a" && $0 <= "z"}
    let vowelArray = finalString.filter{"ueoai".contains($0)}
    return (vowelArray.count,finalString.count - vowelArray.count)
}
// Check output
//print(challenge10(input: "Swift Coding Challenges"))




// CHALLENGE 11
func challenge11(input1: String, input2: String) -> Bool{
    if input1.count != input2.count {
        return false
    }
    let arr1 = Array(input1)
    let arr2 = Array(input2)
    var countL = 0
    for i in 0...(input2.count - 1){
        if arr1[i] != arr2[i]{
            countL += 1
        }
        if countL > 3{
            return false
        }
    }
    
    
    return true
}
// Check Output
//challenge11(input1: "Clampmmm", input2: "Cretmmmm")




// CHALLENGE 12
func challenge12(input1: String) -> String{
    let arraySubString = input1.components(separatedBy: " ")
    var a = arraySubString[0]
    for i in 0...(arraySubString.count - 1){
        if a.count > arraySubString[i].count {
            a = arraySubString[i]
        }
    }
    var result = ""
    let arrayCharac = Array(input1)
    for i in 0...(a.count - 1){
        var preResult = ""
        for y in 0...i{
            preResult += "\(arrayCharac[y])"
        }
        var check = true
        for y in arraySubString{
            if y.contains(preResult) == false{
                check = false
            }
        }
        if check {
            result = preResult
            dump(result)
        }
    }
    return result
}
// Check output
//challenge12(input1: "waaaadbwb waaaanbdwhbo")




//CHALLENGE 13
func challenge13(input: String){
    var result = ""
    var count = 0
    
    for (index,charac) in input.enumerated(){
        if index == 0 {
            result.append(charac)
        }
        if charac != result.last {
            result.append("\(count)")
            count = 1

            result.append("\(charac)")
        } else {
            count += 1
        }
        if index == (input.count - 1){
            result.append("\(count)")
        }
        
        
    }
    print(result)
    
    
}
challenge13(input: "aabbaaaaAACCC")


// CHALLENGE 14
func challenge14(input: String){
    
}
