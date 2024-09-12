//
//  UserProfileViewModel.swift
//  HelloMedic
//
//  Created by Apprenant 124 on 01/08/2024.
//

import Foundation

class UserProfileViewModel: ObservableObject {
    @Published var user: User?
    @Published var medicalInfo: MedicalInfo
    
    let baseURL = "http://localhost:3000/users"
    
    init() {
        self.medicalInfo = JSONLoader.load("medicalInfoData.json")
    }
    
    func getUserById(userId: String) {
        guard let url = URL(string: "\(baseURL)/\(userId)") else {
            print("Error URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedUser = try JSONDecoder().decode(User.self, from: data)
                    DispatchQueue.main.async {
                        print(self.user ?? "")
                        self.user = decodedUser
                    }
                } catch {
                    print("Error decoding data: \(error)")
                }
            } else if let error = error {
                print("Error fetching data: \(error)")
            }
        }.resume()
    }
}
