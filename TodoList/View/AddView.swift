//
//  AddView.swift
//  TodoList
//
//  Created by Yomi on 3/8/23.
//

import SwiftUI

struct AddView: View {
    //use this line of code to go back on press on a button to the previous screen
    @Environment(\.presentationMode) var presentationMode
    //referencing the ListViewModel so that all the functions in the class can be used
    @EnvironmentObject var listViewModel: ListViewModel
    @State var addedItem: String = ""
    
    //for alert when the entry is less than 3 characters
    @State var alertTitle: String = ""
    @State var alertShow: Bool = false
    
    var body: some View {
        VStack{
            TextField("Add an item here...", text: $addedItem)
                .padding()
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.horizontal)
            Button {
                //check if entry is appropriate
                if isTextFieldAppropriate(){
                    listViewModel.addItem(text: addedItem)
                    //go back to the previous screen
                    presentationMode.wrappedValue.dismiss()
                }
                
                
            } label: {
                Text("SAVE")
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .foregroundColor(.white)
            }

            Spacer()
        }
        .navigationTitle("Add an item")
        .alert(isPresented: $alertShow) {
            showAlert()
        }
    }
    
    
    func isTextFieldAppropriate() -> Bool {
        if addedItem.count < 3 {
            alertTitle = "Your new item should be at least 3 characters long!!❗️"
            alertShow.toggle()
            return false
        }
        return true
    }
    
    func showAlert() -> Alert{
        return Alert(title: Text(alertTitle))
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
        
    }
}
