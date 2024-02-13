//
//  DeliveryView.swift
//  Give_Dash
//
//  Created by Elancio Zeigler on 1/28/24.
//

import SwiftUI

struct DeliverView: View {
    @State private var showPopover: Bool = false
    
    let popoverTexts = [
        "Food insecurity is a systemic issue that can happen to anyone, not a personal failure",
        "44 million people in the US face hunger, including 1 in 5 children in 2022",
        "1 in 8 Americans are estimated to be food insecure."
    ]
var body: some View {
    NavigationView{
        Color(hex:"E2F1D2")
            .ignoresSafeArea()
            .overlay(
                ScrollView ([.vertical]){
                    VStack{
                        HStack{
                            Image("GDlogo1")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50, alignment: .leading)
                                .padding()
                            
                            Spacer()
                            
                            Button(action: {
                                // Toggle the visibility of the popover
                                showPopover.toggle()
                            }) {
                                Image(systemName: "info.circle")
                                    .font(.largeTitle)
                                    .foregroundColor(Color(hex:"263F56"))
                            }
                            .padding()
                            .popover(isPresented: $showPopover, arrowEdge: .top) {
                                VStack {
                                    ScrollView{
                                        Text(popoverTexts.randomElement() ?? "") // Selecting a random text
                                            .bold()
                                            .padding()
                                            .presentationCompactAdaptation(.popover)
                                            .fixedSize(horizontal: false, vertical: true)
                                            .multilineTextAlignment(.center)
                                    }
                                }
                            }
                        }
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
                    .bold()
    )}
}
}

#Preview {
    DeliverView()
}
