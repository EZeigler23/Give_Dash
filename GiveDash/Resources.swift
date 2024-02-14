//
//  DeliverOrders.swift
//  GiveDash
//
//  Created by Elancio Zeigler on 2/8/24.
//

import SwiftUI

struct ResourcesView: View {
    
    let popoverTexts = [
        "Food insecurity is a systemic issue that can happen to anyone, its not a personal failure.",
        "44 million people in the US face hunger, including 1 in 5 children in 2022",
        "1 in 8 Americans are estimated to be food insecure.","Food production and distribution systems contribute to environmental degradation, including deforestation, greenhouse gas emissions, and loss of biodiversity, further exacerbating food insecurity in the long term.", "Food insecurity disproportionately affects vulnerable populations, including children, women, the elderly, and marginalized communities.","Economic instability, poverty, conflict, and climate change are among the primary factors contributing to food insecurity."," Food insecurity can lead to malnutrition, which in turn contributes to various health issues, including stunted growth, weakened immune systems, and higher susceptibility to diseases.","Prior to 2024, around 9% of the world's population was estimated to be undernourished, according to the Food and Agriculture Organization (FAO) of the United Nations"
    ]
    
    @State private var showPopover: Bool = false
    @State var isExpanded = false
    @State var isExpanded2 = false
    @State var isExpanded3 = false
    @State var isExpanded4 = false
    @State var isExpanded5 = false
    @State var isExpanded6 = false
    
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
                            
