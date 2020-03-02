//
//  ContentView.swift
//  SwiftUI-Timer
//
//  Created by Eric Dolecki on 3/2/20.
//  Copyright © 2020 Eric Dolecki. All rights reserved.
//

import SwiftUI

struct ContentView: View
{
    @State private var currentDate = Date()
    let t = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Text("\(self.formatTime(date: self.currentDate))")
            .font(.custom("Helvetica Neue", size: 25))
            .onReceive(t) { input in
                self.currentDate = input
            }
    }
    
    func formatTime(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH.mm.ss.SS"
        return formatter.string(from: date)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
