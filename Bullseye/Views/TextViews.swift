//
//  TextViews.swift
//  Bullseye
//
//  Created by Jan Armbrust on 07.09.23.
//

import SwiftUI

struct InstructionText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.callout)
            .kerning(2.0)
            .foregroundColor(Color("TextColor"))
    }
}

struct BigNumberText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .fontWeight(.black)
            .font(.largeTitle)
            .kerning(-1.0)
            .foregroundColor(Color("TextColor")
        )
    }
}

struct SmallNumberText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .foregroundColor(Color("TextColor"))
    }
}

struct LabelText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .foregroundColor(Color("TextColor"))
            .kerning(1.5)
            .font(.footnote)
    }
}

struct BodyText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.subheadline)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .lineSpacing(12)
    }
}

struct ButtonText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.accentColor)
            .foregroundColor(Color.white)
            .cornerRadius(12)
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            InstructionText(text: "Instructions")
            BigNumberText(text: "999")
            SmallNumberText(text: "100")
            LabelText(text: "Score")
            BodyText(text: "You scored 100 Points\n 😍")
            ButtonText(text: "Start New Round")
        }
        .padding()
    }
}
