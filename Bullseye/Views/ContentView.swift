//
//  ContentView.swift
//  Bullseye
//
//  Created by Jan Armbrust on 17.08.23.
//

import SwiftUI

struct ContentView: View {
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    var body: some View {
        VStack {
            Text("🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
                .bold()
                .multilineTextAlignment(.center)
                .lineSpacing(4.0)
                .font(.footnote)
                .kerning(2.0)
            Text(String(game.target))
                .fontWeight(.black)
                .font(.largeTitle)
                .kerning(-1.0)
            HStack {
                Text("0")
                    .bold()
                Slider(value: $sliderValue, in: 1.0...100.0)
                Text("100")
                    .bold()
            }
            Button("Hit me") {
                alertIsVisible = true
            }
            .alert(
                "Hello there!",
                isPresented: $alertIsVisible,
                actions: {
                    Button("Hit me") {
                        print("Alert closed")
                    }
                },
                message: {
                    let roundedValue = Int(sliderValue.rounded())
                    Text("""
                        The slider's value is \(roundedValue).
                        You scored \(game.points(sliderValue: roundedValue)) this round
                    """)
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