                            VStack {
                                
                                if isExpanded {
                                    
                                    
                                    Group(){
                                        Link("Michigan Pop-Up Food Pantry", destination: URL(string: "https://www.facebook.com/groups/248349263031693/")!)
                                            .font(.title2)
                                            .frame(maxWidth: 371, maxHeight: .infinity, alignment: .leading)
                                            .padding()
                                            .foregroundStyle(Color(hex: "263F56"))
                                            .frame(maxWidth: 371, maxHeight: .infinity)
                                            .padding()
                                            .foregroundStyle(Color(hex: "263F56"))
                                        Link("Forgotten Harvest on the GO! - Pop-Up Pantries – Food Distribution", destination: URL(string: "https://forgottenharvest.galaxydigital.com/agency/detail/?agency_id=121232")!)
                                            .font(.title2)
                                            .frame(maxWidth: 371, maxHeight: .infinity, alignment: .leading)
                                            .padding()
                                            .foregroundStyle(Color(hex: "263F56"))
                                            .frame(maxWidth: 371, maxHeight: .infinity)
                                            .padding()
                                            .foregroundStyle(Color(hex: "263F56"))
                                        Link("Mobile Food Pantry Schedule for West Michigan", destination: URL(string: "https://www.feedwm.org/mobile-pantry-schedule/")!)
                                            .font(.title2)
                                            .frame(maxWidth: 371, maxHeight: .infinity, alignment: .leading)
                                            .padding()
                                            .foregroundStyle(Color(hex: "263F56"))
                                            .frame(maxWidth: 371, maxHeight: .infinity)
                                            .padding()
                                            .foregroundStyle(Color(hex: "263F56"))
                                    }.background(.gdcgreen)
                                } else {
                                    // Collapsed content
                                    Group{
                                        Spacer()
                                        Text("Pop Up Donation Drives").font(.title3)
                                            .frame(width: 300, height: 0, alignment: .center)
                                            .padding()
                                            .foregroundStyle(Color(hex: "263F56"))
                                            .frame(width: 400, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    }.background(.gdcgreen)
                                    
                                }
                                
                                Spacer()
                                
                                Button(action: {
                                    // Toggle the expansion state
                                    withAnimation {
                                        isExpanded.toggle()
                                    }
                                }) {
                                    ZStack{
                                        Rectangle()
                                            .frame(width: 371, height:42)
                                            .foregroundColor(Color(hex:"263F56"))
                                            .cornerRadius(8)
                                        
                                        Text(isExpanded ? "See Less" : "See More")
                                            .foregroundColor(.white)
                                        //  .padding()
                                            .frame(height: 42)
                                    }
                                }
                                
                            }
                            .frame(width: 371, height: isExpanded ? nil : 143)
                            .background(Color(hex:"E2F1D2"))
                            .cornerRadius(8)
                            .padding()
                            
                            Divider()
                            if isExpanded2 {
                                
                                
                                Group(){
                                    Link("State of Michigan Career Events Calendar", destination: URL(string: "https://mcsc.state.mi.us/EICPSEventInfo/Events.aspx")!)
                                        .font(.title2)
                                        .frame(maxWidth: 371, maxHeight: .infinity, alignment: .center)
                                        .padding()
                                        .foregroundStyle(Color(hex: "263F56"))
                                        .frame(maxWidth: 371, maxHeight: .infinity)
                                        .padding()
                                        .foregroundStyle(Color(hex: "263F56"))
                                    Link("State of Michigan Virtual Job Fairs", destination: URL(string: "https://www.michigan.gov/mdcs/state-employment/state-of-michigan-virtual-job-fairs")!)
                                        .font(.title2)
                                        .frame(maxWidth: 371, maxHeight: .infinity, alignment: .center)
                                        .padding()
                                        .foregroundStyle(Color(hex: "263F56"))
                                        .frame(maxWidth: 371, maxHeight: .infinity)
                                        .padding()
                                        .foregroundStyle(Color(hex: "263F56"))
                                    Link("MI Talent Dashboard Job Search", destination: URL(string: "https://www.mitalent.org/job-seeker")!)
                                        .font(.title2)
                                        .frame(maxWidth: 371, maxHeight: .infinity, alignment: .center)
                                        .padding()
                                        .foregroundStyle(Color(hex: "263F56"))
                                        .frame(maxWidth: 371, maxHeight: .infinity)
                                        .padding()
                                        .foregroundStyle(Color(hex: "263F56"))
                                }.background(.gdcgreen)
                            } else {
                                // Collapsed content
                                Group{
                                    Spacer()
                                    Text("Job Fairs").font(.title)
                                        .frame(width: 300, height: 0, alignment: .center)
                                        .padding()
                                        .foregroundStyle(Color(hex: "263F56"))
                                        .frame(width: 400, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                }.background(.gdcgreen)
                                
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                // Toggle the expansion state
                                withAnimation {
                                    isExpanded2.toggle()
                                }
                            }) {
                                ZStack{
                                    Rectangle()
                                        .frame(width: 371, height:42)
                                        .foregroundColor(Color(hex:"263F56"))
                                        .cornerRadius(8)
                                    
                                    Text(isExpanded2 ? "See Less" : "See More")
                                        .foregroundColor(.white)
                                    //  .padding()
                                        .frame(height: 42)
                                }
                            }
                            Divider()
                            if isExpanded3 {
                                
                                
                                Group(){
                                    Link("Download 'Karen', and report suspicious activity in your Community", destination: URL(string: "https://testflight.apple.com/join/iQhCPl1L")!)
                                        .font(.title2)
                                        .frame(maxWidth: 371, maxHeight: .infinity, alignment: .center)
                                        .padding()
                                        .foregroundStyle(Color(hex: "263F56"))
                                    Link("Need Help plannig a trip?? Download 'WeOUT' and let us plan it for you", destination: URL(string: "https://testflight.apple.com/join/leDki443")!)
                                        .font(.title2)
                                        .frame(maxWidth: 371, maxHeight: .infinity, alignment: .center)
                                        .padding()
                                        .foregroundStyle(Color(hex: "263F56"))
                                    Link("Wedding, Birthday Party, or any other special occasion?? Visit Exquisite Creations for all event/party necessities!", destination: URL(string: "https://exquisitecreationsservices.com")!)
                                        .font(.title2)
                                        .frame(maxWidth: 371, maxHeight: .infinity, alignment: .leading)
                                        .padding()
                                        .foregroundStyle(Color(hex: "263F56"))
                                }.background(.gdcgreen)
                            } else {
                                // Collapsed content
                                Group{
                                    Spacer()
                                    Text("Other Resources").font(.title)
                                        .frame(width: 300, height: 0, alignment: .center)
                                        .padding()
                                        .foregroundStyle(Color(hex: "263F56"))
                                        .frame(width: 400, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                }.background(.gdcgreen)
                                
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                // Toggle the expansion state
                                withAnimation {
                                    isExpanded3.toggle()
                                }
                            }) {
                                ZStack{
                                    Rectangle()
                                        .frame(width: 371, height:42)
                                        .foregroundColor(Color(hex:"263F56"))
                                        .cornerRadius(8)
                                    
                                    Text(isExpanded3 ? "See Less" : "See More")
                                        .foregroundColor(.white)
                                    //  .padding()
                                        .frame(height: 42)
                                
                            
  
                                }
                            }
                        }
                    }.navigationBarTitle("Resources", displayMode: .inline).bold()
                )
        }
        //.background(Color.gDbcolor1)
    }
}
    
    #Preview {
        ResourcesView()
    }

