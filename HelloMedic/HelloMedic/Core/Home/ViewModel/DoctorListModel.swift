//
//  DoctorListModel.swift
//  HelloMedic
//
//  Created by Apprenant 172 on 01/08/2024.
//

import Foundation

/// Une classe qui gère la liste des médecins et les filtres de recherche.
class DoctorListViewModel: ObservableObject {
    
    @Published var doctors: [Doctor] = []
    @Published var searchText: String = ""
    @Published var specialty: String = ""
    
    private let baseURL = "http://localhost:3000/doctors"
    
    func fetchDoctors() {
        guard let url = URL(string: baseURL) else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedContacts = try JSONDecoder().decode([Doctor].self, from: data)
                    DispatchQueue.main.async {
                        self.doctors = decodedContacts
                    }
                } catch {
                    print("Error decoding data: \(error)")
                }
            } else if let error = error {
                print("Error fetching data: \(error)")
            }
        }.resume()
    }
    
    // Filtrage combiné par texte de recherche et spécialité (OCP)
        var filteredDoctors: [Doctor] {
            doctors.filter { doctor in
                let matchesSearchText = searchText.isEmpty ||
                    doctor.name.lowercased().contains(searchText.lowercased()) ||
                    doctor.specialty.lowercased().contains(searchText.lowercased())
                
                
                let matchesSpecialty = specialty.isEmpty || doctor.specialty == specialty
                
                return matchesSearchText && matchesSpecialty
            }
        }
    }
