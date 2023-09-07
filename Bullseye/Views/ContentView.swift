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
                InstructionsView(game: $game)
                SliderView(sliderValue: $sliderValue)
                HitMeButton(game: $game, sliderValue: $sliderValue, alertIsVisible: $alertIsVisible)
            }
        }
    }
}

struct InstructionsView: View {
    @Binding var game: Game
    
    var body: some View {
        VStack {
            InstructionText(text: "🎯🎯🎯\nPut the Bullseye as close as you can to")
                .padding(.horizontal, 30)
            BigNumberText(text: String(game.target))
        }
    }
}

struct SliderView: View {
    @Binding var sliderValue: Double
    
    var body: some View {
        HStack {
            SmallNumberText(text: "0")
            Slider(value: $sliderValue, in: 1.0...100.0)
            SmallNumberText(text: "100")
        }
        .padding()
    }
}

struct HitMeButton: View {
    @Binding var game: Game
    @Binding var sliderValue: Double
    @Binding var alertIsVisible: Bool
    
    var body: some View {
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
        .overlay(
            RoundedRectangle(cornerRadius: 21)
                .strokeBorder(Color.white, lineWidth: 2.0)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .preferredColorScheme(.dark)
    }
}
