//
//  ConditionalModifiers.swift
//  ViewsAndModifiers
//
//  Created by Susan Kim on 2021/12/13.
//

import SwiftUI

struct ConditionalModifiers: View {
    @State private var useRedText = false
    
    var body: some View {
        Button(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/) {
            useRedText.toggle()
        }
        .foregroundColor(useRedText ? .red : .blue)
    }
}

struct ConditionalModifiers_Previews: PreviewProvider {
    static var previews: some View {
        ConditionalModifiers()
    }
}
