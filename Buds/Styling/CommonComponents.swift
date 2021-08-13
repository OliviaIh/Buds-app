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
                .font(.custom("Avenir Medium", size: 48))
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
 Horizontal ScrollView of toggleable filter buttons
 */
struct FilterButtons: View {
    
    // for demo; retrieve filters list from backend in future (?)
    private let filters = ["furniture", "books", "clothes", "outdoors"]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<filters.count) { i in
                    FilterButton(label: filters[i])
                }
            }
        }
        .padding(.leading)
    }
    
    
    private struct FilterButton: View {
        
        var label:String
        @State var selected:Bool = false
        
        var body: some View {
            if selected {
                Button(label.uppercased()) {
                    selected.toggle()
                }
                .buttonStyle(ToggledFilterButton())
            }
            else {
                Button(label.uppercased()) {
                    selected.toggle()
                }
                .buttonStyle(NotToggledFilterButton())
            }
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


struct PosterInfo: View {
    
    var infoLeft:String
    var infoRight:String
    
    var body: some View {
        HStack {
            ProfilePicPlaceholder(size: 28)
            
            VStack(alignment: .leading) {
                Text("Poster's Name")
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


struct PostToolbar: View {
    
    @State private var bookmarked:Bool = false
    
    var body: some View {
        ZStack {
            HStack {
                Text("2 hours ago")
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
}


struct ISOPost: View {
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .frame(height: 175, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .shadow(color: Color("Light Gray"), radius: 3, x: 0, y: 3)
                
                VStack(alignment: .leading) {
                    PosterInfo(infoLeft: "3 mi", infoRight: "Need by Tues, July 12 at 8 PM")
                        .padding(.leading, 5)
                    
                    Text("Poster can put description here of what they’re looking for. we’ll keep it simple (just a text box), but like the for grabs description box, we’ll put suggestions of what can be useful (description of item, where/how far they’re willing to go to pick up, etc).")
                        .foregroundColor(Color("Dark Teal"))
                        .font(.custom("Helvetica Neue", size: 13))
                        .multilineTextAlignment(.leading)
                        .padding([.leading, .bottom], 5)
                        .padding(.trailing, 10)
                        .frame(height: 86, alignment: .topLeading)
                        .lineLimit(5)
                        .lineSpacing(1.15)
                    
                    Text("Tags: furniture, outdoors")
                        .foregroundColor(Color("Dark Teal"))
                        .font(.custom("Helvetica Neue Italic", size: 13))
                        .padding(.leading, 5)
                        .padding(.trailing, 10)
                }
            }
            
            PostToolbar()
        }
        .padding(.horizontal, 15)
    }
}


struct ForGrabsPost: View {
    
    private let pictureHeight = UIScreen.main.bounds.width - 40
    private let collapsedHeight:CGFloat = 80
    
    @State private var infoBarExpanded:Bool = false
    
    var body: some View {
        VStack {
            PosterInfo(infoLeft: "45 giveaways", infoRight: "4.5 stars")
            
            ZStack(alignment: .bottomTrailing) {
                Image("couch")
                    .resizable()
                    .frame(height: pictureHeight)
                    .aspectRatio(contentMode: .fit)
                
                // info bar
                ZStack(alignment: .top) {
                    Rectangle()
                        .frame(height: getInfoBarHeight())
                        .foregroundColor(Color(red: 0.196, green: 0.169, blue: 0.169, opacity: 0.7))
                    
                    VStack(alignment: .leading, spacing: 10) {
                        // info that's always visible
                        HStack {
                            VStack(alignment: .leading) {
                                Text("3 mi  |  2 people on waitlist")
                                    .foregroundColor(.white)
                                    .font(.custom("Avenir", size: 14))
                                
                                Text("Couch")
                                    .foregroundColor(.white)
                                    .font(.custom("Avenir Black", size: 20))

                                Text("collect by 8:30 PM")
                                    .foregroundColor(.white)
                                    .font(.custom("Avenir", size: 14))
                            }
                            
                            Spacer()
                        }
                        
                        // only visible when expanded
                        if infoBarExpanded {
                            Text("For now, I think just a text box of what specifications the item is will suffice. We can just add a blurb of what may help, like size specifications & what it was used for etc. For now, I think just a text box of what specifications the item is will suffice. We can just add a blurb of what may help, like size specifications & what it was used for etc.For now, I think just a text box of what specifications the item is will suffice. We can just add a blurb of what may help, like size specifications & what it was used for etc. ")
                                .foregroundColor(.white)
                                .font(.custom("Helvetica Neue", size: 14))
                                .frame(height: getInfoBarHeight() - collapsedHeight - 50, alignment: .top)
                            
                            Text("Tags: furniture")
                                .foregroundColor(.white)
                                .font(.custom("Helvetica Neue Italic", size: 14))
                        }
                    }
                    .padding(.top, 6)
                    .padding(.leading)

                }
                
                // more info
                Button(action: {
                    infoBarExpanded.toggle()
                }, label: {
                    if infoBarExpanded {
                        Text("collapse")
                            .foregroundColor(.white)
                            .font(.custom("Helvetica Neue Medium", size: 12))
                    }
                    else {
                        Text("more info")
                            .foregroundColor(.white)
                            .font(.custom("Helvetica Neue Medium", size: 12))
                    }
                })
                .padding([.bottom, .trailing], 10)
            }

            PostToolbar()
        }
        .padding(.horizontal)
        .animation(.easeOut)
        .transition(.slide)
    }
    
    
    private func getInfoBarHeight() -> CGFloat {
        if infoBarExpanded {
            return 0.75 * pictureHeight
        }
        else {
            return collapsedHeight
        }
    }
}


struct ForGrabsPost_Previews: PreviewProvider {
    static var previews: some View {
        ForGrabsPost()
    }
}
