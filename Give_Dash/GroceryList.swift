//
//  GroceryList.swift
//  Give_Dash
//
//  Created by Elancio Zeigler on 2/6/24.
//

import SwiftUI

struct GroceryListView: View {
    @State private var isSelected: Bool = false
    var body: some View {
        Color("E2F1D2")
            .ignoresSafeArea()
            .overlay(
                ScrollView ([.vertical]){
                    VStack{
                        HStack{
                            Image("GDlogo1")
                                .resizable()
                                .frame(width: 50, height: 50, alignment: .leading)
                            Image(systemName: "info")
                                .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                                .fontWeight(.bold)
                                .foregroundColor(Color(hex:"263F56"))
                        }
                        Spacer()
                        
                        VStack {
                            HStack{
                                Text("What would you like in your box?")
                                    .font(.largeTitle)
                                    .padding()
                            }
                            Spacer()
                            VStack {
                                HStack{
                                    //
                                    Group {
                                        VStack{
                                            HStack{
                                                Toggle ("", isOn: $isSelected)
                                                    .labelsHidden()
                                                    .toggleStyle(ToggleCheckboxStyle())
                                                    .font(.title)
                                                
                                                Image("meat2")
                                            }
                                            Text("Meat")
                                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                                .tint(Color(hex: "263F56"))
                                        }
                                    }
                                    Group {
                                        VStack{
                                            HStack{
                                                Toggle ("", isOn: $isSelected)
                                                    .labelsHidden()
                                                    .toggleStyle(ToggleCheckboxStyle())
                                                    .font(.title)
                                                    .frame(width: 90)
                                                
                                               // Spacer()
                                                Image("can")
                                            }
                                            Text("Canned Goods")
                                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                                .tint(Color(hex: "263F56"))
                                        }
                                    }
                                }
//
                                }
                                HStack{
                                    //
                                    Group {
                                        VStack{
                                            HStack{
                                                Toggle ("", isOn: $isSelected)
                                                    .labelsHidden()
                                                    .toggleStyle(ToggleCheckboxStyle())
                                                    .font(.title)
                                                    .frame(width: 65, height: 100)
                                            
                                                  Spacer()
                                              
                                                
                                                Image("dairy2")
                                            }
                                            Text("Dairy")
                                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                                .tint(Color(hex: "263F56"))
                                        }
                                    }
                                    Group {
                                        VStack{
                                            HStack{
                                                Toggle ("", isOn: $isSelected)
                                                    .labelsHidden()
                                                    .toggleStyle(ToggleCheckboxStyle())
                                                    .font(.title)
                                               
                                                    .frame(width: 80, height: 100)
                                                
                                                Spacer()
                                                Image("fruit")
                                            }
                                            Text("Fruits")
                                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                                .tint(Color(hex: "263F56"))
                                            
                                        }
                                    }
                                }
                                //
                                HStack{
                                
                                    Group {
                                        VStack{
                                            HStack{
                                                Toggle ("", isOn: $isSelected)
                                                    .labelsHidden()
                                                    .toggleStyle(ToggleCheckboxStyle())
                                                    .font(.title)
                                                Image("wheat")
                                            }
                                            Text("Grains")
                                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                                .tint(Color(hex: "263F56"))
                                        }
                                    }
                                    Group {
                                        VStack{
                                            HStack{
                                                Toggle ("", isOn: $isSelected)
                                                    .labelsHidden()
                                                    .toggleStyle(ToggleCheckboxStyle())
                                                    .font(.title)
                                                Image("veg")
                                            }
                                            Text("Vegetables")
                                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                                .tint(Color(hex: "263F56"))
                                        }
                                    }
                                }
                                .navigationBarTitle("Place Order", displayMode: .inline)
                            }
                        }
                    }
                
                   )
                }
    
    
}
#Preview {
    GroceryListView()
}
