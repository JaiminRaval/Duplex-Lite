//
//  HomeView.swift
//  Duplex Lite
//
//  Created by Jaimin Raval on 13/04/21.
//

import SwiftUI
import AVFoundation
import CallKit

struct cardSentence: Identifiable{
    var id = UUID()
    let sentence: String
    let emoji: String
    
}


struct HomeView: View {
    static let synthesizer = AVSpeechSynthesizer()
    
    @State private var voiceIsFemale:Bool = true
    @State private var textInputted: String = ""
    @State private var isShowingSheet = false
    
    @State private var addedSentence: String = ""
    @State private var addedEmoji: String = ""
    @State private var isAddButtonClicked: Bool = false
    
   @State var items:[cardSentence] = [
        cardSentence(sentence: "hi my name is jaimin!", emoji: "🤓"),
        cardSentence(sentence: "Hello & welcome to Duplex Lite!", emoji: "😊"),
        cardSentence(sentence: "fine, goodBye", emoji: ""),
        cardSentence(sentence: "hey, Good Morning!", emoji: "🙌🏼"),
        cardSentence(sentence: "okay, good night!", emoji: "🙃"),
        cardSentence(sentence: "hello There!", emoji: "😁"),
        cardSentence(sentence: "Hey pal!, it's Me!!!", emoji: "🤗"),
        cardSentence(sentence: "Hey, can we go out sometime?", emoji: "☺️"),
        cardSentence(sentence: "no, i don't want Cradit cards!", emoji: "🤨"),
        cardSentence(sentence: "An App that speaks in phone calls for you!", emoji: "🙈"),
        cardSentence(sentence: "you can create your own sentences!", emoji: "👀"),
        cardSentence(sentence: "Cool!", emoji: "🥶"),
    ]

    func addCustomLabels() {
        items.append(cardSentence(sentence: addedSentence,
                                  emoji: addedEmoji))
        print("\n\n\n Sentence = \(addedSentence) \n\nand emoji = \(addedEmoji)")
    }
    let layout = [
        GridItem(.adaptive(minimum: 150))
    ]
    var activePhoneCall = "No"
    
    var body: some View {
        NavigationView{
        ZStack{
                VStack{
                    Text("Active Phone Call: \(activePhoneCall)")
                        .font(.subheadline)
                        .foregroundColor(.red)
                    
                    TextField("Enter Text Here", text: $textInputted, onCommit: {
                        let inputText = textInputted
                        SpeakUp(T: inputText)
                        self.textInputted = ""
                    }).padding()
                    .font(.system(size: 22, weight: .medium, design: .default))
                    .background(Color.orange)
                    .foregroundColor(.black)
                    .cornerRadius(20)
                    .frame(width: 350, height: 100, alignment: .center)
                    
                    ScrollView{
                        LazyVGrid(columns: layout, content: {
                            ForEach(items) { i in
                                Label(
                                    title: { Text(i.sentence) },
                                    icon: { Text(i.emoji) }
                                )
                                .font(.system(size: 24, weight: .bold, design: .default))
                                .padding()
                                .background(Color.orange)
                                .cornerRadius(19)
                                .onTapGesture {
                                    let input = i.sentence
                                    SpeakUp(T: input)
                                }
                            }
                        })
                    }.font(.largeTitle)
                }
                
            }
        .navigationTitle("All Sentences")
        .accentColor(.green)
        .toolbar{
            ToolbarItemGroup(placement: .navigationBarTrailing){
                Button{
                    isShowingSheet = true
                }label:{
                    Label("Add Sentence", systemImage:"plus")
                }
            }
        }
        .sheet(isPresented: $isShowingSheet,
               onDismiss: {
                if isAddButtonClicked == true {
                    addCustomLabels()
                }
               },
               content: {
            AddSentenceView(cardSentence: $addedSentence,
                            CardEmoji: $addedEmoji,
                            isAddButtonClicked:$isAddButtonClicked)
        })
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


//struct ButtonView: View{
//    @Binding var textInputed: String
//    var s = ""
//    var body: some View{
//
//    }
//}

func SpeakUp(T: String){
    
    let utterance = AVSpeechUtterance(string: T)
    
//    modifying speed and other property of utterance
    utterance.rate = 0.40
    utterance.volume = 0.9
//    utterance.preUtteranceDelay = 0.3
    utterance.postUtteranceDelay = 0.3

//    selecting voice language
    let voice = AVSpeechSynthesisVoice(language: "en-US")
    
//    setting it
    utterance.voice=voice
//    creating an instance of speech Synthesizer
    
//    starting speech
    HomeView.synthesizer.speak(utterance)
    HomeView.synthesizer.mixToTelephonyUplink = true
}


func isOnPhoneCall() -> Bool {
    for call in CXCallObserver().calls{
        if call.hasEnded == false{
            return true
        }
    }
    return false
}

func ifOnPhoneCall() {
    if isOnPhoneCall() == true {
        
    
    }
}


//func currentVoceGenderSelected(on selected: gender) {
//    print(selected.rawValue)
//}
