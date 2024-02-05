//
//  SwiftUIView.swift
//  Give_Dash
//
//  Created by Elancio Zeigler on 1/27/24.
import SwiftUI
import MapKit

struct OrderView: View {
    @State private var userLocationInput = ""
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 42.3314, longitude: -83.0458), // Default: San Francisco
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    @State private var isMapClicked = false

    var body: some View {
        NavigationView {
            ScrollView{
                ZStack {
                    Image("GDbg")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        if !isMapClicked {
                            Map(coordinateRegion: $region)
                                .frame(height: 200)
                                .cornerRadius(16)
                                .onTapGesture {
                                    isMapClicked.toggle()
                                }
                        } else {
                            Map(coordinateRegion: $region)
                                .frame(maxHeight: .infinity)
                                .cornerRadius(16)
                                .onTapGesture {
                                    isMapClicked.toggle()
                                }
                        }
                        
                        TextField("Enter location (e.g., city or address)", text: $userLocationInput, onCommit: {
                            updateMapLocation()
                        })
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .multilineTextAlignment(.center)
                        .autocapitalization(.words)
                        .padding(.horizontal)
                        .keyboardType(.webSearch) // Allow "Return" key on the keyboard
                        
                        Button("Enter") {
                            updateMapLocation()
                        }
                        .padding()
                        
                        // Additional content for the OrderView can be added below the map
                        Text("Place your order!")
                            .font(.title)
                            .foregroundColor(.gDbcolor)
                            .padding()
                        
                        NavigationLink(destination: GroceryListView()) {
                            Text("Place Order")
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.gDbcolor)
                                .cornerRadius(10)
                        }
                        .padding()
                    }
                    
                    .padding()
                    .navigationBarTitle("Order", displayMode: .inline)
                    .bold()
                    .background(Color.gDbcolor1)
                }
            }
        }
    }
    private func updateMapLocation() {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(userLocationInput) { (placemarks, error) in
            if let error = error {
                // Handle geocoding error
                print("Location error: \(error.localizedDescription)")
            } else if let placemark = placemarks?.first {
                // Update map region with the coordinates from the geocoded location
                region.center = placemark.location?.coordinate ?? region.center
            } else {
                
                
                }
                // Handle no results found
                print("No results found.")
            }
        }
    }

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}


