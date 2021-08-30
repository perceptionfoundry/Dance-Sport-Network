//
//  NewPostView.swift
//  Dance Sport Network
//
//  Created by Syed ShahRukh Haider on 30/08/2021.
//

import SwiftUI

struct NewPostView: View {
    var body: some View {
        
        VStack {
            HStack {
                
                Text("NEW POST")
                    .padding()
                Spacer()
            }
            
        }
        .background(
         
            VStack {
                Color("background")
                    .frame(width: GetRect().width, height: GetRect().height + 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
           
            )
       
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView()
    }
}
