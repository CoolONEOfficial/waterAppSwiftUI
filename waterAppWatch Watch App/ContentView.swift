//
//  ContentView.swift
//  waterAppWatch Watch App
//
//  Created by Nikolay Truhin on 23/12/22.
//

import SwiftUI

private enum Constants {
    static let target: Float = 3000
}

struct ContentView: View {
    private let screen = WKInterfaceDevice.current().screenBounds
    
    @State
    private var value: Float = 0
    
    private var scale: Float {
        value / Constants.target
    }
    
    var body: some View {
        ZStack {
            text.foregroundColor(.init(.textColor))
            
            ZStack {
                Color(.secondaryColor)
                text.foregroundColor(.white)
            }
            .mask(alignment: .bottom) {
                Rectangle().frame(height: screen.height * CGFloat(scale))
            }
            
            VStack {
                Spacer()
                Button("+ 250 ml") {
                    withAnimation {
                        value += 250
                    }
                }
                .disabled(value >= Constants.target)
                .buttonStyle(.borderedProminent)
                .tint(.init(.primaryColor))
                .padding(6)
            }
        }
        .ignoresSafeArea()
    }
    
    private var text: some View {
        VStack {
            Text("Осталось:\n\(Int(Constants.target - value)) ml\nВыпито:\n\(Int(value)) ml")
            Spacer()
        }
        .multilineTextAlignment(.center)
        .fontWeight(.bold)
        .font(.system(size: 22))
        .padding(.top, 22)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension UIColor {
    static let textColor = UIColor(red: 0.008, green: 0.467, blue: 0.741, alpha: 1)
    static let secondaryColor = UIColor(red: 0.557, green: 0.831, blue: 0.969, alpha: 1)
    static let primaryColor = UIColor(red: 0.012, green: 0.663, blue: 0.957, alpha: 1)
}
