//
//  TodoModel.swift
//  FirebaseToDoApp
//
//  Created by Mehmet Ateş on 10.10.2021.
//

import Foundation
import SwiftUI
struct ToDoItem : Identifiable{
    var id : String
    var title : String
    var desc : String
    var image : String
    var isComp : Bool
    var ticket : Int
    
}

let ticketSubjects = ["Homework" , "Programming Lang." , "Gaming" , "Dating" , "Music" , "Sport"]
let ticketColors = [Color.red , Color.orange , Color.blue , Color.pink , Color.green , Color.indigo]
let ticketIcons = ["book.fill" , "app.badge.fill" , "gamecontroller.fill" , "heart.fill" , "guitars" , "sportscourt.fill"]

