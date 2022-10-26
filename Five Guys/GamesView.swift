//
//  SwiftUIView.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 20/10/22.
//

import SwiftUI

struct GamesView: View {
    @EnvironmentObject var mainvm: MainView.ViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image("btnBack") // set image here
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
            }
        }
    }
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                
                Spacer()
                Text("GAMES").fontWeight(.bold)
                    .font(.system(size: 50, design: .rounded)).foregroundColor(.white)
                Spacer()
                Button {
                    mainvm.setPage(.level(.fivetiles(5)))
                } label: {
                    Text("Five Tiles")
                        .padding()
                }.buttonStyle(.borderedProminent)
                Spacer()
                Button {
                    mainvm.setPage(.level(.fivetiles(5)))
                } label: {
                    Text("Tris")
                        .padding()
                }.buttonStyle(.borderedProminent)
                Spacer()
            }.navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: btnBack)
        }
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView().environmentObject(MainView.ViewModel())
    }
}
