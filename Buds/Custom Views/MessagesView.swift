//
//  MessagesView.swift
//  Buds
//
//  Created by Olivia Ih on 8/5/21.
//

import SwiftUI

struct MessagesView: View {
    
    @State private var search:String = ""
        
    var body: some View {
        VStack {
            VStack {
                // title and write message button
                HStack {
                    TopLeftTitle(title: "messages")
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "square.and.pencil")
                            .foregroundColor(Color("Dark Teal"))
                            .padding([.top, .trailing])
                            .font(.largeTitle)
                    })
                }
                
                // search bar
                SearchBar(searchInquiry: $search)
            }
            
            
            // messages list
            ScrollView {
                ForEach(0..<100) { num in
                    Text("\(num)")
                }
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
    }
}
