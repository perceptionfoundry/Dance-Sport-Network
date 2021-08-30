//
//  AuthButtonVIew.swift
//  Dance Sport Network
//
//  Created by Syed ShahRukh Haider on 30/08/2021.
//

import SwiftUI

struct AuthButtonView: View {
    
    @State  var title : String
    var actionFunc : ()->()
    var body: some View {
       
        Button(action: {
            actionFunc()
        }, label: {
            Text(title)
                .font(.custom("Rubik-Bold", size: 15))
                .foregroundColor(Color.white)
                .padding()
                .background(Capsule()
                                .frame(width: 188, height: 45, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/))
        })
    }
}

struct AuthButtonVIew_Previews: PreviewProvider {
    static var previews: some View {
        AuthButtonView(title: "title", actionFunc: {})
    }
}
