//
//  ContentView.swift
//  TimeTracker
//
//  Created by Ashok Khanna on 8/5/20.
//  Copyright © 2020 Ashok Khanna. All rights reserved.
//

import SwiftUI

struct AdvanceView: View {
    @EnvironmentObject var dataRouter: DataRouter
    @State private var selection = 3

        var body: some View {
            
            NavigationView{
            TabView(selection: $selection) {
                
                MainView()
                    .tabItem {
                        Image(systemName: "chart.bar")
                        Text("Chart")
                    }
                .tag(1)
                .accentColor(.white)
                
                
                MainView()
                    .tabItem {
                        Image(systemName: "clock")
                        Text("History")
                    }
                .tag(2)
                .accentColor(.white)
                
                
                MainView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                .tag(3)
                .accentColor(.white)

                MainView()
                    .tabItem {
                        Image(systemName: "doc.append")
                        Text("Quotes")
                    }
                .tag(4)
                .accentColor(.white)
                
                MainView()
                    .tabItem {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                .tag(5)
                .accentColor(.white)
            }
            .tabBarCustomStyle()
            .accentColor(.orange)
            
            }

    }
}


public struct TabBarModifier: ViewModifier {
    public func body(content: Content) -> some View {
        
        content.onAppear {
            UITabBar.appearance().barTintColor = .black
            UITabBar.appearance().tintColor = .white
            UITabBar.appearance().layer.borderColor = UIColor.clear.cgColor
            UITabBar.appearance().clipsToBounds = true

            
        }.onDisappear {

        }
    }
}

extension View {
    public func tabBarCustomStyle() -> some View {
        modifier(TabBarModifier())
    }
}


/*
 
 VStack(spacing: 0) {
     
     
 

     
     
 }
 
 */
