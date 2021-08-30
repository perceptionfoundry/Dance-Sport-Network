//
//  Dance_Sport_NetworkApp.swift
//  Dance Sport Network
//
//  Created by Syed ShahRukh Haider on 30/08/2021.
//

import SwiftUI

@main
struct Dance_Sport_NetworkApp: App {
    var body: some Scene {
        WindowGroup {
            SignInView()
        }
    }
}

func GetRect()-> CGRect{
    return UIScreen.main.bounds
}
