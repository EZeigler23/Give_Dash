//
//  driverView.swift
//  Give_Dash
//
//  Created by Elancio Zeigler on 1/29/24.
//

import SwiftUI

struct driverView: View {
    var body: some View {
        NavigationView{
            ScrollView{
            ZStack{
                Image("GDbg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
               
            }
          } .navigationBarTitle("Driver Registration", displayMode: .inline)
        }
    }
}

#Preview {
    driverView()
}
