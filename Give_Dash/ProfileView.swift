//
//  ProfileView.swift
//  Give_Dash
//
//  Created by Elancio Zeigler on 1/28/24.
//
import SwiftUI

struct ProfileView: View {
    @State private var name: String = ""
    @State private var address: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    ZStack{
                        Image("GDbg")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .edgesIgnoringSafeArea(.all)
                        
                        Form {
                            Section(header: Text("Personal Information")) {
                                TextField("Name", text: $name)
                                TextField("Address", text: $address)
                            }
                            
                            Section(header: Text("Security")) {
                                SecureField("New Password", text: $password)
                            }
                            
                            Button("Save Changes") {
                                
                                print("Changes saved")
                            }
                        }
                        .navigationBarTitle("Account Settings")
                    }
                }
            }
        }
    }
}
#Preview {
    ProfileView()
}
