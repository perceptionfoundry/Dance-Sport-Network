//
//  CalendarView.swift
//  Dance Sport Network
//
//  Created by Syed ShahRukh Haider on 10/09/2021.
//

import SwiftUI
import FSCalendar

struct CalendarView: UIViewRepresentable {
    
    
    
    @Binding var selectedDate : Date
    var calendar = FSCalendar()
    
    func makeUIView(context: Context) -> FSCalendar {
        calendar.delegate = context.coordinator
        calendar.dataSource = context.coordinator
        
        calendar.appearance.todayColor = UIColor(Color.accentColor)
        calendar.appearance.titleTodayColor = .white
        calendar.appearance.weekdayTextColor =  UIColor(Color.accentColor)
        calendar.appearance.headerTitleColor =  UIColor(Color.accentColor)
        return calendar
    }
    
    
    
    func updateUIView(_ uiView: FSCalendar, context: Context) {
    
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
   
    class Coordinator:NSObject, FSCalendarDelegate, FSCalendarDataSource{
        
        var parent :  CalendarView
        
        init(_ parent: CalendarView){
            self.parent = parent
        }
        
        
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(selectedDate: .constant(Date()))
    }
}
