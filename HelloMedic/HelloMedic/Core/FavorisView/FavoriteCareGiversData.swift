//
//  FavoriteCareGiversData.swift
//  HelloMedic
//
//  Created by Apprenant 125 on 17/08/2024.
//

import Foundation

struct FavoriteCareGiversData {
   static let careGivers: [CareGiver] = [
      CareGiver(
         name: "Dr Mickael Stevensen",
         specialty: "Généraliste",
         image: "dralexandre",
         specialtyImage: "stethoscope"
      ),
      CareGiver(
         name: "Dr Sam Robertson",
         specialty: "Pédiatre",
         image: "drfrancois",
         specialtyImage: "figure.and.child.holdinghands"
      ),
      CareGiver(
         name: "Ms jennyfer Fergusson",
         specialty: "Infirmière",
         image: "drlisa",
         specialtyImage: "syringe"
      ),
      CareGiver(
         name: "Ms johanna Smith",
         specialty: "Kiné",
         image: "drmeredith",
         specialtyImage: "figure.walk"
      ),
      CareGiver(
         name: "Ms Deborah Benett",
         specialty: "Aide-soignante",
         image: "drisabelle",
         specialtyImage: "cross.case"
      )
   ]
}
