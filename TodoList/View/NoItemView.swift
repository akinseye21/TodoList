//
//  NoItemView.swift
//  TodoList
//
//  Created by Yomi on 3/9/23.
//

import SwiftUI

struct NoItemView: View {
    
    @State var animate: Bool = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView{
            VStack(spacing: 20){
                Text("There are no item!")
                    .font(.title)
                    .bold()
                Text("Hello! You have no item added to your Todo List. Are you a task manager, you can keep track of your works by clicking the add button!")
                    .padding(.horizontal, 20)
                    .padding(.bottom, 10)
                
                NavigationLink {
                    AddView()
                } label: {
                    Text("Add an item! 😃")
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(animate ? secondaryAccentColor : Color.accentColor)
                        .cornerRadius(10)
                        .padding(.horizontal, 50)
                }
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(
                    color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                    radius: animate ? 30 : 10,
                    x: 0,
                    y: animate ? 50 : 30
                )
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .multilineTextAlignment(.center)
            .padding()
            .onAppear(perform:  addAnimation)
        }
    }
    
    func addAnimation(){
        
        guard !animate else { return }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            withAnimation(
                //Adding custom animation
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()            //repeating animation
                //.easeInOut
            ){
                animate.toggle()
            }
        }
    }
}

struct NoItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemView()
        }
        
    }
}
