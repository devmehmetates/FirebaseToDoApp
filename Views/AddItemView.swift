//
//  AddItemView.swift
//  FirebaseToDoApp
//
//  Created by Mehmet Ateş on 11.10.2021.
//

import SwiftUI

struct AddItemView: View {
    var setter = SetItem()
    @Binding var isShow : Bool
    @State var addTitle = ""
    @State var addDesc = "Enter Description Here..."
    @State var ticketPick = 0
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: ticketImage[self.ticketPick])) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 150, height: 150)
            .clipShape(Circle())
            .shadow(radius: 7)
            .overlay(Circle().stroke(ticketColors[self.ticketPick],lineWidth: 2))
            .onTapGesture {
                self.addTitle = ticketSubjects[ticketPick]
            }
            
            TextField("Enter Title", text: self.$addTitle)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            VStack(alignment:.leading,spacing: 20){
                HStack {
                    Text("Subject :")
                        .font(.title)
                        .bold()
                    VStack {
                        Picker("Please choose a subject", selection: self.$ticketPick) {
                            ForEach(0..<ticketSubjects.count) { i in
                                HStack {
                                    Text(ticketSubjects[i])
                                    Image(systemName: ticketIcons[i])
                                }.tag(i)
                            }
                        }.padding(.all,10)
                            .colorMultiply(.black).colorInvert()
                            .background(ticketColors[self.ticketPick])
                            .cornerRadius(30)
                    }
   
                }
                ExDivider(color: ticketColors[self.ticketPick])

                TextEditor(text: self.$addDesc)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: UIScreen.main.bounds.height * 0.3)
                    .padding()
                    .onTapGesture {
                        if (self.addDesc == "Enter Description Here..."){
                            self.addDesc = ""
                        }
                    }
                ExDivider(color: ticketColors[self.ticketPick])
            }.padding()
                .padding(.horizontal)
            Spacer()
            Button {
                self.setter.uploadItem(title: self.addTitle, desc: self.addDesc, isComp: false, image: ticketImage[self.ticketPick], ticket: String(self.ticketPick))
                isShow.toggle()
            } label: {
                Text("Save")
                    .padding()
                    .foregroundColor(Color.white)
                    .frame(width: UIScreen.main.bounds.width * 0.8)
            }.background(ticketColors[ticketPick])
                .clipShape(Capsule())

            Spacer()
        }
    }
}
