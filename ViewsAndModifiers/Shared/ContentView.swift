//
//  ContentView.swift
//  Shared
//
//  Created by Susan Kim on 2021/12/13.
//

import SwiftUI

// UIHostingController - bridge between Swift & SwiftUI
struct ContentView: View {
    var body: some View {
        /*
         Modifiers make a copy of a view with the change applied.
         */
        Button("Hello, world!") {
            print(type(of: self.body))
        }
        // ordering of modifiers matter !
        
        // ModifiedContent<ModifiedContent<Button<Text>, _BackgroundStyleModifier<Color>>, _FlexFrameLayout>
        .background(.red)
        .frame(width: 200, height: 200)
        
        // ModifiedContent<ModifiedContent<Button<Text>, _FrameLayout>, _BackgroundStyleModifier<Color>>

        // .frame(width: 200, height: 200)
        // .background(.red)
        
        Text("Hello, world!")
            .padding()
            .background(.red)
            .padding()
            .background(.blue)
            .padding()
            .background(.green)
            .padding()
            .background(.yellow)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
