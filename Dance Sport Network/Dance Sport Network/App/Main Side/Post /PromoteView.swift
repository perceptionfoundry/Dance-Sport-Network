//
//  PromoteView.swift
//  Dance Sport Network
//
//  Created by Syed ShahRukh Haider on 01/09/2021.
//

import SwiftUI

struct PromoteView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var isSegue = false
    @State var showCard = false
    @State var dismissCard = false
    
    var body: some View {
        ZStack{
        VStack {
            HStack {
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "arrow.backward")
                        .foregroundColor(.black)
                })
                .padding(15)
                Spacer()
                Text("Promote Your Post")
                    .font(Font.custom("Rubik-Bold", size: 18))
                    .autocapitalization(.words)
                    .padding(.horizontal)
                Spacer()
            }
            
            VStack(alignment:.leading, spacing: 10){
                
                Text("Choose your Payment Plan")
                    .font(Font.custom("Rubik-Bold", size: 18, relativeTo: .title2))
                
                Text("Your post will appear multiples times per day with any payment option you choose. You can cancel anytime.")
                    .font(Font.custom("Rubik-Regular", size: 14, relativeTo: .title2))
                    .foregroundColor(.gray)
            }
            .padding(.vertical)
            
            HStack(spacing: 20){
                //MARK:DAILY
                
                Button(action: {
                    showCard.toggle()
                    dismissCard.toggle()
                }, label: {
                    ZStack{
                        
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.white)
                            .frame(width: GetRect().width * 0.4, height: 225, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                        VStack {
                            Text("Daily")
                                .foregroundColor(.black)
                                .font(Font.custom("Rubik-Bold", size: 18, relativeTo: .title))
                            
                            Text("$19.99")
                                .font(Font.custom("Baron Neue Bold", size: 36))
                                .foregroundColor(.accentColor)
                                .padding(.top)
                            
                            Text("Per day")
                                .font(Font.custom("Rubik-Regular", size: 14))
                                .foregroundColor(.gray)
                        }
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.accentColor, lineWidth: 2)
                            .frame(width: GetRect().width * 0.4, height: 225, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    )
                })
               
                
                //MARK:MONTHLY
               
                Button(action: {
                    showCard.toggle()
                    dismissCard.toggle()
                }, label: {
                    ZStack{
                        
                        RoundedRectangle(cornerRadius: 15)
                            .fill(LinearGradient(gradient: Gradient(colors: [Color.accentColor.opacity(0.5),Color.accentColor.opacity(0.4),Color.accentColor.opacity(0.3), Color.white, Color.white, Color.white]), startPoint: .topLeading, endPoint: .bottom))
                            .frame(width: GetRect().width * 0.4, height: 225, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                        VStack {
                            Text("Monthly")
                                .foregroundColor(.black)
                                .font(Font.custom("Rubik-Bold", size: 18, relativeTo: .title))
                            
                            Text("$9.99")
                                .font(Font.custom("Baron Neue Bold", size: 36))
                                .foregroundColor(.accentColor)
                                .padding(.top)
                            
                            Text("Per day")
                                .font(Font.custom("Rubik-Regular", size: 14))
                                .foregroundColor(.gray)
                        }
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.accentColor, lineWidth: 2)
                            .frame(width: GetRect().width * 0.4, height: 225, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    )
                })
            }
            Spacer()
            //MARK: PAY BUTTON
            
            NavigationLink(
                destination: PaymentView(),
                isActive: $isSegue,
                label: {
                    AuthButtonView(title: "PAY") {
                        isSegue.toggle()
                    }
                })
            Spacer()
        }
        
            BottomCardView(shown: $showCard, Dismissal: $dismissCard, height: GetRect().height * 0.7) {
                
                VStack {
                    Button {
                        showCard.toggle()
                        dismissCard.toggle()
                    } label: {
                        HStack {
                            Image(systemName: "xmark")
                                .frame(width: 30, height: 30, alignment: .center)
                            Spacer()
                        }
                        .padding(.horizontal)
                    }

                    CalendarView(selectedDate: .constant(Date()))
                        .padding()
                }
            }
            .opacity(showCard ? 1 : 0)
            
    }
        
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .background(
         
            VStack {
                Color("background_light")
                    .frame(width: GetRect().width, height: GetRect().height + 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
           
            )
       
    }
}

struct PromoteView_Previews: PreviewProvider {
    static var previews: some View {
        PromoteView()
    }
}
