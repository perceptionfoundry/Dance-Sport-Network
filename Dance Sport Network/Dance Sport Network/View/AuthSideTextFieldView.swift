//
//  AuthSideTextFieldView.swift
//  Dance Sport Network
//
//  Created by Syed ShahRukh Haider on 30/08/2021.
//

import SwiftUI

struct AuthSideTextFieldView: View {
    var title : String
    var placeHolder : String
    var iconTitle : String
    @Binding var textFieldValue : String
    
    var body: some View {
        VStack(alignment:.leading){
            
            Text(title)
                .font(.custom("Rubik-SemiBold", size: 14))
                .foregroundColor(Color.gray)
            
            HStack {
                TextField(placeHolder, text: $textFieldValue)
                Image(iconTitle)
                    
            }
            .padding(.horizontal)
            
            Rectangle()
                .fill(Color.gray)
                .frame(height: 1, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
        .padding(.bottom,10)
        .padding(.horizontal,10)
    }
}

struct AuthSideTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        AuthSideTextFieldView(title: "title", placeHolder: "placeholder", iconTitle: "user", textFieldValue: .constant(""))
            .previewLayout(.sizeThatFits)
    }
}
