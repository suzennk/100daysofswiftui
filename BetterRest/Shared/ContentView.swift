//
//  ContentView.swift
//  Shared
//
//  Created by Susan Kim on 2022/01/16.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Date.now
    
    var body: some View {
        VStack(spacing: 30) {
            DatePicker("Please enter a date", selection: $wakeUp)
            
            Divider()
            
            DatePicker("", selection: $wakeUp)
            
            Divider()
            
            DatePicker("Please enter a date", selection: $wakeUp)
                .labelsHidden()
            
            Divider()
            
            DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
            
            Divider()
            
            DatePicker("Please enter a date", selection: $wakeUp, in: Date.now...Date.now.addingTimeInterval(86400))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
