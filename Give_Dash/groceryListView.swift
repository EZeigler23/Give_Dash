//
//  GroceryListView.swift
//  Give_Dash
//
//  Created by Elancio Zeigler on 1/27/24.
//

import SwiftUI

struct GroceryListView2: View {
    var body: some View {
        ZStack{
            Image("GDbg")
                .resizable()
                .scaledToFit()
            
            VStack {
                Text("Grocery Essentials")
                
                    .font(.title)
                    .padding()
                
                List {
                    HStack (content: {
                        
                        Image(.fruit)
                            .resizable()
                            .frame( width:22.0 ,height: 22.0)
                        Text ("Fruit")
                        
                    })
                    HStack (content: {
                        
                        Image (.wheat)
                            .resizable()
                            .frame( width:22.0 ,height: 22.0)
                        Text ("Bread ")
                    })
                    HStack(content: {
                        
                        Image (.dairy2)
                            .resizable()
                            .frame( width:22.0 ,height: 22.0)
                        Text ("Dairy")
                    })
                    HStack(content: {
                        
                        Image (.meat2)
                            .resizable()
                            .frame( width:22.0 ,height: 22.0)
                        Text ("Meat")
                    })
                    HStack(content: {
                        
                        Image (.veg)
                            .resizable()
                            .frame( width:22.0 ,height: 22.0)
                        Text ("Vegetables")
                    })
                        
                    HStack(content: {
                        
                        Image (.can)
                            .resizable()
                            .frame( width:22.0 ,height: 22.0)
                        Text ("Canned Goods")
                    })
                  
                        
                        
                  
                        
                        
                            .navigationBarTitle("Place Order", displayMode: .inline)
                    }.frame(height: 545)

                }
                
                
                
            }
        }
    }
    
    #Preview {
        GroceryListView2()
    }
    
