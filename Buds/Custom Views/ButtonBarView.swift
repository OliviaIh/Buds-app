//
//  ButtonBarView.swift
//  Buds
//
//  Created by Andrea Wang Admin on 8/4/21.
//

import SwiftUI

struct ButtonBarView: View {
    @State var selectedIndex = 10

    let tabBarImagesNames = ["For Grabs", "ISO"]
    
    var body: some View {
        switch selectedIndex{
            case 0:
                LoginView()
                
                
            case 1:
                ISOView()




            default:
                Spacer()
                HStack(alignment: .bottom){
                    ForEach(0..<2) { num in
                        Button(action: {
                            if selectedIndex != num{
                                selectedIndex = num
                                print(selectedIndex)
                                print(num)
                                
                            }
                           
                            
                            
                            
                            
                        }, label: {
                            Image(tabBarImagesNames[num])
                        })
                    }
                }






        }





    }
}

struct ButtonBarView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonBarView()
    }
}
