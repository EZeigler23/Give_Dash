//
//  PickUpOrder.swift
//  GiveDash
//
//  Created by Elancio Zeigler on 2/13/24.
//

import SwiftUI

struct PickUpOrder: View {
    @State private var showPopover: Bool = false
    @State private var userLocationInput = ""
    
    let popoverTexts = [
        "Food insecurity is a systemic issue that can happen to anyone, its not a personal failure.",
        "44 million people in the US face hunger, including 1 in 5 children in 2022",
        "1 in 8 Americans are estimated to be food insecure.","Food production and distribution systems contribute to environmental degradation, including deforestation, greenhouse gas emissions, and loss of biodiversity, further exacerbating food insecurity in the long term.", "Food insecurity disproportionately affects vulnerable populations, including children, women, the elderly, and marginalized communities.","Economic instability, poverty, conflict, and climate change are among the primary factors contributing to food insecurity."," Food insecurity can lead to malnutrition, which in turn contributes to various health issues, including stunted growth, weakened immune systems, and higher susceptibility to diseases.","Prior to 2024, around 9% of the world's population was estimated to be undernourished, according to the Food and Agriculture Organization (FAO) of the United Nations"
    ]
    
    struct Customers{
        var name = "John D"
        var place = "20127 Ohio"
        var timeOfOrder = time_t()
    }
    var data = ["Adams", "Browm", "Davis", "Harris", "Lawrence", "Nelson", "Perkins", "Sims", "Thomas", "Williams"]

  
    
    var body: some View {
        NavigationView{
            Color(.gdg)
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
                                        .foregroundColor(Color(.gDbcolor))
                                }
                                .padding()
                                .popover(isPresented: $showPopover, arrowEdge: .top) {
                                    VStack {
                                        ScrollView{
                                            Text(popoverTexts.randomElement() ?? "") // Selecting a random text
                                                .bold()
                                                .padding()
                                                .background(.gdcgreen2)
                                                .presentationCompactAdaptation(.popover)
                                                .fixedSize(horizontal: false, vertical: true)
                                                .multilineTextAlignment(.center)
                                        }.background(.gdcgreen2)
                                    }
                                }
                            }
                            .padding()
                            Spacer().padding()
                            Group{
                                DisclosureGroup("Downtown Detroit District"){
                                    ForEach(data, id: \.self){ listItem in
                                        NavigationLink("John D. \(listItem)", destination: PickUpOrderConfirm() )
                                    }.font(.title2)
                                        .frame(alignment: .leading)
                                        .foregroundColor(.white)
                                }.font(.title2)
                                    .padding()
                                    .frame(width: 400, alignment: .leading)
                                    .background(.gDbcolor)                                    .foregroundColor(.white)
                                
                                DisclosureGroup("Boston Edison District"){
                                    ForEach(data, id: \.self){ listItem in
                                        NavigationLink("Jane D. \(listItem)", destination: PickUpOrderConfirm() )
                                    }.font(.title2)
                                        .frame(alignment: .leading)
                                        .foregroundColor(.white)
                                }.font(.title2)
                                    .padding()
                                    .frame(width: 400, alignment: .leading)
                                    .background(.gDbcolor)                                    .foregroundColor(.white)
                                DisclosureGroup("Rosedale Park Customers"){
                                    ForEach(data, id: \.self){ listItem in
                                        NavigationLink("Jamal D. \(listItem)", destination: PickUpOrderConfirm() )
                                    }.font(.title2)
                                        .frame(alignment: .leading)
                                        .foregroundColor(.white)
                                }.font(.title2)
                                    .padding()
                                    .frame(width: 400, alignment: .leading)
                                    .background(.gDbcolor)                                    .foregroundColor(.white)
                                DisclosureGroup("East English Village District"){
                                    ForEach(data, id: \.self){ listItem in
                                        NavigationLink("Jeffery D. \(listItem)", destination: PickUpOrderConfirm() )
                                    }.font(.title2)
                                        .frame(alignment: .leading)
                                        .foregroundColor(.white)
                                }.font(.title2)
                                    .padding()
                                    .frame(width: 400, alignment: .leading)
                                    .background(.gDbcolor)                                    .foregroundColor(.white)
                                DisclosureGroup("North End District"){
                                    ForEach(data, id: \.self){ listItem in
                                        NavigationLink("Jasmine D. \(listItem)", destination: PickUpOrderConfirm() )
                                    }.font(.title2)
                                        .frame(alignment: .leading)
                                        .foregroundColor(.white)
                                }.font(.title2)
                                    .padding()
                                    .frame(width: 400, alignment: .leading)
                                    .background(.gDbcolor)                                    .foregroundColor(.white)
                                
                            }
                        }
                    }.navigationBarTitle("Order Drop-Off", displayMode: .inline)
                        .bold()
                )}
    }
}
#Preview {
    PickUpOrder()
}
