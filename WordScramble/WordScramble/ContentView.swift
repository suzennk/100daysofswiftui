//
//  ContentView.swift
//  WordScramble
//
//  Created by Susan Kim on 2022/01/17.
//

import SwiftUI

struct ContentView: View {
    let people = ["Finn", "Claire", "Luke", "Ray"]
    var body: some View {
        VStack {
            List {
                Section("Section 1") {
                    Text("Static row 1")
                    Text("Static row 2")
                }
                
                Section("Section 2") {
                    ForEach(1..<4) {
                        Text("Daynimic row \($0)")
                    }
                }
            }
            .listStyle(.grouped)
            .frame(maxWidth: .infinity, maxHeight: 400)
            
            List(1..<4) {
                Text("Dynamic type \($0)")
            }
            .frame(maxWidth: .infinity, maxHeight: 200)
            
            List(people, id: \.self) {
                Text($0)
            }
            .frame(maxWidth: .infinity, maxHeight: 200)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
