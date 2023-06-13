//
//  ContentView.swift
//  ColorizedView
//
//  Created by Юлия Ястребова on 13.06.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)
    
    var body: some View {
        ZStack {
            Color(.black)
                .opacity(0.3)
                .ignoresSafeArea()
            VStack {
                Rectangle()
                    .frame(height: 120)
                    .foregroundColor(
                        Color(
                            red: redSliderValue/255,
                            green: greenSliderValue/255,
                            blue: blueSliderValue/255))
                    .cornerRadius(20)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 3))
                    .padding(.bottom, 40)
                
                ColorSliderView(value: $redSliderValue, accentColor: .red)
                ColorSliderView(value: $greenSliderValue, accentColor: .green)
                ColorSliderView(value: $blueSliderValue, accentColor: .blue)
                
                Spacer()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ColorSliderView: View {
    @Binding var value: Double
    var accentColor: Color
    
    var body: some View {
        HStack {
            Text("\(lround(value))")
                .foregroundColor(.white)
                .font(.title)
    
            Slider(value: $value, in: 0...255, step: 1)
                .accentColor(accentColor)
        }
    }
}
