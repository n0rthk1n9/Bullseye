//
//  LeaderboardView.swift
//  Bullseye
//
//  Created by Jan Armbrust on 07.09.23.
//

import SwiftUI

struct LeaderboardView: View {
    @Binding var leaderboardIsShowing: Bool
    @Binding var game: Game

    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            ScrollView {
                VStack(spacing: 10) {
                    HeaderView(leaderboardIsShowing: $leaderboardIsShowing)
                    LabelView()
                    VStack(spacing: 10) {
                        ForEach(game.leaderboardEntries.indices, id: \.self) { index in
                            let leaderboardEntry = game.leaderboardEntries[index]
                            RowView(index: index + 1, score: leaderboardEntry.score, date: leaderboardEntry.date)
                        }
                    }
                }
            }
        }
    }
}

struct HeaderView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Binding var leaderboardIsShowing: Bool

    var body: some View {
        ZStack {
            HStack {
                BigBoldText(text: "Leaderboard")
                if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                    Spacer()
                }
            }
            HStack {
                Spacer()
                Button {
                    leaderboardIsShowing = false
                } label: {
                    RoundedImageViewFilled(systemName: "xmark")
                }
            }
        }
        .padding([.horizontal, .top])
    }
}

struct LabelView: View {
    var body: some View {
        HStack {
            Spacer()
                .frame(width: Constants.General.roundedViewLength)
            Spacer()
            LabelText(text: "Score")
                .frame(width: Constants.Leaderboard.scoreColumnWidth)
            Spacer()
            LabelText(text: "Date")
                .frame(width: Constants.Leaderboard.dateColumnWidth)
        }
        .padding(.horizontal)
        .frame(maxWidth: Constants.Leaderboard.maxRowWidth)
    }
}

struct RowView: View {
    let index: Int
    let score: Int
    let date: Date

    var body: some View {
        HStack {
            RoundedTextView(text: String(index))
            Spacer()
            ScoreText(score: score)
                .frame(width: Constants.Leaderboard.scoreColumnWidth)
            Spacer()
            DateText(date: date)
                .frame(width: Constants.Leaderboard.dateColumnWidth)
        }
        .background(
            RoundedRectangle(cornerRadius: .infinity)
                .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
        )
        .padding(.horizontal)
        .frame(maxWidth: Constants.Leaderboard.maxRowWidth)
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    private static var game = Binding.constant(Game(loadTesData: true))

    static var previews: some View {
        LeaderboardView(leaderboardIsShowing: .constant(false), game: game)
            .previewInterfaceOrientation(.landscapeRight)
        LeaderboardView(leaderboardIsShowing: .constant(false), game: game)
            .preferredColorScheme(.dark)
    }
}
