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

    @State private var isPopoverPresented: Bool = false

    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    Image("GDbg")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        CategoryView(categoryName: "Food", items: $foodItems)
                        CategoryView(categoryName: "Clothing", items: $clothingItems)
                        CategoryView(categoryName: "Water", items: $waterItems)
                        CategoryView(categoryName: "Miscellaneous", items: $miscellaneousItems)
                    }
                    .frame(width: 390, height: 250, alignment: .bottomLeading)
                    .bold()
                
                
                VStack {
                    Spacer()
                    NavigationLink(destination: makeDonationPopup(), isActive: $isPopoverPresented) {
                        EmptyView()
                    }
                    .hidden()
                    
                    Button(action: {
                        isPopoverPresented.toggle()
                    }) {
                        Text("Make Donation")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.gDbcolor)
                            .cornerRadius(10)
                            .padding()
                    }
                    .popover(isPresented: $isPopoverPresented) {
                        makeDonationPopup()
                    }
                }
              }
            }
            .navigationBarTitle("Donate", displayMode: .inline)
        }
    }

    private func makeDonationPopup() -> some View {
        VStack {
            Text("Are you sure you want to donate?")
                .padding()
            HStack{
                Button("Deny") {
                    // Handle denial logic
                    isPopoverPresented.toggle()
                }
                .foregroundColor(.red)
                .padding()
                Button("Confirm") {
                    // Handle confirmation logic
                    isPopoverPresented.toggle()
                }
                .padding()
           
            }
        }
        .bold()
        .background(Color.white)
        .cornerRadius(10)
        .padding()
    }
}

struct CategoryView: View {
    var categoryName: String
    @Binding var items: [String]

    @State private var newItem: String = ""

    var body: some View {
        
        VStack(alignment: .center) {
            
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
                    .padding(.leading)
                }.listStyle(.plain)
                    .frame(height: 50)
                
                
                TextField("Enter item", text: $newItem)
                    .frame(height:0)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .padding(.horizontal)
                    .onSubmit {
                        if !newItem.isEmpty {
                            items.append(newItem)
                            newItem = ""
                        }
                    }
                
                HStack {
                    Spacer()
                    Button(action: {
                        
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
        //.padding()
//        .navigationBarTitle("Order", displayMode: .large)
        .bold()
        .background(Color.gDbcolor1)
        
       
    }
    
}

#Preview {
    DonateView()
}
