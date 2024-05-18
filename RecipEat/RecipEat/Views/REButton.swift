//
//  REButton.swift
//  RecipEat
//
//  Created by Nick on 2024-05-16.
//

import SwiftUI




struct REButton: View {
    let title:String
    let background: Color
    let doAThingamaBob: () -> Void
    //teporary closure until we add functionality 
    
    var body: some View {
        Button{
            doAThingamaBob()
        }label: {
            ZStack{
                RoundedRectangle(cornerRadius:10)
                    .foregroundColor(background)
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }.padding()
    }
}

#Preview {
    REButton(title: "Something", background: Color("Ube Purple")){
        //raagh
    }
}
