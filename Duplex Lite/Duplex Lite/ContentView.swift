//
//  ContentView.swift
//  Duplex Lite
//
//  Created by Jaimin Raval on 13/04/21.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
 
    var voices = Voices()
    
    var body: some View {
        TabView{
            HomeView()
            .tabItem { Image(systemName: "house.fill")
                Text("Home")
            }
            SettingsView()
                .tabItem { Image(systemName: "gearshape.fill")
                    Text("Settings")
                }
        }
        .accentColor(.orange)
        .environmentObject(voices)
            
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
