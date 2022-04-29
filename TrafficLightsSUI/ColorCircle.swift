//
//  ColorCircle.swift
//  TrafficLightsSUI
//
//  Created by Владимир Киселев on 28.04.2022.
//

import SwiftUI

struct ColorCircle: View {
    let color: Color
    let opacity: Double
    
    var body: some View {
        Circle()
            .foregroundColor(color).opacity(opacity)
            .frame(width: 125, height: 125)
            .overlay(Circle().stroke(Color.white, lineWidth: 6))
    }
}

struct ColorCircle_Previews: PreviewProvider {
    static var previews: some View {
        ColorCircle(color: .red, opacity: 1.0)
    }
}
