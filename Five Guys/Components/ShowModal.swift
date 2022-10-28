//
//  ShowModal.swift
//  Five Guys
//
//  Created by Vladimiro Andrea Barrella on 28/10/22.
//

import SwiftUI

struct ShowModal: View {
    var body: some View {
            
        ScrollView{
                   
                        
                    
                        ZStack{
                            LinearGradient(colors: [
                                Color("1"), Color("2")], startPoint: .topLeading, endPoint:.bottomTrailing ).ignoresSafeArea()
                            
                            Image("maze")
                                .opacity(0.4)
                                .position(x:100, y:320)
                            
                            
                            
                            Image("podium")
                                .opacity(0.4)
                                .offset(x:150, y:230)
                            
                            
                            VStack{
                                
                                Text("HOW IT WORKS")
                                    .font(.system(size: 44, design: .rounded))
                                    .multilineTextAlignment(.center)
                                    .bold()
                                    .padding(30)
                                    .offset(y:20)
                                    .foregroundColor(.white)
                                
                                Text("ABOUT FIVE TILES")
                                    .font(.system(size: 35, design: .rounded))
                                    .multilineTextAlignment(.leading)
                                    .bold()
                                    .foregroundColor(.white)
                                    .padding(40)
                                    
                                
                                Text("The game consists of 25 tiles. Tapping any of the tiles will flip it and the adjacent four tiles. The goal of the puzzle is to switch all the tiles off. Can you do it in as few taps as possible?")
                                    .font(.system(size: 30, design: .rounded))
                                    .multilineTextAlignment(.leading)
                                    .padding(10)
                                    .bold()
                                    .foregroundColor(.white)
                                    
                                
                                Text("SCORE")
                                    .font(.system(size: 35, design: .rounded))
                                    .multilineTextAlignment(.leading)
                                    .bold()
                                    .foregroundColor(.white)
                                    .padding(40)
                                
                                Text("This section helps in keeping track of the levels you completed and the number of taps taken to finish each level.")
                                    .font(.system(size: 30, design: .rounded))
                                    .multilineTextAlignment(.leading)
                                    .bold()
                                    .foregroundColor(.white)
                                    .padding(10)
                            }
                            
                        }
        }.ignoresSafeArea()
    }
        }

   

struct ShowModal_Previews: PreviewProvider {
    static var previews: some View {
        ShowModal()
    }
}
