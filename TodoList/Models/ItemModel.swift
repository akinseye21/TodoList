//
//  ItemModel.swift
//  TodoList
//
//  Created by Yomi on 3/8/23.
//

import Foundation


//conform to identifiable and codable
struct ItemModel: Identifiable, Codable{
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateModel() -> ItemModel{
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
