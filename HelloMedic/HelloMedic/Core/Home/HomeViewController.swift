//
//  HomeViewController.swift
//  HelloMedic
//
//  Created by Apprenant 172 on 01/08/2024.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var doctors: [Doctor] = [
        Doctor(pictName: "drlisa", name: "Dr. Lisa MANOBAL", specialty: "Médecin généraliste", rating: 5, distance: "10 Km", availability: "se déplacer à 9h00"),
        Doctor(pictName: "drnicolas", name: "Dr. Nicolas CAGE", specialty: "Pédiatre", rating: 4, distance: "2 Km", availability: "se déplacer à 9h00")
    ]
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupTableView()
    }
    
    private func setupTableView() {
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
    
    // UITableViewDataSource Methods
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
    
    // UITableViewDelegate Methods
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 120
    }
}
