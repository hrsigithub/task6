//
//  ContentView.swift
//  task6
//
//  Created by Hiroshi.Nakai on 2021/02/18.
//

import SwiftUI

struct AlertDetail: Identifiable {
    let id = UUID()
    let message: String
}

struct ContentView: View {
    @State private var numSlider: Float = 50

    @State var random = Int.random(in: 1..<101)
    @State private var errorAlert: AlertDetail?

    var body: some View {
        VStack {
            HStack {
                Text(String(random))
                    .font(.largeTitle)
            }.padding()

            HStack {
                Text("1")
                Slider(value: $numSlider, in: 1...100, step: 1.0)
                Text("100")
            }.padding()

            HStack {
                Button("判定！") {
                    if Int(numSlider) == random {
                        errorAlert = .init(message: "あたり！\nあなたの値: \(Int(numSlider))")
                    } else {
                        errorAlert = .init(message: "はずれ！\nあなたの値: \(Int(numSlider))")
                    }

                }.alert(item: $errorAlert) { msg in
                    Alert(title: Text("結果"),
                          message: Text(msg.message),
                          dismissButton: .default(Text("再挑戦"),
                                                  action: {
                                                    numSlider = 50
                                                    random = Int.random(in: 1..<101)
                                                  })
                    )
                }
            }

            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
