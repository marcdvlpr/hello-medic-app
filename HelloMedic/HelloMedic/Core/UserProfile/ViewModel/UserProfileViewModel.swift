//
//  UserProfileViewModel.swift
//  HelloMedic
//
//  Created by Apprenant 124 on 01/08/2024.
//

import Foundation

class UserProfileViewModel: ObservableObject {
    @Published var user: User?
    @Published var medicalInfo: MedicalInfo?
    
    private let baseURL = "http://localhost:3000"
    
    func getUserById(userId: String) {
        guard let url = URL(string: "\(baseURL)/users/\(userId)") else {
            print("Error URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedUser = try JSONDecoder().decode(User.self, from: data)
                    DispatchQueue.main.async {
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
    
    func getMedicalInformationById(userId: String) {
        guard let url = URL(string: "\(baseURL)/medicalInformation") else {
            print("Error URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedMedicalInfo = try JSONDecoder().decode([MedicalInfo].self, from: data)
                    
                    let filteredMedicalInfo = decodedMedicalInfo.filter({ $0.userID == userId })[0]

                    DispatchQueue.main.async {
                        self.medicalInfo = filteredMedicalInfo
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
