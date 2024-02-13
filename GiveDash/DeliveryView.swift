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
        "Food insecurity is a systemic issue that can happen to anyone, its not a personal failure.",
        "44 million people in the US face hunger, including 1 in 5 children in 2022",
        "1 in 8 Americans are estimated to be food insecure.","Food production and distribution systems contribute to environmental degradation, including deforestation, greenhouse gas emissions, and loss of biodiversity, further exacerbating food insecurity in the long term.", "Food insecurity disproportionately affects vulnerable populations, including children, women, the elderly, and marginalized communities.","Economic instability, poverty, conflict, and climate change are among the primary factors contributing to food insecurity."," Food insecurity can lead to malnutrition, which in turn contributes to various health issues, including stunted growth, weakened immune systems, and higher susceptibility to diseases.","Prior to 2024, around 9% of the world's population was estimated to be undernourished, according to the Food and Agriculture Organization (FAO) of the United Nations"
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
