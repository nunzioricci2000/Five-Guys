//
//  ContentView.swift
//  Five Guys
//
//  Created by Vladimiro Andrea Barrella on 28/10/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showModal: Bool = false
    
    
    var body: some View {
        //This button is made of two things, the UI and the action
        ZStack{ 
                
            Button(action: {
                
                showModal.toggle()
            }) {
                
                Image(systemName: "info.circle")
                    .font(.system(size: 50))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
            }.offset(y:350)
                .sheet(isPresented: $showModal) {
                    ShowModal()
               }
          }
     }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
