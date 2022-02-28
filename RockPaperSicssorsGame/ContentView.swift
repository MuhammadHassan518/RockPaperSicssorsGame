//
//  ContentView.swift
//  RockPaperSicssorsGame
//
//  Created by muhammad hassan on 12/12/2021.
//


import SwiftUI

struct ContentView: View {
   @State var Moves = ["Paper", "Rock", "Scissors"]
    @State var correctAnswer = Int.random(in: 0..<3)
    @State var Score: Int = 0
    @State var scoreTitle = ""
    @State var showingScore = false
    @State var showingScore2 = false
    @State var showingScore3 = false
    @State var showingScore4 = false
    @State var negScore = 0
    @State var count = 0
    @State var newScore = 0
    @State var newNegScore = 0
    @State var newcount = 0
    @State var ishidden = true
    
    var body: some View {
        ZStack{
            
            RadialGradient(stops: [
                .init(color: .init(red: 0.34, green: 0.34, blue: 0.56), location: 0.3),
                .init(color: .init(red: 0.3, green: 0.23, blue: 0.43), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 700)
            
        VStack()
        {
            Spacer()
            Spacer()
            Spacer()
            Spacer()

            VStack
            {
            Text("Guess the Next Move")
                    //.background(.white)
                    .foregroundColor(.white)
                if !ishidden
                {
                Text(Moves[correctAnswer])
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .clipped()
                }
            }
            Toggle("", isOn: $ishidden)
            VStack(spacing:10)
            {
            ForEach(0..<3)
            { number in
                Button
                {   // image clicked
                    flagTapped(number)
                }
            label: {
                Image(Moves[number])
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Capsule())
                    .shadow(radius: 3)
                    }
            }
          }
            Text("your Score is \(Score)")
                .foregroundColor(.white)
            Spacer()
            Spacer()

    }
       
        }.alert("your answer is ", isPresented: $showingScore)
        {
             Button("Continue", action: askQuestion)
        }
            message:
                    {
                    Text(" \(scoreTitle) ")
                    }
            
            .alert("your answer is ", isPresented: $showingScore2)
            {
                 Button("Re-Start", action: askQuestion)
            }
                message:
                   {
                    Text("\(scoreTitle) Right Answer = \(newScore) and wrong answer = \(newNegScore)   Game Over")
                   }
                   .alert("Congrate You win ", isPresented: $showingScore3)
                   {
                        Button("Re-Start", action: askQuestion)
                   }
                       message:
                          {
                           Text("You win hardly")
                          }
                          .alert("Congrate You win ", isPresented: $showingScore4)
                          {
                               Button("Re-Start", action: askQuestion)
                          }
                              message:
                                 {
                                  Text("You win with High score")
                                 }
        
    }
    func newfun()
    {
        Score.self = 0
        negScore.self = 0
        count.self = 0
    }

    func flagTapped(_ number: Int)
    {

            count += 1
        if count == 10
        {
             newScore = Score
             newNegScore = negScore
             newcount = count
             newfun()
            
            if newScore > 5 && newScore <= 8
            {
                showingScore3 = true
            }
            if newScore > 8
            {
                showingScore4 = true
            }
            else
            {
                showingScore2 = true
            }
        
                }
        else {
        if number == correctAnswer
            {
            scoreTitle = "Correct"
            Score += 1
            showingScore = true
            }
            else
            {
            scoreTitle = "Wrong"
            negScore += 1
            Score -= 1
            showingScore = true
            }
        }
    }

   
    func askQuestion()
       {
           Moves.shuffle()
        correctAnswer = Int.random(in: 0...2)
       }

}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
