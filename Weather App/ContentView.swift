//
//  ContentView.swift
//  Weather App
//
//  Created by Alex Farran on 02/04/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(topColour: isNight ? .black : .blue,
                           bottomColour: isNight ? .gray : Color("LightBlue"))
            VStack{
                CityNameView(city: "London")
                
                MainWetherSatusView(imageName: isNight ? "cloud.moon.rain.fill": "cloud.sun.fill",
                                    temperature: isNight ? 5 : 30)
                HStack (spacing: 20){
                    WeatherDayView(dayOfWeek: "MON",
                                   imageName: isNight ? "cloud.moon.rain.fill": "cloud.sun.fill",
                                   temperature: isNight ? 5 : 30)
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: isNight ? "cloud.moon.fill" : "sun.rain.fill",
                                   temperature: isNight ? 1 : 13)
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: isNight ? "moon.fill" : "sun.max.fill",
                                   temperature: isNight ? 2 : 35)
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: isNight ? "cloud.moon.fill" :"cloud.sun.bolt.fill",
                                   temperature: isNight ? 2 : 19)
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: isNight ? "cloud.moon.bolt.fill" :  "cloud.sun.rain.fill",
                                   temperature: isNight ? 1 : 14)
                }
                Spacer()
                
                Button{
                    isNight.toggle()
                } label: {
                    WeatherButtom(title: isNight ? "Change Night Time" : "Change Day Time",
                                  textColour: isNight ? .black : .blue,
                                  backGroundColour: Color.white)
                }
                Spacer()
            }
            
        }
        }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int

    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40 , height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    var topColour: Color
    var bottomColour: Color
    
    var body: some View
    {
        
        LinearGradient(gradient: Gradient(colors: [topColour, bottomColour]), startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CityNameView: View {
    var city: String
    
    var body: some View {
        Text(city)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWetherSatusView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

