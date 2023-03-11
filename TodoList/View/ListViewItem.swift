//
//  ListViewItem.swift
//  TodoList
//
//  Created by Yomi on 3/8/23.
//

import SwiftUI

// one view for the list item
struct ListViewItem: View {
    
    let item: ItemModel
    
    var body: some View {
        
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? Color.green : Color.red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ListViewItem_Previews: PreviewProvider {
    
    static var item2 = ItemModel(title: "item 2", isCompleted: true)
    
    static var previews: some View {
        NavigationView {
            Group{
                ListViewItem(item: item2)
            }
            .previewLayout(.sizeThatFits)
        }
        
    }
}
