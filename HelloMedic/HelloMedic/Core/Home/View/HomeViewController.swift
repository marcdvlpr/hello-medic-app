//
//  HomeViewController.swift
//  HelloMedic
//
//  Created by Apprenant 172 on 01/08/2024.
//

import UIKit
import SwiftUI

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var doctors: [Doctor] = [
        Doctor(id: "", pict: "drlisa", name: "Lisa MANOBAL", specialty: "Médecin généraliste", rating: 5, distance: "1,2 Km", availability: "se déplacer à 9h00", perimeter :"20km autour de Paris 75008", phoneNumber: "01 42 76 23 58", paymentMethod: "Chèque, espèces et cartes bancaires\n• Conventionné\n• Tiers payant : Sécurité sociale et mutuelle\n• Carte Vitale acceptée", languages: "Français\nEspagnol", horaires: "30km autour de Paris 75003", certification: MedicalCertification(school: "Université de Paris", diplome: "Diplôme d'État de Docteur en Médecine")),
        
        Doctor(id: "", pict: "drnicolas", name: "Nicolas CAGE", specialty: "Pédiatre", rating: 4, distance: "1,1 Km", availability: "se déplacer à 9h00", perimeter: "40km autour de Paris 75018", phoneNumber: "01 83 94 67 82", paymentMethod: "Chèque, espèces et cartes bancaires\n• Conventionné\n• Tiers payant : Sécurité sociale et mutuelle\n• Carte Vitale acceptée", languages: "Français\nAllemand", horaires: "",certification: MedicalCertification(school: "Université de Paris", diplome: "Diplôme d'État de Docteur en Médecine")),
        
        Doctor(id: "", pict: "drmiranda", name: "Miranda BAILEY", specialty: "Kinésithérapeute", rating: 5, distance: "1 Km", availability: "se déplacer à 9h00",perimeter: "20km autour de Paris 75009", phoneNumber: "01 43 28 91 46", paymentMethod: "Chèque, espèces et cartes bancaires\n• Conventionné\n• Tiers payant : Sécurité sociale et mutuelle\n• Carte Vitale acceptée", languages: "Français\nAnglais", horaires: "", certification: MedicalCertification(school: "IFMK de l'Université de Paris", diplome: "Diplôme d'État de Masseur-Kinésithérapeute"))
    ]
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        doctorNearbyTableView()
    }
    
    private func doctorNearbyTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DoctorTableViewCell.self, forCellReuseIdentifier: "DoctorCell")
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return doctors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DoctorCell", for: indexPath) as! DoctorTableViewCell
        let doctor = doctors[indexPath.row]
        //DoctorTableViewCell
        cell.connectToDr(with: doctor)
        return cell
    }
    
    // UITableViewDelegate heightForRowAt
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 120
    }
    
    // didSelectRowAt cell detail
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            _ = doctors[indexPath.row]
        let detailView = ProfilSpecialistView(specialist: doctors[indexPath.row])
            let hostingController = UIHostingController(rootView: detailView)
            navigationController?.pushViewController(hostingController, animated: true)
        }
}
