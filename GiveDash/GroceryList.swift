//
//  GroceryList.swift
//  Give_Dash
//
//  Created by Elancio Zeigler on 2/6/24.
//

import SwiftUI

struct GroceryItem: Identifiable {
    let id = UUID()
    let name: String
    var count: Int
}

struct GroceryListView: View {
    
    @State private var groceries: [GroceryItem] = [
        GroceryItem(name: "Meat", count: 0),
        GroceryItem(name: "Canned Goods", count: 0),
        GroceryItem(name: "Dairy", count: 0),
        GroceryItem(name: "Fruits", count: 0),
        GroceryItem(name: "Grains", count: 0),
        GroceryItem(name: "Vegetables", count: 0)
    ]
    @State private var showingReceiptPopover = false
    @State var isConfirmOrderShowing = false
    var body: some View {
        NavigationView {
            Color(hex:"E2F1D2")
                .ignoresSafeArea()
                .overlay(
            VStack {
                List {
                    ForEach(groceries.indices, id: \.self) { index in
                        let item = groceries[index]
                        Section(header: Text(item.name)) {
                            HStack {
                                Toggle("", isOn: binding(for: item))
                                    .labelsHidden()
                                    .toggleStyle(ToggleCheckboxStyle())
                                    .font(.title)
                                Image(item.name.lowercased())
                                Spacer()
                                Text(item.name)
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .tint(Color(hex: "263F56"))
                                Stepper(value: $groceries[index].count, in: 0...10) {
                                    Text("Qty: \(groceries[index].count)")
                                }.background(Color.gdcgreen)

                            }
                        }
                    }
                }
                
                // Button to show receipt popover
                Button(action: {
                    showingReceiptPopover.toggle()
                }) {
                    Text("Place Order")
                        .bold()
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.gDbcolor) // Use any color you desire
                        .cornerRadius(10)
                }
                .padding()
                .navigationBarTitle("Order Menu", displayMode: .inline)
                .bold()
            }
        )}
        .popover(isPresented: $showingReceiptPopover) {
        
            ConfirmOrderReceipt(groceries: $groceries)
        }
    }
    
    // Binding for toggles to update grocery item count
    private func binding(for item: GroceryItem) -> Binding<Bool> {
        Binding {
            item.count > 0
        } set: { newValue in
            if newValue {
                // If toggled on, increase count by 1
                if let index = groceries.firstIndex(where: { $0.id == item.id }) {
                    groceries[index].count += 1
                }
            } else {
                // If toggled off, decrease count by 1
                if let index = groceries.firstIndex(where: { $0.id == item.id }) {
                    groceries[index].count -= 1
                }
            }
        }
    }
}

struct ConfirmOrderReceipt: View {
    @Binding var groceries: [GroceryItem]
    @State var isConfirmOrderShowing = false
    
    var body: some View {
   
        
        VStack(alignment: .leading) {
            
            Text("Receipt")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom)
            ForEach(groceries) { item in
                if item.count > 0 {
                    HStack {
                        Text("\(item.name):")
                        Spacer()
                        Text("\(item.count)")
                    }
                    .padding(.bottom)
                }
            }.sheet(isPresented: $isConfirmOrderShowing, content: {
                ConfirmOrderReceipt2()
            })
        }.padding()
        
        
            Button(action: {
                isConfirmOrderShowing.toggle()
            }) {
                Text("Confirm Order")
                    .bold()
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.gDbcolor) // Use any color you desire
                    .cornerRadius(10)
            }
            .padding()
        
            
            //navigationBarTitle("Confirm Order", displayMode: .inline)
            
//            NavigationLink(destination: GroceryListView()) {
//                Text("Place Order")
//                    .padding()
//                    .foregroundColor(.gDbcolor)
//                    .background(Color.gdc2)
//                    .cornerRadius(10)
//            }
//            .padding()
//        .padding()
    }
}

#Preview {
    GroceryListView()
}
