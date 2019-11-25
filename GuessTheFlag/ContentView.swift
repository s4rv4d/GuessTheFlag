//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Sarvad shetty on 11/22/19.
//  Copyright © 2019 Sarvad shetty. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    
    @State private var countries = ["Estonia","France","Germany","Ireland","Italy","Nigeria","Poland","Russia","Spain","UK","US"].shuffled()
    @State private var score = 0
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    var body: some View {
        
        ZStack {
//            Color.blue.edgesIgnoringSafeArea(.all)
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                ForEach(0 ..< 3) { number in
                    Button(action:{
                        //flag was tapped
                        self.flagTapped(number)
                    }) {
                        Image(self.countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.black, lineWidth:1))
                            .shadow(color: .black, radius: 2)
                    }
                }
                Text("Score: \(score)")
                    .foregroundColor(.white)
                Spacer()
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Your score is \(score)"), dismissButton: .default(Text("Continue")){
                self.askQuestion()
                })
        }
    }
    
    func flagTapped(_ number:Int) {
        if number ==  correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong! That's the flag of \(countries[number])"
        }
        //present alert when true
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffled()
        correctAnswer = Int.random(in: 0 ... 2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



//        Button("Show alert") {
//            self.showingAlert = true
//        }
//        .alert(isPresented: $showingAlert) { () -> Alert in
//            Alert(title: Text("Sample alert"), message: Text("this is some detailed message"), dismissButton: .default(Text("Dismiss")))
//        }
//        Button("Tap me") {
//            print("button was tapped")
//        }
        
//        Button(action: {
//            print("button was tapped")
//        }) {
//            HStack(spacing: 10) {
//                Image(systemName: "pencil")
//                    .renderingMode(.original)
//                Text("Edit")
//            }
//        }
        
//        ZStack {
//            Color.red.frame(width: 200, height: 200)
//            Color.red.edgesIgnoringSafeArea(.all)
//            Text("Some random text")
//                .background(Color.red)
//            LinearGradient(gradient: Gradient(colors: [.red, .blue]), startPoint: .top, endPoint: .bottom)
//            RadialGradient(gradient: Gradient(colors: [.red, .black]), center: .center, startRadius: 20, endRadius: 200)
//            AngularGradient(gradient: Gradient(colors: [.red, .blue, .black, .green]), center: .center)
//        }
//        .background(Color.red)
