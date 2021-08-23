//
//  ContentView.swift
//  iWeather
//
//  Created by Sendo Tjiam on 23/08/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityTextView(cityName: "Medan, North Asgard")
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill":"cloud.sun.fill", temperature: 25)
                Spacer()
                HStack(spacing: 26) {
                    WeatherDayView(dayOfWeek: "MON", imageName: "cloud.sun.fill", temperature: 28.0)
                    WeatherDayView(dayOfWeek: "TUE", imageName: "sun.max.fill", temperature: 32.0)
                    WeatherDayView(dayOfWeek: "WED", imageName: "cloud.rain.fill", temperature: 20.0)
                    WeatherDayView(dayOfWeek: "THU", imageName: "sun.haze.fill", temperature: 24.0)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "cloud.sun.bolt.fill", temperature: 19.0)
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: Color.white)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek : String
    var imageName : String
    var temperature : Double
    
    var temperatureString : String {
        return String(format: "%.0f", temperature)
    }
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperatureString)°")
                .font(.system(size: 30, weight: .semibold))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight : Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,
                                                   isNight ? .gray : Color("lightBlue")]), startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea(.all)
    }
}

struct CityTextView : View {
    var cityName : String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
    
}

struct MainWeatherStatusView : View {
    var imageName : String
    var temperature : Double
    
    var temperatureString : String {
        return String(format: "%.0f", temperature)
    }
    var body : some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperatureString)°C")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
                .padding()
        }
    }
}

