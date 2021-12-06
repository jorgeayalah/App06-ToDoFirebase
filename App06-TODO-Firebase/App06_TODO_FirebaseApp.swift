//
//  App06_TODO_FirebaseApp.swift
//  App06-TODO-Firebase
//
//  Created by alumno on 04/12/21.
//

import SwiftUI
import Firebase

@main
struct App06_TODO_FirebaseApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            TaskListView()
        }
    }
}
