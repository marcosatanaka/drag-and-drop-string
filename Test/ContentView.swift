//
//  ContentView.swift
//  Test
//
//  Created by Marcos Tanaka on 17/11/21.
//

import SwiftUI

struct ContentView: View {

    let myElement = MyElement(title: "Element 1")

    var body: some View {
        HStack {
            ViewA()
                .onDrag { NSItemProvider(object: myElement.title as NSString) }
            ViewB()
                .onDrop(of: [.plainText], isTargeted: nil, perform: { providers, location in
                    _ = providers.first?.loadObject(ofClass: NSString.self, completionHandler: { text, error in
                        print("Dropped \(text?.description ?? "?") with error: \(error?.localizedDescription ?? "")")
                    })
                    return true
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
