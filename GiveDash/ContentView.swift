//
//  ContentView.swift
//  Give_Dash
//
//  Created by Elancio Zeigler on 1/23/24.
//

import SwiftUI

struct ContentView: View {
  
    var body: some View {
        TabView {
        OrderView()
            .tabItem {
                Image(systemName: "cart")
                Text("Order")
            }
            
            DeliverView()
                .tabItem {
                    Image(systemName: "bicycle")
                    Text("Deliver")
                }
        
        ResourcesView()
            .tabItem {
                Image(systemName: "figure.2")
                Text("Resources")
            }
        
        
        ProfileView()
            .tabItem {
                Image(systemName: "person")
                Text("Profile")
            }
            
            }.onAppear() {
                UITabBar.appearance()
                    .backgroundColor = .gdcgreen
                    
            
    }
}
}


#Preview {
    ContentView()
}
