//
//  ContentView.swift
//  TrafficLightsSUI
//
//  Created by Владимир Киселев on 28.04.2022.
//

import SwiftUI

enum LightsState {
    case red, yellow, green
}

struct ContentView: View {
    @State private var buttonStart = "START"
    @State private var currentLight = LightsState.red

    
    private func switchingLights() {
        
        switch currentLight {
        case .red:
            currentLight = .yellow
        case .yellow:
            currentLight = .green
        case .green:
            currentLight = .red
        }
    }
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 20){
                ColorCircle(color: .red, opacity: currentLight == .red ? 1 : 0.3)
                ColorCircle(color: .yellow, opacity: currentLight == .yellow ? 1 : 0.3)
                ColorCircle(color: .green, opacity: currentLight == .green ? 1 : 0.3)
                
                Spacer()
                
                ChangeColorButton(title: buttonStart) {
                    if buttonStart == "START" {
                        buttonStart = "NEXT"
                    }
                    switchingLights()
                }
            }
        }
    }
    

    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
