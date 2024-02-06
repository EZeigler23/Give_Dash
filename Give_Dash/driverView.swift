//
//  driverView.swift
//  Give_Dash
//
//  Created by Elancio Zeigler on 1/29/24.
//

import SwiftUI
struct newRegistration: View{
    @State var carRegistrationName = "Register Vehicle"
    @State var newName = ""
    @State var newCarModel = ""
    @State var newLiscencePlate = ""
    @State var newIDnumber = ""
    @State var newState = ""
    @State var newExp = ""
    @State var newCarColor: Color = .blue
    var body: some View {
  
        
        Text(carRegistrationName)
            .bold()
            .font(.title)
            .padding(.leading)
        VStack{
            
            Text("Register Vehicle")
                .foregroundColor(.gDbcolor)
                .bold()
                .font(.title)
                .padding(.leading)
            Group{
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
                
                TextField("Enter Plate Number", text: $newLiscencePlate)
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
    var body: some View {
//        @State var newName = ""
//        @State var newCarModel = ""
        NavigationView{
            ScrollView{
            ZStack{
                Image("GDbg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    newRegistration(carRegistrationName: "", newName: "", newCarModel: "", newLiscencePlate: "", newIDnumber: "", newState: "", newExp: "", newCarColor: .blue)
                }
//                VStack{
//                    HStack{
//                        Text("Enter Name")
//                            .bold()
//                            .padding()
//                            .frame(alignment: .topTrailing)
//                        Spacer()
//                    }
//                        Divider()
//                    List{
//                        
////                        TextField("", text: $newName)
//                    }.frame(height: 50, alignment: .center)
//                    .padding()
//                    HStack{
//                        Text("Enter Name")
//                            .bold()
//                            .padding()
//                            .frame(alignment: .topTrailing)
//                        Spacer()
//                    }
//                        Divider()
//                    List{
//                        
////                        TextField("", text: $newName)
//                    }.frame(height: 50, alignment: .topLeading)
//                    .padding()
//        
//                }.frame(height: 0, alignment: .topLeading)
//                    .padding()
                
               
            }
          } .navigationBarTitle("Driver Registration", displayMode: .inline)
        }
    }
}

#Preview {
    driverView()
}
