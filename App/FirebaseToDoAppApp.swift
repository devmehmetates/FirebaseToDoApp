//
//  FirebaseToDoAppApp.swift
//  FirebaseToDoApp
//
//  Created by Mehmet Ateş on 10.10.2021.
//

import SwiftUI
import Firebase

@main
struct FirebaseToDoAppApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


