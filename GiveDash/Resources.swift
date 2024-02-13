//
//  DeliverOrders.swift
//  GiveDash
//
//  Created by Elancio Zeigler on 2/8/24.
//

import SwiftUI

struct ResourcesView: View {
    
    let popoverTexts = [
        "Food insecurity is a systemic issue that can happen to anyone, not a personal failure",
        "44 million people in the US face hunger, including 1 in 5 children in 2022",
        "1 in 8 Americans are estimated to be food insecure."
    ]
    
    @State private var showPopover: Bool = false
    @State var isExpanded = false
    @State var isExpanded2 = false
    @State var isExpanded3 = false
    
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
                                        Text("This is the expanded content. You can add more text or other views here.")
                                            .frame(maxWidth: 371, maxHeight: .infinity)
                                            .padding()
                                            .foregroundStyle(Color(hex: "263F56"))
                                    }.background(.gdcgreen)
                                } else {
                                    // Collapsed content
                                    Group{
                                        Spacer()
                                        Text("This is a sample text in the box.").frame(width: 300, height: 0, alignment: .center)
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
                                    Text("This is the expanded content. You can add more text or other views here.")
                                        .frame(maxWidth: 371, maxHeight: .infinity)
                                        .padding()
                                        .foregroundStyle(Color(hex: "263F56"))
                                }.background(.gdcgreen)
                            } else {
                                // Collapsed content
                                Group{
                                    Spacer()
                                    Text("This is a sample text in the box.").frame(width: 300, height: 0, alignment: .center)
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
                                    Text("This is the expanded content. You can add more text or other views here.")
                                        .frame(maxWidth: 371, maxHeight: .infinity)
                                        .padding()
                                        .foregroundStyle(Color(hex: "263F56"))
                                }.background(.gdcgreen)
                            } else {
                                // Collapsed content
                                Group{
                                    Spacer()
                                    Text("This is a sample text in the box.").frame(width: 300, height: 0, alignment: .center)
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

