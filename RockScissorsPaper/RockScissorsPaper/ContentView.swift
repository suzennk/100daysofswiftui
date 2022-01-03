//
//  ContentView.swift
//  RockScissorsPaper
//
//  Created by Susan Kim on 2021/12/20.
//

import SwiftUI

enum RoundResult {
    case none
    case win
    case lose
    
    var text: String {
        switch self {
        case .none:
            return "--"
        case .win:
            return "Good!"
        case .lose:
            return "Poor"
        }
    }
    
    var color: Color {
        switch self {
        case .none:
            return .gray
        case .win:
            return .blue
        case .lose:
            return .red
        }
    }
}

enum Move: String, CaseIterable {
    case rock = "✊"
    case scissor = "✌️"
    case paper = "🖐"
    
    var winningCase: Move {
        switch self {
        case .rock:
            return .paper
        case .scissor:
            return .rock
        case .paper:
            return .scissor
        }
    }
    
    var losingCase: Move {
        switch self {
        case .rock:
            return .scissor
        case .scissor:
            return .paper
        case .paper:
            return .rock
        }
    }
}

struct ContentView: View {
    @State var score = 0
    @State var round = 1
    @State var appsMove = Move.allCases.randomElement() ?? .rock
    @State var shouldWin = Bool.random()
    @State var lastResult = RoundResult.none
    @State var selectedMove = Move.rock
    
    @State var shouldAlertResetGame = false
    
    let maxRound = 10
    let darkRed = Color(red: 0.76, green: 0.15, blue: 0.26)
    let darkBlue = Color(red: 0.1, green: 0.2, blue: 0.45)
    
    var questionText: String {
        get {
            shouldWin ? "WIN" : "LOSE"
        }
    }
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 241/255.0, green: 189/255.0, blue: 107/255.0), location: 0.8),
                .init(color: Color(red: 26/255.0, green: 48/255.0, blue: 96/255.0), location: 0.8),
            ], center: .bottom, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    VStack {
                        Text("Round")
                            .foregroundColor(.gray)
                            .font(.caption)
                        HStack(alignment:.bottom, spacing: 2) {
                            Text("⁄ \(maxRound)")
                                .bold()
                                .foregroundColor(.clear)
                            Text("\(round)")
                                .font(.title.bold())
                            Text("⁄ \(maxRound)")
                                .font(.body.bold())
                        }
                    }
                    .frame(maxWidth: .infinity)
                    
                    VStack {
                        Text("Score")
                            .foregroundColor(.gray)
                            .font(.caption)
                        HStack(alignment:.bottom, spacing: 2) {
                            Text("pt")
                                .foregroundColor(.clear)
                                .font(.body)
                                .bold()
                            Text("\(score)")
                                .font(.title.bold())
                                .minimumScaleFactor(0.01)
                            Text("pt")
                                .bold()
                                .font(.body)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    
                    VStack {
                        Text(" ")
                            .font(.caption)
                        Text("\(lastResult.text)")
                            .frame(maxWidth: .infinity)
                            .foregroundColor(lastResult.color)
                            .font(.title.bold())
                    }
                }
                .frame(maxWidth: .infinity)
                .font(.title2)
                .foregroundColor(.white)

                Spacer()
                
                HStack(alignment: .bottom, spacing: 10) {
                    Text("\(appsMove.rawValue)")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .font(.system(size: 80))
                .frame(maxHeight: 100)
                .padding(16)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                HStack(spacing: 0) {
                    Text("You should ")
                        .font(.title.weight(.bold))
                    if shouldWin {
                        Text("WIN")
                            .foregroundColor(darkRed)
                            .font(.title.weight(.heavy))
                    } else {
                        Text("LOSE")
                            .foregroundColor(darkBlue)
                            .font(.title.weight(.heavy))
                    }
                    Text("!")
                        .font(.title.weight(.bold))
                }
                

                HStack(alignment: .bottom, spacing: 10) {
                    ForEach(Move.allCases, id: \.self) { move in
                        Button(move.rawValue) {
                            self.selectedMove = move
                            buttonTapped()
                        }
                        .frame(width: 90, height: 90)
                        .background(.regularMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                }
                .font(.system(size: 60))
                .frame(maxHeight: 100)
                .padding(16)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                Spacer()
            }
            .padding()
        }
        .alert("Finished!", isPresented: $shouldAlertResetGame) {
            Button("Restart Game") {
                resetGame()
            }
        }
    }
    
    func buttonTapped() {
        if shouldWin {
            if selectedMove == appsMove.winningCase {
                score += 5
                lastResult = .win
            } else {
                score -= 10
                lastResult = .lose
            }
        } else {
            if selectedMove == appsMove.losingCase {
                score += 5
                lastResult = .win
            } else {
                score -= 10
                lastResult = .lose
            }
        }
        
        askQuestion()
    }

    func askQuestion() {
        if round < maxRound {
            appsMove = Move.allCases.randomElement() ?? .rock
            shouldWin = Bool.random()
            round += 1
        } else {
            shouldAlertResetGame = true
        }
    }
    
    func resetGame() {
        score = 0
        round = 1
        appsMove = Move.allCases.randomElement() ?? .rock
        shouldWin = Bool.random()
        lastResult = RoundResult.none
        selectedMove = Move.rock
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

    
