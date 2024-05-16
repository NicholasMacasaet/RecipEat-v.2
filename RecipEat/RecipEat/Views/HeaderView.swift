//
//  HeaderView.swift
//  RecipEat
//
//  Created by Nick on 2024-05-16.
//

import SwiftUI

struct HeaderView: View {
    
    let smallTitle: String
    let mainTitle: String
    let angle: Double
    let background: Color
    
    
    var body: some View {
        ZStack{
            //Color("Midnight Purple")
//                .frame(width:UIScreen.main.bounds.width*3, height: UIScreen.main.bounds.height*3)
            
            
            RoundedRectangle(cornerRadius: 30)
                //.foregroundColor(Color("Ube Purple"))
                .foregroundColor(background)
                .frame(width:UIScreen.main.bounds.width*3, height: 300)
//                .rotationEffect(Angle(degrees: 15))
                .rotationEffect(Angle(degrees: angle))
                .offset(y:-120)
            
            
//            RoundedRectangle(cornerRadius: 30)
//             .foregroundColor(Color("Midnight Purple"))
//                .foregroundColor(Color.white)
//                .frame(width:UIScreen.main.bounds.width*3, height: 50)
//                .rotationEffect(Angle(degrees: 5))
//                .offset(y:65)
        
            VStack{
//                Text("Welcome to ...")
                Text(smallTitle)
                    .font(.system(size:25))
                    .foregroundColor(.white)
                    .offset(x:-100)
//                Text("RecipEat")
                Text(mainTitle)
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                    .bold()
            }.offset(y:-100)
        }
    }
}

#Preview {
    HeaderView(smallTitle: "small title", mainTitle: "main title", angle: 15, background: Color("Ube Purple"))
}
