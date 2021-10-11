//
//  SetItem.swift
//  FirebaseToDoApp
//
//  Created by Mehmet Ateş on 11.10.2021.
//

import Foundation
import Firebase

class SetItem{
    func uploadItem(title : String , desc : String , isComp : Bool , image : String , ticket : String){
        let db = Firestore.firestore()
        db.collection("list").document().setData(["title":title , "desc" :desc , "isComp" : isComp , "image" : image , "ticket" : ticket])

    }
}
