//
//  CommonComponents.swift
//  Buds
//
//  Created by Olivia Ih on 8/6/21.
//

/*
 Common components/views that are used in various views
 */


import SwiftUI


/*
 Looks the same as TealRectangleTextFieldStyle except there's
 a magnifying glass SFSymbol next to the TextField and the
 TextField's placeholder text is "search".
 */
struct SearchBar: View {
    
    @Binding var searchInquiry:String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color("Dark Teal"))
                .padding(.leading)
            TextField("search", text: $searchInquiry)
                .padding(.vertical, 15)
                .font(.custom("Helvetica Neue", size: 18))
        }
        .overlay(Rectangle().stroke(Color("Teal"), lineWidth: 2))
        .padding()
    }
}


/*
 Left-justified title meant for tops of pages
 */
struct TopLeftTitle: View {
    
    var title:String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.custom("Avenir Medium", size: 43))
                .foregroundColor(Color("Dark Teal"))
                .padding([.leading, .top])
            Spacer()
        }
    }
}


/*
 VStack of TopLeftTitle and SearchBar for tops of pages
 */
struct TitleAndSearchBar: View {
    
    var title:String
    @Binding var searchInquiry:String
    
    var body: some View {
        VStack {
            TopLeftTitle(title: title)
            SearchBar(searchInquiry: $searchInquiry)
        }
    }
}


/*
 Default/placeholder profile pic
 */
struct ProfilePicPlaceholder: View {
    
    var size:CGFloat
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: size, height: size)
                .foregroundColor(Color("Red Orange"))
            Image(systemName: "person.crop.circle")
                .foregroundColor(Color("Orange"))
                .font(.system(size: size + 4, weight: .thin))
        }
    }
}


/*
 Info about poster for ForGrabs and ISO posts
 */
struct PosterInfo: View {
    
    var posterName:String
    var infoLeft:String
    var infoRight:String
    
    var body: some View {
        HStack {
            ProfilePicPlaceholder(size: 28)
            
            VStack(alignment: .leading) {
                Text(posterName)
                    .foregroundColor(Color("Dark Teal"))
                    .font(.custom("Avenir Black", size: 14))
                
                Text(infoLeft + "  |  " + infoRight)
                    .foregroundColor(Color("Teal"))
                    .font(.custom("Avenir Medium", size: 12))
            }
            
            Spacer()
        }
    }
}


/*
 Info/button bar for ForGrabs and ISO posts
 */
struct PostToolbar: View {
    
    var hoursSincePosting:Int
    
    @State private var bookmarked:Bool = false
    
    var body: some View {
        ZStack {
            HStack {
                Text(getHoursSincePostingString(hours: hoursSincePosting))
                    .foregroundColor(Color("Dark Teal"))
                    .font(.custom("Avenir", size: 14))
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "paperplane")
                        .foregroundColor(Color("Dark Teal"))
                        .font(.title3)
                })
                
                Button(action: {
                    bookmarked.toggle()
                }, label: {
                    if bookmarked {
                        Image(systemName: "bookmark.fill")
                            .foregroundColor(Color("Dark Teal"))
                            .font(.title3)
                    }
                    else {
                        Image(systemName: "bookmark")
                            .foregroundColor(Color("Dark Teal"))
                            .font(.title3)
                    }
                })
                
            }
            
            Button(action: {}, label: {
                Image(systemName: "ellipsis")
                    .foregroundColor(Color("Dark Teal"))
                    .font(.headline)
            })
        }
    }
    
    private func getHoursSincePostingString(hours:Int) -> String {
        if hours == 1 {
            return "1 hour ago"
        }
        else if hours == 0 {
            return "less than 1 hour ago"
        }
        else {
            return String(hours) + " hours ago"
        }
    }
}


/*
 Label for info field for making new For Grabs and ISO posts
 */
struct PostInfoFieldLabel: View {
    
    var label:String
    
    var body: some View {
        HStack {
            Text(label)
                .font(.custom("Avenir Medium", size: 18))
                .foregroundColor(Color("Dark Teal"))
                .padding([.leading, .top])
            Spacer()
        }
    }
}



struct Component_Previews: PreviewProvider {
    static var previews: some View {
        PostInfoFieldLabel(label: "label")
    }
}

