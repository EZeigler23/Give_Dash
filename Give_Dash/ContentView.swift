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
        
        DonateView()
            .tabItem {
                Image(systemName: "heart")
                Text("Donate")
            }
        
        DeliverView()
            .tabItem {
                Image(systemName: "bicycle")
                Text("Deliver")
            }
        
        ProfileView()
            .tabItem {
                Image(systemName: "person")
                Text("Profile")
            }
    }
}
}


struct DeliverView: View {
var body: some View {
    ZStack{
        Image("GDbg")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .edgesIgnoringSafeArea(.all)
        Text("Deliver View")
            .font(.title)
            .padding()
    }
}
}

struct ProfileView: View {
var body: some View {
    ZStack{
        Image("GDbg")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .edgesIgnoringSafeArea(.all)
        Text("Account Profile")
            .font(.title)
            .padding()
    }
}
}



#Preview {
    ContentView()
}
