//
//  RegisterView.swift
//  HelloMedic
//
//  Created by Apprenant 162 on 29/07/2024.
//

import SwiftUI

/// Structure RegisterView pour s'enregistrer lorsqu'on arrive sur l'application
struct RegisterViewTwo: View {
    /// Variable d'état pour le prénom
    @State private var firstname: String = ""
    /// Variable d'état pour le nom
    @State private var lastname: String = ""
    /// Variable d'état pour  la date de naissance
    @State private var dateofBirth: Date = Calendar.current.date(byAdding: .year, value: 0, to: Date()) ?? Date()
    /// Variable d'état pour l'adresse
    @State private var address: String = ""
    /// Variable d'état pour le code postale
    @State private var zipcode: String = ""
    /// Variable d'état pour la ville
    @State private var city: String = ""
    /// Variable d'état pour le genre
    @State private var selectedgender: Int = 0
    /// Variable d'état pour afficher la vue Popup
    @State private var isShowingPopup: Bool = false
   
    /// Déclaration de la constante pour
    let genders = ["Homme", "Femme", "Autre"]
    
    /// Variable pour vérifier si tous les champs obligatoires sont remplis et si la date de naissance est autre que celle du jour
    var isFormValid: Bool {
    !firstname.isEmpty && !lastname.isEmpty && !address.isEmpty && !zipcode.isEmpty && !city.isEmpty && Calendar.current.isDateInToday(dateofBirth) == false }
    
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 400, height: 100)
                .foregroundStyle(.hmBlue)
            Text("S'enregistrer")
                .font(.largeTitle)
                .foregroundStyle(Color.white)
        }
        Form{
            Section{
             Text("Informations personnelles requises")
                Picker("Sélectionnez votre genre", selection: $selectedgender) {
                    ForEach(0..<3) { index in
                        Text(self.genders[index]).tag(index).font(.title)
                             }
                }
                TextField("Prénom", text: $firstname)
                TextField("Nom", text: $lastname)
                DatePicker("Date de Naissance", selection: $dateofBirth, in: ...Calendar.current.date(byAdding: .day, value: 0, to: Date())!, displayedComponents: .date)
                TextField("Adresse complète", text: $address)
                TextField("Code Postal", text: $zipcode)
                TextField("Ville", text: $city)
            }
        }
            Button(action: {
       /// Affiche la vue modale si tous les champs sont complétés
                isShowingPopup = true
                           }) {
                Text("Soumettre")
                    .padding()
                           }.sheet(isPresented: $isShowingPopup) {
                               PopupView(isShowingPopup: $isShowingPopup)
                           }
                           .disabled(!isFormValid)
    }
}
struct PopupView: View {
    /// Variable qui détermine si la pop-up est affichée
    @Binding var isShowingPopup: Bool
    
    var body: some View {
        VStack {
            Text("Vos informations on bien été enregistrées. Elles seront transmises à vos praticiens.")
                .font(.largeTitle)
                .padding()
                .foregroundStyle(Color.white)
            Button(action: {
                isShowingPopup = false
            }) {
            Text("Fermer")
                    .padding()
                    .background(Color.hmBlue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.hmSkyBlue)
        .cornerRadius(20)
        .shadow(radius: 20)
        .padding()
    }
}
#Preview {
    RegisterViewTwo()
}
