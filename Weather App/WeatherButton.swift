//
//  WeatherButton.swift
//  Weather App
//
//  Created by Alex Farran on 04/04/2024.
//

import SwiftUI

struct WeatherButtom: View {
    var title: String
    var textColour: Color
    var backGroundColour: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backGroundColour)
            .foregroundColor(textColour)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}

