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
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            VStack {
                Text("🎯🎯🎯\nPut the Bullseye as close as you can to".uppercased())
                    .bold()
                    .multilineTextAlignment(.center)
                    .lineSpacing(4.0)
                    .font(.footnote)
                    .kerning(2.0)
                    .padding(.horizontal, 30)
                    .foregroundColor(Color("TextColor"))
                Text(String(game.target))
                    .fontWeight(.black)
                    .font(.largeTitle)
                    .kerning(-1.0)
                    .foregroundColor(Color("TextColor"))
                HStack {
                    Text("0")
                        .bold()
                        .foregroundColor(Color("TextColor"))
                    Slider(value: $sliderValue, in: 1.0...100.0)
                    Text("100")
                        .bold()
                        .foregroundColor(Color("TextColor"))
                }
                .padding()
                Button("Hit me".uppercased()) {
                    alertIsVisible = true
                }
                .padding(20.0)
                .background(
                    ZStack {
                        Color("ButtonColor")
                        LinearGradient(colors: [Color.white.opacity(0.3), Color.clear], startPoint: .top, endPoint: .bottom)
                    }
                )
                .foregroundColor(.white)
                .cornerRadius(21.0)
                .bold()
                .font(.title3)
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .preferredColorScheme(.dark)
    }
}
