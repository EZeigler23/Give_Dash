//
//  GroceryListView.swift
//  Give_Dash
//
//  Created by Elancio Zeigler on 1/27/24.
//

import SwiftUI

struct GroceryListView: View {
    var body: some View {
        ZStack{
            Image("GDbg")
            
            VStack {
                Text("Grocery List")
                    .font(.title)
                    .padding()
                
                // Add grocery list content and functionality here
            }
            .navigationBarTitle("Place Order", displayMode: .inline)
        }
    }
}
#Preview {
    GroceryListView()
}
