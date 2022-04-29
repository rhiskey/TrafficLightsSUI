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
    @State private var redState = 0.3
    @State private var yellowState = 0.3
    @State private var greenState = 0.3
    
    private func switchingLights() {
        let isOn = 1.0
        let isOff = 0.3
        
        switch currentLight {
        case .red:
            greenState = isOff
            redState = isOn
            currentLight = .yellow
        case .yellow:
            redState = isOff
            yellowState = isOn
            currentLight = .green
        case .green:
            yellowState = isOff
            greenState = isOn
            currentLight = .red
        }
    }
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 20){
                ColorCircle(color: .red, opacity: redState)
                ColorCircle(color: .yellow, opacity: yellowState)
                ColorCircle(color: .green, opacity: greenState)
                
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
