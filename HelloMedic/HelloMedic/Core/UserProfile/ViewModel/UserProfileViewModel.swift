//
//  UserProfileViewModel.swift
//  HelloMedic
//
//  Created by Apprenant 124 on 01/08/2024.
//

import Foundation

class UserProfileViewModel: ObservableObject {
    @Published var user: User = User(id: "", email: "", password: "", verified: false, firstName: "", lastName: "", dateOfBirth: Date.now, gender: "", address: "", postalCode: "", city: "", phone: "", picture: "")
    @Published var medicalInfo: MedicalInfo = MedicalInfo(id: "", userID: "", bloodType: "", allergies: "", height: 0, weight: 0, wheelchair: false)
    
    let baseURL = "http://localhost:3000"
    
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
    
    func updateUser(_ user: User) {
        guard let url = URL(string: "\(baseURL)/users/\(user.id)") else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        
        do {
            let data = try JSONEncoder().encode(user)
            request.httpBody = data
        } catch {
            print("Error encoding contact: \(error)")
            return
        }

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error updating contact: \(error)")
                return
            }
            self.getUserById(userId: user.id)
        }.resume()
    }
    
    func deleteUser(userId: String) {
        guard let url = URL(string: "\(baseURL)/users/\(userId)") else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error deleting contact: \(error)")
                return
            }
        }.resume()
    }
}
