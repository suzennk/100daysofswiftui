//
//  ContentView.swift
//  Shared
//
//  Created by Susan Kim on 2021/12/13.
//

import SwiftUI

struct SomeView: View {
    // view does not mean anything - just some kind of view
    // it is not allowed to say `var body: View`
    // abstract class랑 비슷한 개념인가?
    
    var body: some View {
        Button("Hello, world!") {
            print(type(of: self.body))
        }
        .frame(width: 200, height: 200)
        .background(.red)
        
        /*
         This VStack returns a 'TupleView' which has exactly two views
         TupleView can currently hold only up to 10 views
         */
        VStack {
            Text("Hello")
            Text("World")
        }
        
        /*
         Views not stacked in a Stack
         attaches attribute to body property
         wraps the views into TupleView 
         */
        Text("Hello")
        Text("World")
    }
}

struct SomeViews_Previews: PreviewProvider {
    static var previews: some View {
        SomeView()
    }
}
