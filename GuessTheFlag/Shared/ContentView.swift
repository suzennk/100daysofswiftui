//
//  ContentView.swift
//  Shared
//
//  Created by Susan Kim on 2021/12/13.
//

import SwiftUI

struct FlagImage: View {
    var country: String
    
    var body: some View {
        Image(country)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}

struct ContentView: View {
    @State private var round = 1
    @State private var score = 0
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var scoreMessage = ""
    
    @State private var showingReset = false
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var selectedCountry = ""
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            selectedCountry = countries[number]
                            flagTapped(number)
                        } label: {
                            FlagImage(country: countries[number])
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                VStack(spacing: 8) {
                    Text("Round: \(round) / 8")
                        .foregroundColor(.white)
                        .font(.headline.bold())
                    Text("Score: \(score)")
                        .foregroundColor(.white)
                        .font(.title.bold())
                }
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text(scoreMessage)
        }
        .alert("Finished!", isPresented: $showingReset) {
            Button("Reset game", role: .destructive, action: resetGame)
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
            scoreMessage =
                """
                Score: \(score)
                """
        } else {
            scoreTitle = "Wrong"
            scoreMessage =
                """
                That's the flag of \(selectedCountry)
                Score: \(score)
                """
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        if round < 8 {
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
            round += 1
        } else {
            showingReset = true
        }
    }
    
    func resetGame() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        round = 1
        score = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
