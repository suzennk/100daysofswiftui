//
//  ContentView.swift
//  Shared
//
//  Created by Susan Kim on 2021/12/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 10) {
            Button("Button1") { }
            .buttonStyle(.bordered)
            Button("Button2", role: .destructive) { }
            .buttonStyle(.bordered)
            Button("Button3") { }
            .buttonStyle(.borderedProminent)
            .tint(.mint)
            Button("Button4", role: .destructive) { }
            .buttonStyle(.borderedProminent)
            
            Button {
                print("Button was tapped!")
            } label: {
                Text("Tap me!")
                    .padding()
                    .foregroundColor(.white)
                    .background(.red)
            }
            
            Button {
                print("Edit button was tapped")
            } label: {
                Image(systemName: "pencil")
            }
            
            Button {
                print("Edit button was tapped")
            } label: {
                Label("Edit", systemImage: "pencil")
            }
        }
    }
    
    func executeDelete() {
        print("Now deleting")

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
