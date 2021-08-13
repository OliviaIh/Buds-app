//
//  NewISOView.swift
//  Buds
//
//  Created by Andrea Wang Admin on 8/11/21.
//

import SwiftUI

struct NewISOView: View {
    private let buttonWidth:CGFloat = (UIScreen.main.bounds.width - 30) / 2
    private let buttonHeight:CGFloat = 60
    
    var body: some View {
        
        VStack{
            TopLeftTitle(title: "new ISO post")
                .padding(.top)
            
            Button(action: goForGrabs) {
                HStack(alignment: .center) {
                    Spacer()
                    Text("Post").foregroundColor(Color.white).bold()
                    Spacer()
                }
            }
            .buttonStyle(WhiteTextTealBackgroundButton(width: buttonWidth, height: buttonHeight))
            
        }
        
        
       
    }
}

struct NewISOView_Previews: PreviewProvider {
    static var previews: some View {
        NewISOView()
    }
}
