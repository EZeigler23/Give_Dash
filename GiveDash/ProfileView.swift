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
    @State private var selectedAllergies: Set<String> = []
    @State private var showPopover: Bool = false
    let allergies = ["Eggs", "Soy", "Wheat", "Shellfish", "Milk & Dairy", "Tree Nut", "Peanuts", "Sesame", "Fish"]
    let popoverTexts = [
        "Food insecurity is a systemic issue that can happen to anyone, not a personal failure",
        "44 million people in the US face hunger, including 1 in 5 children in 2022",
        "1 in 8 Americans are estimated to be food insecure."
    ]
    
    // UserDefaults key for storing profile data
    let profileKey = "profileData"
    
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
                                        .foregroundColor(Color(hex:"263F56"))
                                }
                                .padding()
                                .popover(isPresented: $showPopover, arrowEdge: .top) {
                                    VStack {
                                        ScrollView{
                                            Text(popoverTexts.randomElement() ?? "") // Selecting a random text
                                                .bold()
                                                .padding()
                                                .presentationCompactAdaptation(.popover)
                                                .fixedSize(horizontal: false, vertical: true)
                                                .multilineTextAlignment(.center)
                                        }
                                        
                                    }
                                }
                            }
                            
                            VStack {
                                Spacer(minLength: 110)
                                Form {
                                    Section(header: Text("Personal Information")) {
                                        TextField("Name", text: $name)
                                        TextField("Address", text: $address)
                                    }
                                    
                                    Section(header: Text("Security")) {
                                        SecureField("New Password", text: $password)
                                    }
                                }
                                .background(Color.gray.opacity(0.2)) // Changed to a more neutral color
                                .cornerRadius(10) // Added corner radius for aesthetics
                                .padding()
                                .frame(width: 400, height: 300, alignment: .leading)                            /*.navigationBarTitle("Account Settings")*/
                                
                                Text("Allergy List")
                                    .bold()
                                    .padding(.top) // Added padding for separation
                                
                                LazyVGrid(columns: [GridItem(.adaptive(minimum: 120), spacing: 20)], spacing: 20) {
                                    ForEach(allergies, id: \.self) { allergy in
                                        Toggle(isOn: Binding(
                                            get: { selectedAllergies.contains(allergy) },
                                            set: { isSelected in
                                                if isSelected {
                                                    selectedAllergies.insert(allergy)
                                                } else {
                                                    selectedAllergies.remove(allergy)
                                                }
                                            }
                                        )) {
                                            Text(allergy)
                                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                                                .background(selectedAllergies.contains(allergy) ? Color.green : Color.gray)
                                                .bold()
                                                .foregroundColor(.white)
                                                .cornerRadius(10)
                                                .padding()
                                        }
                                    }
                                }
                                .padding()
                                Spacer()
                                
                                Button("Save Changes") {
                                    // Save profile data
                                    saveProfileData()
                                }
                                .bold()
                                .frame(width: 180, height: 42)
                                .foregroundColor(.white)
                                .background(Color.green)
                                .cornerRadius(8)
                            }.padding()
                        }
                    }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading) // Adjusted frame
                        .navigationBarTitle("Account Profile", displayMode: .inline).bold()
                )
        }
        .onAppear {
            // Load profile data when the view appears
            loadProfileData()
        }
    }
    
    // Function to save profile data
    private func saveProfileData() {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(ProfileData(name: name, address: address, password: password, allergies: Array(selectedAllergies)))
            UserDefaults.standard.set(data, forKey: profileKey)
        } catch {
            print("Error saving profile data: \(error.localizedDescription)")
        }
    }
    
    // Function to load profile data
    private func loadProfileData() {
        if let data = UserDefaults.standard.data(forKey: profileKey) {
            do {
                let decoder = JSONDecoder()
                let profileData = try decoder.decode(ProfileData.self, from: data)
                name = profileData.name
                address = profileData.address
                password = profileData.password
                selectedAllergies = Set(profileData.allergies)
            } catch {
                print("Error loading profile data: \(error.localizedDescription)")
            }
        }
    }
}

struct ProfileData: Codable {
    var name: String
    var address: String
    var password: String
    var allergies: [String]
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
