//
//  TodoListApp.swift
//  TodoList
//
//  Created by Yomi on 3/8/23.
//

import SwiftUI

@main
struct TodoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(ListViewModel())
            
        }
    }
}
