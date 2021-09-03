//
//  ShareUserPopView.swift
//  Dance Sport Network
//
//  Created by Syed ShahRukh Haider on 03/09/2021.
//

import SwiftUI

struct ShareUserPopView: View {
    
    var shareActionFunc: () -> ()
    var body: some View {
        HStack{
            Image("sample")
                .resizable()
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            Text("User Name")
                .font(.custom("Rubik-Regular", size: 14))
                .foregroundColor(.black)
            
            Spacer()
            
            Button(action: {
                shareActionFunc()
            }, label: {
                Text("Share")
                    .font(.custom("Rubik-Bold", size: 15))
                    .foregroundColor(Color.white)
                    .padding()
                    .background(Capsule()
                                    .frame(width: 100, height: 45, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/))
            })
            
        }
        .padding(.horizontal)
    }
}


struct ShareUserPopView_Previews: PreviewProvider {
    static var previews: some View {
        ShareUserPopView(){}
    }
}
