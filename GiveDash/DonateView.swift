//
//  DonateView.swift
//  Give_Dash
//
//  Created by Elancio Zeigler on 1/28/24.
//

import SwiftUI

struct GroceryItem2: Identifiable {
    let id = UUID()
    let name: String
    var count: Int
}

struct DonateView: View {
    
    @State private var groceries: [GroceryItem2] = [
        GroceryItem2(name: "Meat", count: 0),
        GroceryItem2(name: "Canned Goods", count: 0),
        GroceryItem2(name: "Dairy", count: 0),
        GroceryItem2(name: "Fruits", count: 0),
        GroceryItem2(name: "Grains", count: 0),
        GroceryItem2(name: "Vegetables", count: 0)
    ]
    @State private var showingReceiptPopover = false
    @State private var showPopover: Bool = false
    let popoverTexts = [
        "Food insecurity is a systemic issue that can happen to anyone, its not a personal failure.",
        "44 million people in the US face hunger, including 1 in 5 children in 2022",
        "1 in 8 Americans are estimated to be food insecure.","Food production and distribution systems contribute to environmental degradation, including deforestation, greenhouse gas emissions, and loss of biodiversity, further exacerbating food insecurity in the long term.", "Food insecurity disproportionately affects vulnerable populations, including children, women, the elderly, and marginalized communities.","Economic instability, poverty, conflict, and climate change are among the primary factors contributing to food insecurity."," Food insecurity can lead to malnutrition, which in turn contributes to various health issues, including stunted growth, weakened immune systems, and higher susceptibility to diseases.","Prior to 2024, around 9% of the world's population was estimated to be undernourished, according to the Food and Agriculture Organization (FAO) of the United Nations"
    ]
    
    var body: some View {
        
        NavigationView {
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
                                }.background(Color.gdcgreen) // Change color if needed
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
                        .background(Color.gDbcolor)
                        .cornerRadius(10)
                }
                .padding()
                .navigationBarTitle("Donation Menu", displayMode: .inline)
                .sheet(isPresented: $showingReceiptPopover) {
                    ConfirmOrderReceipt3(groceries: $groceries)
                }
            }.background(Color.gdg)
        }
    }
    
    // Binding for toggles to update grocery item count
    func binding(for item: GroceryItem2) -> Binding<Bool> {
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

struct ConfirmOrderReceipt3: View {
    @Binding var groceries: [GroceryItem2]
    
    var body: some View {
        VStack {
            Text("Receipt")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            List {
                ForEach(groceries) { item in
                    if item.count > 0 {
                        HStack {
                            Text("\(item.name):")
                            Spacer()
                            Text("\(item.count)")
                        }
                    }
                }
            }
            .padding()
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DonateView()
    }
}
