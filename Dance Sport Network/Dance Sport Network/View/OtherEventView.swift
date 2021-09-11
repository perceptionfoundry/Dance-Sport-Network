//
//  OtherEventView.swift
//  Dance Sport Network
//
//  Created by Syed ShahRukh Haider on 11/09/2021.
//

import SwiftUI

struct OtherEventView: View {
    
    var eventDate : String
    var eventTitle : String
    var eventImage: String
    var eventVenue : String
  

    
    var body: some View {
        Image(eventImage)
            .resizable()
            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            .frame(height:120)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .overlay(
                
                ZStack {
                    RoundedRectangle(cornerRadius: 15).opacity(0.4)
                    
                    HStack{
                        VStack(alignment:.leading){
                            Text(eventDate)
                                .font(.custom("Rubik-SemiBold", size: 16))
                                .foregroundColor(.accentColor)
                            Text(eventTitle)
                                .autocapitalization(.sentences)
                                .font(.custom("Rubik-SemiBold", size: 18))
                                .foregroundColor(.white)
                                .padding(.bottom)
                            
                            Text(eventVenue)
                                .font(.custom("Rubik-Regular", size: 12))
                                .foregroundColor(.white)
                        }
                        Spacer()
                       
                    }
                    .padding(.horizontal)
                }
                
                
            )
    }
}

struct OtherEventView_Previews: PreviewProvider {
    static var previews: some View {
        OtherEventView(eventDate: "date", eventTitle: "event title", eventImage: "event_sample2", eventVenue: "event venue")
    }
}
