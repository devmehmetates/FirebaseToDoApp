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
let ticketImage = ["https://i.pinimg.com/originals/7b/ec/b2/7becb26c4f23336ebd2c8a52237c1364.jpg" , "https://i.pinimg.com/originals/1f/5a/2a/1f5a2ae53ad9cc5c4051d34b79b12321.jpg","https://p.favim.com/orig/2018/08/15/game-aesthetic-vhs-Favim.com-6188626.jpg","https://i.pinimg.com/originals/25/fc/ea/25fcea976f117fbb8185b242391a349d.jpg", "https://i.pinimg.com/originals/7e/f3/fa/7ef3fa6144c1ff1a0a0127c7e95667cd.jpg" ,"https://i.pinimg.com/474x/93/c8/6a/93c86a32cb59cc58e73778823088c447.jpg"]
