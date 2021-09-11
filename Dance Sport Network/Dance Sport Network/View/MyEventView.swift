//
//  MyEventView.swift
//  Dance Sport Network
//
//  Created by Syed ShahRukh Haider on 11/09/2021.
//

import SwiftUI

struct MyEventView: View {
    
    var eventDate : String
    var eventTitle : String
    var eventImage: String
    var eventVenue : String
    var editAction : ()->()
    var binAction : ()->()

    
    var body: some View {
        Image(eventImage)
            .resizable()
            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            .frame(height:90)
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
                        
                        VStack{
                            Button(action: {
                                
                                editAction()
                            }, label: {
                                Image("Edit")
                            })
                            
                            Button(action: {
                                binAction()
                            }, label: {
                                Image("Bin")
                            })
                        }
                    }
                    .padding(.horizontal)
                }
                
            )
    }
}

struct MyEventView_Previews: PreviewProvider {
    static var previews: some View {
        MyEventView(eventDate: "date", eventTitle: "event title", eventImage: "event_sample2", eventVenue: "event venue", editAction: {}, binAction:{})
            .previewLayout(.sizeThatFits)
    }
}
