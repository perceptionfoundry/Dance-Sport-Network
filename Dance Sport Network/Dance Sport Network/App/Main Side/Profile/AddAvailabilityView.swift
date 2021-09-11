//
//  AddAvailabilityView.swift
//  Dance Sport Network
//
//  Created by Syed ShahRukh Haider on 11/09/2021.
//

import SwiftUI

struct AddAvailabilityView: View {
    
    @Binding var dismiss : Bool
    
    var body: some View {
        
        ZStack{
            
            Rectangle()
                .fill(Color.black .opacity(0.5))
            VStack{
                CalendarView(selectedDate: .constant(Date()))
                    .frame(width: GetRect().width * 0.8, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding(5)
                    .background(Color.white
                                    .shadow(radius: 2))
                    
                
                VStack(alignment:.leading) {
                    Text("UNAVAILABLE FROM")
                        .font(.custom("Baron Neue Bold", size: 18))
                    
                    TextField("Wednesday Sept 10", text: .constant(""))
                        .padding(10)
                        .background(RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.gray)
                                        )
                    
                    Text("TO")
                        .font(.custom("Baron Neue Bold", size: 18))
                    
                    TextField("Wednesday Sept 10", text: .constant(""))
                        .padding(10)
                        .background(RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.gray)
                )
                    
                }
                .frame(width: GetRect().width * 0.8)
                .padding(.top, 30)
                .padding(.bottom, 30)
                
                HStack{
                    Button(action: {
                        dismiss.toggle()
                    }, label: {
                        Text("SAVE")
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .frame(width: GetRect().width * 0.33)
                            .background(Capsule()
                                            .fill(Color.accentColor))
                    })
                    .padding(30)
                    Button(action: {
                        dismiss.toggle()
                    }, label: {
                        Text("CANCEL")
                            .foregroundColor(.accentColor)
                            .padding(.vertical, 10)
                            .frame(width: GetRect().width * 0.33)
                            .background(Capsule()
                                            .stroke(Color.accentColor))
                    })
                }
                
            }
            .padding()
            .background(Color.white)
            .cornerRadius(15)
            
           
        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct AddAvailabilityView_Previews: PreviewProvider {
    static var previews: some View {
        AddAvailabilityView(dismiss: .constant(true))
    }
}
