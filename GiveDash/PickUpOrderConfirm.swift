//
//  PickUpOrderConfirm.swift
//  GiveDash
//
//  Created by Elancio Zeigler on 2/14/24.
//

import SwiftUI
import MapKit


struct PickUpOrderConfirm: View {
    @State private var showPopover: Bool = false
    
    let popoverTexts = [
        "Food insecurity is a systemic issue that can happen to anyone, its not a personal failure.",
        "44 million people in the US face hunger, including 1 in 5 children in 2022",
        "1 in 8 Americans are estimated to be food insecure.","Food production and distribution systems contribute to environmental degradation, including deforestation, greenhouse gas emissions, and loss of biodiversity, further exacerbating food insecurity in the long term.", "Food insecurity disproportionately affects vulnerable populations, including children, women, the elderly, and marginalized communities.","Economic instability, poverty, conflict, and climate change are among the primary factors contributing to food insecurity."," Food insecurity can lead to malnutrition, which in turn contributes to various health issues, including stunted growth, weakened immune systems, and higher susceptibility to diseases.","Prior to 2024, around 9% of the world's population was estimated to be undernourished, according to the Food and Agriculture Organization (FAO) of the United Nations"
    ]
    @State  var groceries: [GroceryItem] = [
        GroceryItem(name: "Meat", count: 0),
        GroceryItem(name: "Canned Goods", count: 0),
        GroceryItem(name: "Dairy", count: 0),
        GroceryItem(name: "Fruits", count: 0),
        GroceryItem(name: "Grains", count: 0),
        GroceryItem(name: "Vegetables", count: 0)
    ]
    @State private var userLocationInput = ""
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 42.3314, longitude: -83.0458),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    @State private var selectedLocation: CLLocationCoordinate2D?
    
    private func updateMapLocation() {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(userLocationInput) { (placemarks, error) in
            if let error = error {
                print("Location error: \(error.localizedDescription)")
            } else if let placemark = placemarks?.first {
                region.center = placemark.location?.coordinate ?? region.center
                selectedLocation = placemark.location?.coordinate
            } else {
                print("No places found.")
            }
        }
    }
    
    
    var body: some View {
        NavigationView{
            Color(.gdg)
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
                                        .foregroundColor(Color(.gDbcolor))
                                }
                                .padding()
                                .popover(isPresented: $showPopover, arrowEdge: .top) {
                                    VStack {
                                        ScrollView{
                                            Text(popoverTexts.randomElement() ?? "") // Selecting a random text
                                                .bold()
                                                .padding()
                                                .background(.gdcgreen2)
                                                .presentationCompactAdaptation(.popover)
                                                .fixedSize(horizontal: false, vertical: true)
                                                .multilineTextAlignment(.center)
                                        }.background(.gdcgreen2)
                                    }
                                }
                            }.padding()
                            VStack{
                                Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.none), annotationItems: [selectedLocation].compactMap { $0 }) { location in
                                    MapPin(coordinate: .init(latitude: 42.3314, longitude: -83.0458))
                                }
                                .frame(height: 200)
                                .cornerRadius(16)
                                ConfirmOrderReceipt(groceries: $groceries)
                            }
                        }
                    }
                    
                )}
    }
}
#Preview {
    PickUpOrderConfirm()
}
