//
//  ContentView.swift
//  Shared
//
//  Created by Susan Kim on 2021/12/11.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    private let tipPercentages = [10, 15, 20, 25, 0]
    
    var body: some View {
        Form {
            Section {
                TextField("Amount",             // placeholder
                          value: $checkAmount,  // two-way binding
                          format: .currency(code: Locale.current.currencyCode ?? "USD"))           // textfield formatter, use local currenty 
                    .keyboardType(.decimalPad)
            }
            
            Section {
                Text(checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
