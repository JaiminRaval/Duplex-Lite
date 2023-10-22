//
//  SettingsView.swift
//  Duplex Lite
//
//  Created by Jaimin Raval on 13/04/21.
//

import SwiftUI

//enum gender: String, CaseIterable, Identifiable {
//    case Female = "com.apple.ttsbundle.Samantha-compact"
//    case Male   = "com.apple.ttsbundle.siri_male_en-US_compact"
//
//    var id: String{
//        self.rawValue
//
//    }
//}

//class VoiceGender: ObservableObject {
//    @Published var gender: String = "female"
//}


struct SettingsView: View {
//    @Binding var voiceGender: Bool
    @EnvironmentObject var voices: Voices
    @State var selectedGender: String = "female"
    @State var selectedLanguage: String = "en-US"
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    Form{
                        Section(header: Text("Core Settings")){
                            Picker(selection: $selectedGender, label: Text("Gender"), content: {
                                Text("female").tag("female")
                                Text("male").tag("male")
                                    
                            })
                            
//                            Picker(selection: $selectedLanguage, label: Text("Language"), content: {
//                                pickerItems(name: "English 🇺🇸",
//                                            tagName: "en-US")
//                                pickerItems(name: "Hindi 🇮🇳",
//                                            tagName: "hi-IN")
//                            })
                        }
                
                    }
                }
//                .onDisappear{
//                    self.currentGender.gender = self.selectedGender
//                }
            }
            .navigationTitle("Settings")
            
        }
    }
//    func voiceGendedChanged() {
//        if selectedGender == "male"{
//            currentGender.gender = "male"
//        } else {
//            currentGender.gender = "female"
//        }
//     }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}


struct pickerItems: View {
    @State var name: String
    @State var tagName: String
    
    var body: some View {
        Text(name)
            .tag(tagName)
            .font(.system(size: 20,
                          weight: .bold,
                          design: .monospaced))
            .padding()
        
    }
}


