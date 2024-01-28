//
//  DeliveryView.swift
//  Give_Dash
//
//  Created by Elancio Zeigler on 1/28/24.
//

import SwiftUI

struct DeliverView: View {
var body: some View {
    NavigationView{
        ScrollView{
            ZStack{
                Image("GDbg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                Text("Delivery View")
                    .font(.title)
                    .padding()
            }
        } .navigationBarTitle("Delivery", displayMode: .inline)
    }
}
}

#Preview {
    DeliverView()
}
