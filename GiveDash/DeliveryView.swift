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
        Color(hex:"E2F1D2")
            .ignoresSafeArea()
            .overlay(
                
                ScrollView ([.vertical]){
                    VStack{
                        HStack{
                            Image("")
                                .resizable()
                                .frame(width: 50, height: 50, alignment: .leading)
                            Spacer()
                            Image(systemName: "info")
                                .padding()
                                .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                                .fontWeight(.bold)
                                .foregroundColor(Color(hex:"263F56"))
                        }
                        Spacer(minLength: 50)
                            .padding()
                                        VStack{
                    Group{
                        Image("gdl2")
                        Text("         Embark on a rewarding journey of community service. If you have a passion for lending a helping hand, start your application by clicking below to become a delivery professional.")
                            .foregroundColor(.gDbcolor)
                            .frame(alignment: .bottomTrailing)
                    }.padding()
                    
                        
                    NavigationLink(destination: driverView()) {
                        Text(" Become A Driver")
                            .bold()
                            .padding()
                            .foregroundColor(.gDbcolor)
                            .background(Color.gdc2)
                            .cornerRadius(10)
                    }
                
                }.padding()
            
                
            }
        } .navigationBarTitle("Delivery", displayMode: .inline)
    )}
}
}

#Preview {
    DeliverView()
}
