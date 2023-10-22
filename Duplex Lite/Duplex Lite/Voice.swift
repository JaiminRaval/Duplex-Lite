//
//  Voice.swift
//  Duplex Lite
//
//  Created by Jaimin Raval on 26/06/21.
//

import SwiftUI

class Voice: Identifiable, Codable {
    var id = UUID()
    var voiceGender = "female"
    
}

class Voices: ObservableObject {
    @Published var currentVoice: [Voice]
    
    init(){
        self.currentVoice = []
    }
}
