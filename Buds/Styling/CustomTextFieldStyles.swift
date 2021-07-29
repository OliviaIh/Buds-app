//
//  CustomTextFieldStyle.swift
//  Buds
//
//  Created by Olivia Ih on 7/23/21.
//

/*
 Custom app-wide TextFieldStyles
 */

import SwiftUI

struct TealRectangleTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.leading, 17)
            .padding(.vertical, 15)
            .border(Color("Teal"), width: 2)
            .font(.custom("Helvetica Neue", size: 18))
    }
}
