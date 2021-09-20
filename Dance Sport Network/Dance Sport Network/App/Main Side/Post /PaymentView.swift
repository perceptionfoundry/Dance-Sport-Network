//
//  PaymentView.swift
//  Dance Sport Network
//
//  Created by Syed ShahRukh Haider on 01/09/2021.
//

import SwiftUI

struct PaymentView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var isCard = false
    
    var body: some View {
        
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
                Text("PAYMENT")
                    .font(Font.custom("Baron Neue Bold", size: 18))
                    .padding(.horizontal)
                Spacer()
            }
            
            Group{
                //MARK: TAG FRIEND
                HStack{
                    Text("Payment Method")
                        .font(.custom("Rubik_Bold", size: 16))
                    Spacer()
                }
                
                //MARK: PAYPAL BUTTON
                HStack(spacing: 30) {
                    Button(action: {
                        
                    }, label: {
                        Text("PayPal")
                            .font(.custom("Rubik-Bold", size: 14))
                            .foregroundColor(Color.white)
                            .padding()
                            .background(Capsule()
                                            .frame(width: 99,height: 47, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/))
                })
                    Spacer()
                    
//                    //MARK: DEBIT CARD BUTTON
//                    Button(action: {
//
//                    }, label: {
//                        Text("Debit Card")
//                            .font(.custom("Rubik-Bold", size: 14))
//                            .foregroundColor(Color.black)
//                            .padding()
//                            .background(Capsule()
//                                            .fill(Color.white)
//                                            .frame(width: 99,height: 47, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/))
//                    })
//                    .background(Capsule()
//                                    .stroke(Color.accentColor, lineWidth: 3)
//                                    .frame(width: 99,height: 47, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/))
//
//
//                    //MARK: CC BUTTON
//                    Button(action: {
//
//                    }, label: {
//                        Text("Credit Card")
//                            .font(.custom("Rubik-Bold", size: 14))
//                            .foregroundColor(Color.black)
//                            .padding()
//                            .background(Capsule()
//                                            .fill(Color.white)
//                                            .frame(width: 99,height: 47, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/))
//                    })
//                    .background(Capsule()
//                                    .stroke(Color.accentColor, lineWidth: 3)
//                                    .frame(width: 99,height: 47, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/))


                }
                .padding(.horizontal)
                
             
            }
            .padding(.horizontal)
            .padding(.bottom)
            
            
            if isCard{
            Group{
                VStack {
                    PaymentTextView(title: "Name of card", placeHolder: "Card holder name", textfieldValue: .constant(""))
                    PaymentTextView(title: "Card Number", placeHolder: "xxxx-xxxxx-xx", textfieldValue: .constant(""))
                        .overlay(
                            Image("visa")
                                .padding(.trailing, 40), alignment: .trailing)
                    HStack{
                        PaymentTextView(title: "Expiry date (MM/YY)", placeHolder: "MM/YY", textfieldValue: .constant(""))
                        
                        PaymentTextView(title: "CVV", placeHolder: "xxx", textfieldValue: .constant(""))
                    }
                    PaymentTextView(title: "Billing Address", placeHolder: "Address", textfieldValue: .constant(""))
                }
                HStack{
                    Image("lock")
                    Text("Card details will be saved for fututre orders. CVV will not be saved  ")
                        .font(.custom("Rubik-Regular", fixedSize: 12))
                        .foregroundColor(.gray)
                }
                
            }
            }else{
                
                Button(action: {
                    
                }, label: {
                   Image("Paypal")
                    .resizable()
                    .frame(width: GetRect().width * 0.5, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .scaledToFill()
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                })
            }
          
          
            Spacer()
            //MARK: PAY BUTTON
            AuthButtonView(title: "PAY $59.00") {
                
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .background(
         
            VStack {
                Color("background")
                    .frame(width: GetRect().width, height: GetRect().height + 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
           
            )
       
    }
}

struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView()
    }
}

struct PaymentTextView: View {
    var title : String
    var placeHolder:String
    @Binding var textfieldValue : String
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.custom("Rubik-Regular", fixedSize: 12))
                .foregroundColor(.gray)
            
            TextField(placeHolder, text: $textfieldValue)
                .padding(10)
            
            Rectangle()
                .fill(Color.gray)
                .frame(height: 1)
        }.padding(.horizontal)
    }
}
