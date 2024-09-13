//
//  MyPrescription.swift
//  HelloMedic
//
//  Created by Apprenant 162 on 12/09/2024.
//

import Foundation

class MyPrescription: ObservableObject {
    @Published var ordonnance: [Ordonnance] = []
    
    func fetchordonnance() {
        guard let url = URL(string: "http://localhost:3000/ordonnance") else {
            print("Invalid URL")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedordonnance = try JSONDecoder().decode([Ordonnance].self, from: data)
                    DispatchQueue.main.async {
                        self.ordonnance = decodedordonnance
                    }
                } catch {
                    print("Error decoding data: \(error)")
                }
            } else if let error = error {
                print("Error fetching data \(error)")
            }
        }.resume()
    }
    
}
