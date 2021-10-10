//
//  HomeView.swift
//  FirebaseToDoApp
//
//  Created by Mehmet Ateş on 10.10.2021.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var Items = GetItem()
    @State var show = false
    var body: some View{
        ZStack(alignment: .bottomTrailing) {
            NavigationView{
                Group{
                    if self.Items.data.isEmpty{
                        if self.Items.noData{
                            Text("No Data")
                        }
                        else{
                            ProgressView()
                        }
                    }
                    else{
                        List{
                            ForEach(self.Items.data){
                                toDoitem in HStack{
                                    Button {
                                        self.Items.complateTask(docID: toDoitem.id, isComp:!toDoitem.isComp)
                                    } label: {
                                        Image(systemName: toDoitem.isComp ?"checkmark.square" : "square")
                                            .foregroundColor(toDoitem.isComp ? Color.green : Color.red)
                                    }.buttonStyle(PlainButtonStyle())
                                    HStack{
                                        Text(toDoitem.title)
                                        Image(systemName: ticketIcons[toDoitem.ticket])
                                            .foregroundColor(ticketColors[toDoitem.ticket])
                                    }
                                    Spacer()
                                    NavigationLink(destination: ItemDetailPage(object: toDoitem)) {
                                        
                                    }
                                }
                                
                            }
                        }
                    }
                }
                .navigationTitle("To Do List")
            }
            Button {
            } label: {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                    .padding(.all)
                    .padding(.trailing ,25)
            }
        }
       
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
