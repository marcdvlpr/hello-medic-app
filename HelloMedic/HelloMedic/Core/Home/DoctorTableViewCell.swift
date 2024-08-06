//
//  DoctorTableViewCell.swift
//  HelloMedic
//
//  Created by Apprenant 172 on 05/08/2024.
//

import UIKit

class DoctorTableViewCell: UITableViewCell {
    
    let drImageView = UIImageView()
    let drNameLabel = UILabel()
    let drSpecialtyLabel = UILabel()
    let drDistanceLabel = UILabel()
    let drRatingLabel = UILabel()
    let drAvailabilityLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        doctorNearby()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func doctorNearby() {
        drImageView.contentMode = .scaleAspectFill
        drImageView.clipsToBounds = true
        drImageView.layer.cornerRadius = 25
        drImageView.translatesAutoresizingMaskIntoConstraints = false
        
        drNameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        drNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        drSpecialtyLabel.font = UIFont.systemFont(ofSize: 14)
        drSpecialtyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        drDistanceLabel.font = UIFont.systemFont(ofSize: 14)
        drDistanceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        drRatingLabel.font = UIFont.systemFont(ofSize: 14)
        drRatingLabel.textColor = .orange
        drRatingLabel.translatesAutoresizingMaskIntoConstraints = false
        
        drAvailabilityLabel.font = UIFont.systemFont(ofSize: 14)
        drAvailabilityLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(drImageView)
        contentView.addSubview(drNameLabel)
        contentView.addSubview(drSpecialtyLabel)
        contentView.addSubview(drDistanceLabel)
        contentView.addSubview(drRatingLabel)
        contentView.addSubview(drAvailabilityLabel)
        
        //isActive = True
        NSLayoutConstraint.activate([
            drImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            drImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            drImageView.widthAnchor.constraint(equalToConstant: 50),
            drImageView.heightAnchor.constraint(equalToConstant: 50),
            
            drNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            drNameLabel.leadingAnchor.constraint(equalTo: drImageView.trailingAnchor, constant: 10),
            drNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            drSpecialtyLabel.topAnchor.constraint(equalTo: drNameLabel.bottomAnchor, constant: 5),
            drSpecialtyLabel.leadingAnchor.constraint(equalTo: drImageView.trailingAnchor, constant: 10),
            drSpecialtyLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            drDistanceLabel.topAnchor.constraint(equalTo: drSpecialtyLabel.bottomAnchor, constant: 5),
            drDistanceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            drDistanceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            drRatingLabel.topAnchor.constraint(equalTo: drDistanceLabel.bottomAnchor, constant: 5),
            drRatingLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            drRatingLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            drAvailabilityLabel.topAnchor.constraint(equalTo: drRatingLabel.bottomAnchor, constant: 5),
            drAvailabilityLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            drAvailabilityLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            drAvailabilityLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    func connectToDr(with doctor: Doctor) {
        drImageView.image = UIImage(named: doctor.pictName)
        drNameLabel.text = doctor.name
        drSpecialtyLabel.text = doctor.specialty
        drDistanceLabel.text = doctor.distance
        drRatingLabel.text = doctor.rating.formatted()
        drAvailabilityLabel.text = doctor.availability
    }
}
