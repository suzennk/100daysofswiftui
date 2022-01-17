//
//  ContentView.swift
//  WordScramble
//
//  Created by Susan Kim on 2022/01/17.
//

import SwiftUI

struct ContentView: View {
    @State var result1: String = ""
    @State var result2: String = ""
    @State var result3: String = ""
    @State var result4: String = ""

    var body: some View {
        List {
            Section("Random letter from [a b c]") {
                Text(result1)
            }
            
            Section("Separate multiline String") {
                Text(result2)
            }
            
            Section("Spell check [swift]") {
                Text(result3)
            }
            
            Section("Spell check [swiflljjfie]") {
                Text(result4)
            }
        }
        .onAppear {
            test()
            test2()
            test3()
            test4()
        }
    }
    
    func test() {
        let input = "a b c"
        let letters = input.components(separatedBy: " ")
        let letter = letters.randomElement()
        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
        result1 = trimmed ?? ""
    }
    
    func test2() {
        let input = """
a
b
c
"""
        let letters = input.components(separatedBy: "\n")
        result2 = letters.joined(separator: ", ")
    }
    
    func test3() {
        let word = "swift"
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(
            in: word,
            range: range,
            startingAt: 0,
            wrap: false,
            language: "en")
        let allGood = misspelledRange.location == NSNotFound
        result3 = allGood ? "Good!" : "Error in \(misspelledRange.description)"
    }
    
    func test4() {
        let word = "swiflljjfie"
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        let allGood = misspelledRange.location == NSNotFound
        result4 = allGood ? "Good!" : "Error in \(misspelledRange.description)"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
