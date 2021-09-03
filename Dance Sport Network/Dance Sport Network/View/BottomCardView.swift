//
//  BottomCardView.swift
//  EDYOU App
//
//  Created by Syed ShahRukh Haider on 16/08/2021.
//

import SwiftUI


struct BottomCardView<Content:View>: View {
    var content : Content
    @Binding var cardShown: Bool
    @Binding var cardDismissal : Bool
    let height : CGFloat
    
    init(shown: Binding<Bool>,
         Dismissal: Binding<Bool>,
         height : CGFloat,
        @ViewBuilder content: ()-> Content){
        self.content = content()
        _cardShown = shown
        _cardDismissal = Dismissal
        self.height = height
    }
    var body: some View {
       
        ZStack{
        // DIMMED
        
            GeometryReader{ _ in
                EmptyView()
            }
            .background(Color.black.opacity(0.41))
            .opacity(cardShown ? 1 : 0)
            .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
            .onTapGesture {
                //DISMISSAL
                cardDismissal.toggle()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                    cardShown.toggle()
                }
            }
        // CARD
            
            VStack{
                
                Spacer()
                VStack{
                    Capsule()
                        .fill(Color.accentColor)
                        .frame(width: 80, height: 4, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding(.top, 20)
                    content
                        
                }
                .background(Color.white)
                .cornerRadius(30)
                .frame(height:height)
                .offset(y : cardDismissal && cardShown ? 0 : height)
                .animation(.default.delay(0.5))
            }
            
        }.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        
       
    }
}

