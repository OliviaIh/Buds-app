//
//  FilterButtonsView.swift
//  Buds
//
//  Created by Olivia Ih on 8/13/21.
//

/*
 Horizontal ScrollView of toggleable filter buttons
 */

import SwiftUI


struct FilterButtonsView: View {
    
    // for demo; retrieve filters list from backend in future (?)
    private let filters = ["furniture", "books", "clothes", "outdoors"]
    private var filterButtons:[FilterButton] {
        var buttons:[FilterButton] = []
        
        for filter in filters {
            buttons.append(FilterButton(label: filter, toggledButtons: $toggledButtons))
        }
        
        return buttons
    }
    
    @Binding var toggledButtons:[String]
    
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<filterButtons.count) { i in
                    filterButtons[i]
                }
            }
        }
        .padding(.leading)
    }
}


struct FilterButton: View {
    
    var label:String
    @State var selected:Bool = false
    @Binding var toggledButtons:[String]
    
    var body: some View {
        if selected {
            Button(label.uppercased()) {
                // removed from toggled array
                if let index = toggledButtons.firstIndex(of: label) {
                    toggledButtons.remove(at: index)
                }
                
                selected = false
            }
            .buttonStyle(ToggledFilterButton())
        }
        else {
            Button(label.uppercased()) {
                // add to toggled array
                if toggledButtons.firstIndex(of: label) == nil {
                    toggledButtons.append(label)
                }
                
                selected = true
            }
            .buttonStyle(NotToggledFilterButton())
        }
    }
}




struct FilterButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        FilterButtonsView(toggledButtons: .constant([""]))
    }
}
