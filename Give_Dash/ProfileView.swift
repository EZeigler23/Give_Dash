//
//  ProfileView.swift
//  Give_Dash
//
//  Created by Elancio Zeigler on 1/28/24.
//

import SwiftUI

struct ProfileView: View {
var body: some View {
    NavigationView{
        ScrollView{
        ZStack{
            Image("GDbg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            Text("Account Profile")
                .font(.title)
                .padding()
        }
      } .navigationBarTitle("Account Profile", displayMode: .inline)
    }
}
}
#Preview {
    ProfileView()
}
