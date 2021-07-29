//
//  CustomButtonStyles.swift
//  Buds
//
//  Created by Olivia Ih on 7/23/21.
//

/*
 Custom app-wide button styles
 */

import SwiftUI

struct WhiteTextTealBackgroundButton: ButtonStyle {
    
    var width:CGFloat
    var height:CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.white)
            .frame(width: width, height: height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color("Teal"))
            .cornerRadius(6.0)
            .font(.custom("Avenir Black", size: 18))
    }
}


struct TealTextWhiteBackgroundButton: ButtonStyle {
    
    var width:CGFloat
    var height:CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(Color("Teal"))
            .frame(width: width, height: height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .border(/*@START_MENU_TOKEN@*/Color("Teal")/*@END_MENU_TOKEN@*/, width: 4)
            .cornerRadius(6.0)
            .font(.custom("Avenir Black", size: 18))
    }
}
