//
//  ItemDetailPage.swift
//  FirebaseToDoApp
//
//  Created by Mehmet Ateş on 10.10.2021.
//

import SwiftUI

struct ItemDetailPage: View {
    @State var object : ToDoItem
    @State var isComp = false
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        ScrollView{
            AsyncImage(url: URL(string: self.object.image)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 150, height: 150)
            .clipShape(Circle())
            .shadow(radius: 7)
            .overlay(Circle().stroke(colorScheme == .dark ? .white : .black,lineWidth: 2))
            
            Text(self.object.title)
                .font(.largeTitle)
                .bold()
            
            
            VStack(alignment:.leading,spacing: 20){
                HStack {
                    Text("Subject :")
                        .font(.title)
                        .bold()
                    HStack {
                        Text(ticketSubjects[self.object.ticket])
                            .font(.footnote)
                        Image(systemName: ticketIcons[self.object.ticket])
                    }.padding(.all,10)
                        .background(ticketColors[self.object.ticket])
                        .cornerRadius(30)
                }
                ExDivider(color: ticketColors[self.object.ticket])
                Text(self.object.desc)
            }.padding()
            
            VStack(alignment:.leading,spacing: 7) {
                Text("State")
                    .font(.title)
                    .bold()
                
                ExDivider(color: ticketColors[self.object.ticket])
                Text(self.object.isComp ? "Complated" : "Not Complated")
                    .foregroundColor(self.object.isComp ? .green : .red)
                    .padding(.all,5)
                    .overlay(
                        Capsule(style: .continuous)
                            .stroke(self.object.isComp ? .green : .red))
                    
                
                
            }.padding(.horizontal)
            
            
        }
    }
}

struct ExDivider: View {
    let color: Color
    let width: CGFloat = 2
    var body: some View {
        Rectangle()
            .fill(color)
            .frame(height: width)
            .edgesIgnoringSafeArea(.horizontal)
    }
}
