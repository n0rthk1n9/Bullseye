//
//  PointsView.swift
//  Bullseye
//
//  Created by Jan Armbrust on 07.09.23.
//

import SwiftUI

struct PointsView: View {
    @Binding var sliderValue: Double
    @Binding var game: Game
    @Binding var alertIsVisible: Bool
    
    var body: some View {
        let roundedSliderValue = Int(sliderValue.rounded())
        let points = game.points(sliderValue: roundedSliderValue)
        
        VStack(spacing: 10.0) {
            InstructionText(text: "The slider's value is")
            BigNumberText(text: String(roundedSliderValue))
            BodyText(text: "You scored \(points) points\n 🎉🎉🎉")
            Button {
                alertIsVisible = false
                game.startNewRound(points: points)
            } label: {
                ButtonText(text: "Start New Round")
            }
        }
        .padding()
        .frame(maxWidth: 300.0)
        .background(Color("BackgroundColor"))
        .cornerRadius(21)
        .shadow(radius: 10.0, x: 5.0, y: 5.0)
    }
}

struct PointsView_Previews: PreviewProvider {
    static var previews: some View {
        PointsView(sliderValue: .constant(50.0), game: .constant(Game()), alertIsVisible: .constant(true))
        PointsView(sliderValue: .constant(50.0), game: .constant(Game()), alertIsVisible: .constant(true))
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.landscapeRight)
    }
}
