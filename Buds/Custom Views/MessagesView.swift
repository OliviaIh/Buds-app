//
//  MessagesView.swift
//  Buds
//
//  Created by Olivia Ih on 8/5/21.
//

/*
 A view showing the Messages page, and some helper subviews
 */

import SwiftUI

struct MessagesView: View {
    
    @State private var search:String = ""
    
    // for demo purposes
    private let demoConvos = [
        ["Olivia Ih", "9:56 AM", true, "gimme my couch bro"],
        ["Andrea Wang", "Yesterday", false, "Where do you want to meet up?"],
        ["Bob Bobert", "Sunday", false, "what time?"],
        ["John Smith", "August 5", true, "I can pick it up"],
        ["Mary Jane", "August 1", false, "I'm out of town this weekend, but I can drop it off at your place on Monday :)"],
        ["Rob Robert", "July 24", false, "Thanks again!"]]
        
    
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
            ScrollView(showsIndicators: false) {
                ForEach(0..<demoConvos.endIndex) { i in
                    // change button to NavigationLink when implementing messaging functionality
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Conversation(recipientName: demoConvos[i][0] as! String, timestamp: demoConvos[i][1] as! String, lastMessageSentByUser: demoConvos[i][2] as! Bool, lastMessage: demoConvos[i][3] as! String)
                    })
                }
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}


/*
 View for a single conversation row
 */
struct Conversation: View {
    
    var recipientName:String
    var timestamp:String
    var lastMessageSentByUser:Bool
    var lastMessage:String
    
    var body: some View {
        HStack {
            // profile pic placeholder
            ProfilePicPlaceholder(size: 58)
            
            // text
            VStack(alignment: .leading) {
                HStack {
                    Text(recipientName)
                        .font(.custom("Avenir Heavy", size: 18))
                        .foregroundColor(Color("Dark Teal"))
                    Spacer()
                    Text(timestamp)
                        .font(.custom("Avenir", size: 15))
                        .foregroundColor(Color("Dark Teal"))
                }
                .padding(.trailing)
                
                Text(getMessagePreview())
                    .font(.custom("Avenir", size: 15))
                    .foregroundColor(Color("Dark Teal"))
                    .lineLimit(1)
                    .padding(.trailing, 30)
            }
        }
    }
    
    
    /*
     Returns the appropriate preview of the last message in the convo.
     */
    private func getMessagePreview() -> String {
        var preview:String = ""
        
        if lastMessageSentByUser {
            preview += "You: "
        }
        else {
            preview += recipientName.split(separator: " ")[0] + ": "
        }
        
        preview += lastMessage
        
        return preview
    }
}


struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
    }
}
