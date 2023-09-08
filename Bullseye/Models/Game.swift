//
//  Game.swift
//  Bullseye
//
//  Created by Jan Armbrust on 17.08.23.
//

import Foundation

struct Game {
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    var leaderboardEntries: [LeaderboardEntry] = []

    init(loadTesData: Bool = false) {
        if loadTesData {
            addToLeaderboardEntries(entry: LeaderboardEntry(score: 100, date: Date().addingTimeInterval(3600)))
            addToLeaderboardEntries(entry: LeaderboardEntry(score: 80, date: Date().addingTimeInterval(20)))
            addToLeaderboardEntries(entry: LeaderboardEntry(score: 200, date: Date().addingTimeInterval(7200)))
            addToLeaderboardEntries(entry: LeaderboardEntry(score: 50, date: Date().addingTimeInterval(800)))
        }
    }

    func points(sliderValue: Int) -> Int {
        let closeToPerfectRange = (target - 2)...(target + 2)
        if sliderValue == target {
            return 100 - abs(sliderValue - target) + 100
        } else if closeToPerfectRange.contains(sliderValue) {
            return 100 - abs(sliderValue - target) + 50
        } else {
            return 100 - abs(sliderValue - target)
        }
    }

    mutating func startNewRound(points: Int) {
        addToLeaderboardEntries(entry: LeaderboardEntry(score: points, date: Date()))
        score = score + points
        round = round + 1
        target = Int.random(in: 1...100)
    }

    mutating func restart() {
        score = 0
        round = 1
        target = Int.random(in: 1...100)
    }

    private mutating func addToLeaderboardEntries(entry: LeaderboardEntry) {
        leaderboardEntries.append(entry)
        leaderboardEntries.sort { entry1, entry2 in
            entry1.score > entry2.score
        }
    }
}

struct LeaderboardEntry {
    let score: Int
    let date: Date
}
