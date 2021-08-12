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
            .font(.custom("Avenir Black", size: 18))
            .frame(width: width, height: height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(RoundedRectangle(cornerRadius: 6)
                            .foregroundColor(Color("Teal")))
    }
}


struct TealTextWhiteBackgroundButton: ButtonStyle {
    
    var width:CGFloat
    var height:CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(Color("Teal"))
            .font(.custom("Avenir Black", size: 18))

            .frame(width: width - 2, height: height - 2, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) // -2 to account for lineWidth of 4
            .background(RoundedRectangle(cornerRadius: 6)
                            .stroke(Color("Teal"), lineWidth: 4))
    }
}


struct NotToggledFilterButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(Color("Dark Teal"))
            .font(.custom("Avenir Black", size: 13))
            .lineLimit(1)
            .padding(.horizontal, 2)
            .frame(width: 105, height: 20, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 15)
                            .stroke(Color("Teal"), lineWidth: 2))
            .padding(.all, 1)
    }
}


struct ToggledFilterButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .font(.custom("Avenir Black", size: 13))
            .lineLimit(1)
            .padding(.horizontal, 2)
            .frame(width: 105, height: 20, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(Color("Teal")))
            .padding(.all, 1)
    }
}
