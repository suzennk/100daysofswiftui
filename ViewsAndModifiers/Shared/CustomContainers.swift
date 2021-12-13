//
//  CustomContainers.swift
//  ViewsAndModifiers
//
//  Created by Susan Kim on 2021/12/13.
//

import SwiftUI

/*
 Generics - you can pass in any Content you want,
 whatever it is, it must conform to View protocol
 */
struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    // defines a function that accepts two integers and returns Content
    // make into TupleView silently by adding @ViewBuilder
    @ViewBuilder let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
}

struct CustomContainers: View {
    var body: some View {
        GridStack(rows: 4, columns: 4) { row, col in
            Image(systemName: "\(row * 4 + col).circle")
            Text("R\(row) C\(col)")
        }
    }
}

struct CustomContainers_Previews: PreviewProvider {
    static var previews: some View {
        CustomContainers()
    }
}
