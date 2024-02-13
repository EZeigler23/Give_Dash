//
//  SwiftUIView.swift
//  GiveDash
//
//  Created by Elancio Zeigler on 2/7/24.
//

import SwiftUI
import MapKit

struct ConfirmOrderReceipt2: View {
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
        NavigationView{
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
                                    .padding()
                                    .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(hex:"263F56"))
                            }
                            Spacer(minLength: 50)
                                .padding()
                            
                    VStack {
                        Text("Order Confirmed!").padding()
                            .fontWeight(.bold)
                            .font(.largeTitle)
                            .foregroundColor(.gDbcolor)
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
                        Text("Your driver will be there shortly...").padding()
                            .fontWeight(.bold)
                            .font(.title2)
                            .foregroundColor(.gDbcolor)
                            
                        
                        @State var progress: Double = 30.0
                        let timer = Timer.publish(every: 0.05, on: .main, in: .common).autoconnect()
                            

                            ProgressView(value: progress, total: 100){
                                Text("Driver's Progress...").frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).bold()
                            } currentValueLabel: {
                                Text("\(Int(progress))%")
                            }.padding()
                            .bold()
                            .tint(.gdc2)
                            .progressViewStyle(.linear)
                            .onReceive(timer) { _ in
                                if progress < 100 {
                                    progress += 1
                                } else {
                                    progress = 0
                                }
                            }

                        
                    }
                    
                } .navigationBarTitle("Delivery", displayMode: .inline)
                @State var progress: Double = 0.0
                let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
                    

                }
            )}
        }
    }

#Preview {
    ConfirmOrderReceipt2()
}
