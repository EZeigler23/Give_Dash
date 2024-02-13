//
//  GroceryListView.swift
//  Give_Dash
//
//  Created by Elancio Zeigler on 1/27/24.
//

import SwiftUI

struct GroceryListView2: View {
    
    @State private var stepper1 = Int()
    @State private var fruitNumber = Int()
    @State private var meatNumber = Int()
    @State private var dairyNumber = Int()
    @State private var breadNumber = Int()
    @State private var vegNumber = Int()
    @State private var canNumber = Int()
    
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
                        Stepper("Fruit \(fruitNumber)", value: $fruitNumber, in: 0...10)
                     
                        
                    })
                    HStack (content: {
                        
                        Image (.wheat)
                            .resizable()
                            .frame( width:22.0 ,height: 22.0)
                        Stepper("Bread \(breadNumber)", value: $breadNumber, in: 0...10)
                    })
                    HStack(content: {
                        
                        Image (.dairy2)
                            .resizable()
                            .frame( width:22.0 ,height: 22.0)
                        Stepper("Dairy \(dairyNumber)", value: $dairyNumber, in: 0...10)
                    })
                    HStack(content: {
                        
                        Image (.meat2)
                            .resizable()
                            .frame( width:22.0 ,height: 22.0)
                        Stepper("Meat \(meatNumber)", value: $meatNumber, in: 0...10)
                    })
                    HStack(content: {
                        
                        Image (.veg)
                            .resizable()
                            .frame( width:22.0 ,height: 22.0)
                        Stepper("Vegetables \(vegNumber)", value: $vegNumber, in: 0...10)
                    })
                        
                    HStack(content: {
                        
                        Image (.can)
                            .resizable()
                            .frame( width:22.0 ,height: 22.0)
                        Stepper("Canned Goods \(canNumber)", value: $canNumber, in: 0...10)
                    })
                  
                        
                        
                  
                        
                        
                            .navigationBarTitle("Place Order", displayMode: .inline)
                    }.frame(height: 545)
//                NavigationLink(destination: ConfirmOrderReceipt2()) {
//                    Text("Confirm Order")
//                        .padding()
//                        .foregroundColor(.white)
//                        .background(Color.gDbcolor)
//                        .cornerRadius(10)
//                }
//                .padding()

                }
            
                
                
                
            }
        }
    }
    
    #Preview {
        GroceryListView2()
    }
    
