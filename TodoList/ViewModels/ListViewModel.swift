//
//  ListViewModel.swift
//  TodoList
//
//  Created by Yomi on 3/9/23.
//

import Foundation

/*
 CRUD FUNCTIONS
 
 1. Create
 2. Read
 3. Update
 4. Delete
 */

class ListViewModel: ObservableObject{
    
    @Published var items: [ItemModel] = [] {
        
        //anytime there is a change called on the ItemModel, the 'didset' is called to save items
        didSet{
            saveItem()
        }
    }
    
    let itemsKey: String = "item_list"
    
    init(){
        getItems()
    }
    
    func getItems(){
        // get items that are stored in the UserDefault
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {
            return
        }
        
        self.items = savedItems
        
    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(text: String){
        let newItem = ItemModel(title: text, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel){
        if let index = items.firstIndex(where: { $0.id == item.id }){
            items[index] = item.updateModel()
        }
    }
    
    func saveItem(){
        if let encodedData = try? JSONEncoder().encode(items){              //ensure ItemModel conforms to Codable
            UserDefaults.standard.set(encodedData, forKey: itemsKey)        //convert the arrays to an encoded JSON
        }
    }
    
}
