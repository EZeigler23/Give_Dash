//
//  DonateView.swift
//  Give_Dash
//
//  Created by Elancio Zeigler on 1/28/24.
//

import SwiftUI

struct DonateView: View {
    @State private var foodItems: [String] = []
    @State private var clothingItems: [String] = []
    @State private var waterItems: [String] = []
    @State private var miscellaneousItems: [String] = []
    
    var body: some View {
            ZStack {
                Image("GDbg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer(minLength: 100)
                    CategoryView(categoryName: "Food", items: $foodItems)
                    CategoryView(categoryName: "Clothing", items: $clothingItems)
                    CategoryView(categoryName: "Water", items: $waterItems)
                 }.bold()
                
            }
        
    }
}

struct CategoryView: View {
    var categoryName: String
    @Binding var items: [String]

    @State private var newItem: String = ""

    var body: some View {
        
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.title)
                .padding(.leading)
            

            List {
                ScrollView {
                    ForEach(items, id: \.self) { item in
                        Text(item)
                    }
                    .onDelete { indices in
                        items.remove(atOffsets: indices)
                    }
                }
            }

            TextField("Enter item", text: $newItem)
                .frame(height: 0)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .padding(.horizontal)
                .onSubmit {
                    // Handle the case when the user presses the Enter key
                    if !newItem.isEmpty {
                        items.append(newItem)
                        newItem = ""
                    }
                }

            HStack {
                Spacer() // Add Spacer to push the button to the right
                Button(action: {
                    // Save the entered text to the category
                    if !newItem.isEmpty {
                        items.append(newItem)
                        newItem = ""
                    }
                }) {
                    Text("Save")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
            }
        }
    
        .padding()
        .navigationBarTitle("Order", displayMode: .inline)
        .bold()
        .background(Color.gDbcolor1)
    }
}

#Preview {
    DonateView()
}
