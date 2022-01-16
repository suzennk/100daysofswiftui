//
//  ContentView.swift
//  Shared
//
//  Created by Susan Kim on 2022/01/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            // ordering by my locale
            Text(Date.now, format: .dateTime.day().month().year())
            
            Text(Date.now.formatted(date: .long, time: .shortened))
            
            Text(Date.now.formatted(date: .long, time: .omitted))
        }
    }
    
    func trivialExample() {
        var components = DateComponents()
        components.hour = 8
        components.minute = 0
        let date = Calendar.current.date(from: components) ?? Date.now
        print(date)
    }
    
    func example2() {
        let components = Calendar.current.dateComponents([.hour, .minute], from: Date.now)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
        print(hour, minute)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
