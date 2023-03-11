//
//  ListView.swift
//  TodoList
//
//  Created by Yomi on 3/8/23.
//

/*
 Using the MVVM methodology
 M - Model          //techniques that handles operationality
 V - View           //UI
 VM - ViewModel     
 */

import SwiftUI

struct ListView: View {
    
    //reference the ListViewModel in the view so as to use all functions in the class
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack{
            if listViewModel.items.isEmpty {
                NoItemView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            }else{
                List{
                    ForEach(listViewModel.items) { item in
                        ListViewItem(item: item)
                            .onTapGesture {
                                withAnimation(.linear){
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
            }
            
        }
        .navigationTitle("Todo List 📂")
        .navigationBarItems(
            leading: EditButton()
                .foregroundColor(Color.blue),
            trailing: NavigationLink(destination: {
                AddView()
            }, label: {
                HStack{
                    Image(systemName: "plus.circle")
                    Text("Add")
                }
            })
            .foregroundColor(Color.blue)
        )
        
            
    }
    
}



struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .navigationViewStyle(StackNavigationViewStyle())        // to adjust for iPad view
        //add line to prevent preview from crashing
        .environmentObject(ListViewModel())
    }
}
