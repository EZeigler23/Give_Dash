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
        center: CLLocationCoordinate2D(latitude: 42.3314, longitude: -83.0458),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    @State private var isMapClicked = false
    
    private func updateMapLocation() {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(userLocationInput) { (placemarks, error) in
            if let error = error {
                print("Location error: \(error.localizedDescription)")
            } else if let placemark = placemarks?.first {
                region.center = placemark.location?.coordinate ?? region.center
            } else {
                print("No places found.")
            }
        }
    }
    var body: some View {
        
        NavigationView {
            Color(hex:"E2F1D2")
                .ignoresSafeArea()
                .overlay(
                    
                    ScrollView ([.vertical]){
                        VStack{
                            HStack{
                                Image("GDlogo1")
                                    .resizable()
                                    .frame(width: 50, height: 50, alignment: .leading)
                                Spacer()
                                Image(systemName: "info")
                                    //.padding()
                                    .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(hex:"263F56"))
                            }
                            Spacer(minLength: 50)
                                .padding()
                            
                            
                            if !isMapClicked {
                                Map(coordinateRegion: $region)
                                    .frame(height: 200)
                                    .cornerRadius(16)
//                                    .onTapGesture {
//                                        isMapClicked.toggle()
//                                    }
                            }
                            else {
                                Map(coordinateRegion: $region)
                                    .frame(maxHeight: .infinity)
                                    .cornerRadius(16)
                                    .onTapGesture {
                                        isMapClicked.toggle()
                                    }
                            }
                            HStack{
                                
                                TextField("Enter location (city or address)", text: $userLocationInput, onCommit: {
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
                                }  .padding()
                                    .foregroundColor(.white)
                                    .background(Color.gDbcolor)
                                    .cornerRadius(10)
                            }
                            
                            // Additional content for the OrderView can be added below the map
                            Text("Place your order!")
                                .font(.title)
                                .foregroundColor(.gDbcolor)
                                .padding()
                            Spacer()
                                .padding()
                            
                            NavigationLink(destination: GroceryListView()) {
                                Text("Place Order")
                                    .padding()
                                    .foregroundColor(.gDbcolor)
                                    .background(Color.gdc2)
                                    .cornerRadius(10)
                            }
                                .padding()
                            Spacer()
                        }
                    }
                        .padding()
                        .navigationBarTitle("Order", displayMode: .inline)
                        .bold()
                    )}
                    
//                    if !isMapClicked {
//                        Map(coordinateRegion: $region)
//                            .frame(height: 200)
//                            .cornerRadius(16)
//                            .onTapGesture {
//                                isMapClicked.toggle()
//                            }
//                    }
//                    else {
//                        Map(coordinateRegion: $region)
//                            .frame(maxHeight: .infinity)
//                            .cornerRadius(16)
//                            .onTapGesture {
//                                isMapClicked.toggle()
//                            }
//                    }
//                    HStack{
//                        
//                        TextField("Enter location (city or address)", text: $userLocationInput, onCommit: {
//                            updateMapLocation()
//                        })
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding()
//                        .multilineTextAlignment(.center)
//                        .autocapitalization(.words)
//                        .padding(.horizontal)
//                        .keyboardType(.webSearch) // Allow "Return" key on the keyboard
//                        
//                        Button("Enter") {
//                            updateMapLocation()
//                        }  .padding()
//                            .foregroundColor(.white)
//                            .background(Color.gDbcolor)
//                            .cornerRadius(10)
//                    }
//                    
//                    // Additional content for the OrderView can be added below the map
//                    Text("Place your order!")
//                        .font(.title)
//                        .foregroundColor(.gDbcolor)
//                        .padding()
//                    
//                    
//                    NavigationLink(destination: GroceryListView()) {
//                        Text("Place Order")
//                            .padding()
//                            .foregroundColor(.gDbcolor)
//                            .background(Color.gdc2)
//                            .cornerRadius(10)
//                    }
//                        .padding()
    }
//
//                    
                    }

                    
                    
                    
                    
                    
                    struct OrderView_Previews: PreviewProvider {
                        static var previews: some View {
                            OrderView()
                        }
                    }
                    
                    
