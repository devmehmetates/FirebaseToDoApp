//
//  GetItem.swift
//  FirebaseToDoApp
//
//  Created by Mehmet Ateş on 10.10.2021.
//

import Foundation
import Firebase
class GetItem : ObservableObject{
    @Published var data =  [ToDoItem]()
    @Published var noData = false
    
    func complateTask(docID : String , isComp : Bool){
        let db = Firestore.firestore()
        if docID != ""{
            db.collection("list").document(docID).updateData(["isComp":isComp]) {
                (err) in print("Hata")
            }
        }
    }
    init(){
        let db = Firestore.firestore()
        db.collection("list").addSnapshotListener { snap, err in
            if err != nil {
                print("Hata")
                self.noData = true
                return
            }
            if (snap?.documentChanges.isEmpty)!{
                self.noData = true
                return
            }
            
            for i in snap!.documentChanges{
                if i.type == .added{
                    let id = i.document.documentID
                    let title = i.document.get("title") as! String
                    let desc = i.document.get("desc") as! String
                    let image = i.document.get("image") as! String
                    let isComp = i.document.get("isComp") as! Bool
                    let ticket = i.document.get("ticket") as! String
                    
                    self.data.append(ToDoItem(id:id,title: title, desc: desc, image: image, isComp: isComp, ticket: Int(ticket) ?? 0 ))
                }
                if i.type == .modified{
                    let id = i.document.documentID
                    let isComp = i.document.get("isComp") as! Bool
                    
                    for i in 0..<self.data.count{
                        if self.data[i].id == id{
                            self.data[i].isComp = isComp
                        }
                    }
                }
                if i.type == .removed{
                    let id = i.document.documentID
                    
                    for i in 0..<self.data.count{
                        if self.data[i].id == id{
                            self.data.remove(at: i)
                        }
                    }
                }
            }
            
            
        }
        
    }
}

