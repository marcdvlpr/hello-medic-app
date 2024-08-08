import SwiftUI

struct FilterSpecialistView: View {
    @StateObject private var careGiverslist = SpecialistsDataList()

    let specialties = [
        ("Médecin généraliste", "stethoscope", "Généraliste"),
        ("Pédiatre", "figure.child", "Pédiatre"),
        ("Infirmière", "syringe", "Infirmière"),
        ("Kinésithérapeute", "figure.elliptical", "Kiné"),
        ("Aide-soignant", "thermometer.variable.and.figure", "Aide-soignant")
    ]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(specialties, id: \.0) { specialty, icon, label in
                    VStack {
                        NavigationLink(destination: FilterButtonView().environmentObject(careGiverslist).onAppear {
                            careGiverslist.specialty = specialty
                        }) {
                            Image(systemName: icon)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35, height: 35)
                                .padding(7.5)
                                .foregroundColor(Color.blue)
                        }
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.circle)
                        .tint(Color.gray.opacity(0.1))

                        Text(label)
                    }
                    .padding(.top, 50)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct CareGiverPictures_Previews: PreviewProvider {
    static var previews: some View {
        FilterSpecialistView()
    }
}
