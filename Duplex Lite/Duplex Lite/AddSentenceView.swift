//
//  AddSentenceView.swift
//  Duplex Lite
//
//  Created by Jaimin Raval on 11/05/21.
//

import SwiftUI

struct AddSentenceView: View {
    @Binding var cardSentence: String
    @Binding var CardEmoji: String
    @Binding var isAddButtonClicked: Bool
    
    @State private var inputSentence: String = ""
    @State private var inputEmoji: String = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            
            Text("Create New Sentence Here!")
                .bold()
                .font(.title2)
                .padding(.all,27)
            TextField("Add Text Here", text: $inputSentence)
                .padding()
                .font(.system(size: 22,
                              weight: .medium,
                              design: .default))
                .background(Color.gray)
                .foregroundColor(.white)
                .cornerRadius(10)
                .frame(width: 350, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            
            TextField("Add Emoji Here", text: $inputEmoji)
                .padding()
                .font(.system(size: 22,
                              weight: .medium,
                              design: .default))
                .background(Color.gray)
                .foregroundColor(.white)
                .cornerRadius(10)
                .frame(width: 350, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            
            Spacer()
            
            Button {
                isAddButtonClicked = true
                addSentence()
//                presentationMode.wrappedValue.dismiss()
            } label: {
                Label("Add", systemImage: "plus.circle.fill")
            }
            .frame(width: 280, height: 50)
            .font(.system(size: 24))
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(12)
            .padding()
            
            Spacer()
        }
    }
    
    func addSentence() {
        if inputSentence == "" || inputEmoji == ""
        || inputSentence == " " || inputEmoji == " " {

            print("please enter a proper sentence or emoji")
        } else {
            cardSentence = inputSentence
            CardEmoji = inputEmoji
            presentationMode.wrappedValue.dismiss()

        }
    }
    
}

struct AddSentenceView_Previews: PreviewProvider {
    static var previews: some View {
        AddSentenceView(cardSentence: .constant(""),
                        CardEmoji: .constant(""),
                        isAddButtonClicked: .constant(false))
    }
}
