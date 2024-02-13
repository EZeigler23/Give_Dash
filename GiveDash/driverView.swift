//
//  driverView.swift
//  Give_Dash
//
//  Created by Elancio Zeigler on 1/29/24.
//

import SwiftUI

struct newRegistration: View {
    @State var carRegistrationName = "Register Vehicle"
    @State var newName = ""
    @State var newCarModel = ""
    @State var newLicensePlate = ""
    @State var newIDnumber = ""
    @State var newState = ""
    @State var newExp = ""
    @State var newCarColor: Color = .blue
    
    var body: some View {
        Text(carRegistrationName)
            .bold()
            .font(.title)
            .padding(.leading)
        VStack {
            
            Group {
                TextField("Enter Name", text: $newName)
                    .frame(height:0)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .padding(.horizontal)
                TextField("Enter Vehicle Model", text: $newCarModel)
                    .frame(height:0)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .padding(.horizontal)
                TextField("Enter Plate Number", text: $newLicensePlate)
                    .frame(height:0)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .padding(.horizontal)
                TextField("Enter License Number", text: $newIDnumber)
                    .frame(height:0)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .padding(.horizontal)
                TextField("Enter State", text: $newState)
                    .frame(height:0)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .padding(.horizontal)
                TextField("Enter Expiration", text: $newExp)
                    .frame(height:0)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .padding(.horizontal)
            }
        }
    }
}

struct driverView: View {
    @State private var registrationSaved = false
    
    func saveRegistration() {
        // Implement your logic to save the registration details here
        
        // Set registrationSaved to true to indicate that registration is saved
        registrationSaved = true
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
                                    .padding()
                                Spacer()
                                Image(systemName: "info")
                                    .padding()
                                    .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(hex:"263F56"))
                            }
                            Spacer(minLength: 60)
                                .padding()
                            
                    VStack { 
                        newRegistration()
                        Button("Save Registration") {
                            saveRegistration()
                        }
                        .bold()
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.gDbcolor)
                        .cornerRadius(8)
                        .padding()
                        // Navigate back to ContentView if registration is saved
                        NavigationLink(
                            destination: DeliverOrders(),
                            isActive: $registrationSaved,
                            label: { EmptyView() }
                        )
                    }
                }
            }
            .navigationBarTitle("Driver Registration", displayMode: .inline)
        )}
    }
}

struct ContentView2: View {
    var body: some View {
        Text("Welcome to ContentView")
    }
}

struct driverView_Previews: PreviewProvider {
    static var previews: some View {
        driverView()
    }
}
