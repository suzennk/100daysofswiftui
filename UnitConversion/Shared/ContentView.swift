//
//  ContentView.swift
//  Shared
//
//  Created by Susan Kim on 2021/12/13.
//

import SwiftUI

struct ContentView: View {
    @State var fromTemperature: Double = 0.0
    @State var selectedFromUnit: String = "meters"
    @State var selectedToUnit: String = "km"
    @FocusState var isInputFocused: Bool
    
    var toTemperature: Double {
        var tempInMilimeters: Double
        switch selectedFromUnit {
        case "meters": tempInMilimeters = fromTemperature * 10000
        case "km": tempInMilimeters = fromTemperature * 1000000
        case "feet": tempInMilimeters = fromTemperature * 304.8
        case "yards": tempInMilimeters = fromTemperature * 914.4
        case "miles": tempInMilimeters = fromTemperature * 1609000
        default: tempInMilimeters = 0
        }
        
        var convertedTemperature: Double
        switch selectedToUnit {
        case "meters": convertedTemperature = tempInMilimeters / 10000
        case "km": convertedTemperature = tempInMilimeters / 1000000
        case "feet": convertedTemperature = tempInMilimeters / 304.8
        case "yards": convertedTemperature = tempInMilimeters / 914.4
        case "miles": convertedTemperature = tempInMilimeters / 1609000
        default: convertedTemperature = 0
        }
        
        return convertedTemperature
    }
    
    let units = ["meters", "km", "feet", "yards", "miles"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Temperature", value: $fromTemperature, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($isInputFocused)
                }
                
                Section {
                    Picker("Unit", selection: $selectedFromUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("I want to convert from ...")
                }
                
                Section {
                    Picker("Unit", selection: $selectedToUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Convert into")
                }
                
                Section {
                    Text("\(toTemperature.formatted()) \(selectedToUnit)")
                }
            }
            .navigationTitle("Length Conversion")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        isInputFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
