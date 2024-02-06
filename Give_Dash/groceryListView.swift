//
//  GroceryListView.swift
//  Give_Dash
//
//  Created by Elancio Zeigler on 1/27/24.
//

import SwiftUI

struct GroceryListView: View {
    var body: some View {
        ScrollView{
            ZStack{
                Image("GDbg")
                
                VStack {
                    Text("Grocery List")
                        .font(.title)
                        .padding()
                    
                  
                }
                .navigationBarTitle("Place Order", displayMode: .inline)
            }
        }
    }
}
#Preview {
    GroceryListView()
}
