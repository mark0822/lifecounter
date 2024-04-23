//
//  ContentView.swift
//  lifecounter
//
//  Created by Mark on 4/17/24.
//

import SwiftUI

struct playerControl: View {
    let playerNum: Int
    let healthNum: Int
    @State var loseMessage: String = ""
    @State var count = 20
    @Binding var historyList: [String]
    @Binding var gameStarted: Bool

    
    var body: some View {
        VStack{
            Text("Player \(playerNum)")
            HStack {
                Button(action: {
                    self.count -= healthNum
                    gameStarted = true
                    historyList.append("Player \(playerNum) Lost \(healthNum) Life")
                    if self.count <= 0 {
                        self.loseMessage = "Player \(playerNum) LOSES!"
                    }
                }, label: {
                    Text("-\(healthNum)")
                })
                Button(action: {
                    count -= 1
                    gameStarted = true
                    historyList.append("Player \(playerNum) Lost 1 Life")
                    if self.count <= 0 {
                        self.loseMessage = "Player \(playerNum) LOSES!"
                    }
                }, label: {
                    Text("-1")
                })
                Text(String(count))
                Button(action: {count+=1
                    gameStarted = true
                    historyList.append("Player \(playerNum) Gain 1 Life")
                }) {
                    Text("+1")
                }
                Button(action: {
                    count += healthNum
                    gameStarted = true
                    historyList.append("Player \(playerNum) Gain \(healthNum) Life")
                }, label: {
                    Text("+\(healthNum)")
                })
            }
            .padding(3)
            Text(loseMessage).background(Color.red)
        }
    }
}

struct ContentView: View {
    @State var healthNum = "5"
    @State var playerNum = 4
    @State var historyList = [String]()
    @State var gameStarted = false
    
    var body: some View {
        Text("Modify Health Gain or Loss").multilineTextAlignment(.center)
        TextField("health input", text: $healthNum, prompt: Text("health")).multilineTextAlignment(.center).textFieldStyle(RoundedBorderTextFieldStyle())
        VStack {
            ForEach(0 ..< playerNum, id: \.self) { index in
                playerControl(playerNum: index+1, healthNum: Int(self.healthNum) ?? 5, historyList: $historyList, gameStarted: $gameStarted)
            }
        }
        Button(action: {
            self.playerNum += 1
        }) {
            Text("add player")
        }.disabled(gameStarted)
        Button(action: {
            self.playerNum -= 1
        }) {
            Text("remove player")
        }.disabled(gameStarted)
        NavigationView {
            NavigationLink("History", destination: ScrollView{
                VStack(alignment: .leading) {
                    ForEach(historyList, id: \.self) {HistoryString in
                        Text(HistoryString)
                    }
                }
            }
        )}
    }
}



#Preview {
    ContentView()
}
