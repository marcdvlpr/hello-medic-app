//
//  MyDocumentsView.swift
//  HelloMedic
//
//  Created by Apprenant 162 on 01/08/2024.
//

import SwiftUI

class Ordonnance: Identifiable {
    var id: UUID
    var symbolimage = Image(systemName: "pills")
    var titre: String
    var docname: String
    var date: String
    var symboluser = Image(systemName: "person.fill")
    var username: String
    
    init(id: UUID, symbolimage: Image = Image(systemName: "pills"), titre: String, docname: String, date: String, symboluser: Image = Image(systemName: "person.fill"), username: String) {
        self.id = id
        self.symbolimage = symbolimage
        self.titre = titre
        self.docname = docname
        self.date = date
        self.symboluser = symboluser
        self.username = username
    }
    }

var array = [Ordonnance(id: UUID(), symbolimage: Image(systemName: "pills"), titre: "Ordonnance de médicaments", docname: "Dr KEPNER", date: "26 Juillet 2024", symboluser: Image(systemName: "person.fill"), username: "John DOE"),
    Ordonnance(id: UUID(), symbolimage: Image(systemName: "pills"), titre: "Ordonnance de médicaments", docname: "Dr BAILEY", date: "23 Mai 2024", symboluser: Image(systemName: "person.fill"), username: "John DOE"),
    Ordonnance(id: UUID(), symbolimage: Image(systemName: "pills"), titre: "Ordonnance de médicaments", docname: "Dr CAGE", date: "04 Janvier 2024", symboluser: Image(systemName: "person.fill"), username: "John DOE")]

struct MyDocumentsView: View {
    
    @State private var showingModal = false
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 400, height: 100)
                .foregroundStyle(.hmBlue)
            Text("Mes Documents")
                .font(.largeTitle)
                .foregroundStyle(Color.white)
        }
        List {
            Button(action: {showingModal = true}, label: {
                HStack{
                    Image(systemName: "pills")
                        .foregroundStyle(Color.hmSkyBlue)
                        .padding()
                    Text("Ordonnance de médicaments")
                        .foregroundStyle(Color.hmBlue)
                }
                HStack{
                    Text("Dr KIGUERI")
                        .foregroundStyle(Color.black)
                        .padding()
                    Text("01 Août 2024")
                        .foregroundStyle(Color.black)
                }
                HStack{
                    Image(systemName: "person.fill")
                        .foregroundStyle(Color.hmSkyBlue)
                    Text("John DOE")
                        .foregroundStyle(Color.black)
                }
            })
            
            
            ForEach(array) { document in
                VStack {
                    
                    HStack {
                        
                        Image(systemName: "pills")
                            .foregroundStyle(Color.hmSkyBlue)
                            .padding()
                        Text(document.titre)
                            .foregroundStyle(Color.hmBlue)
                    }
                    HStack {
                        Text(document.docname)
                            .padding()
                        Text(document.date)
                    }
                    HStack {
                        Image(systemName: "person.fill")
                            .foregroundStyle(Color.hmSkyBlue)
                        Text(document.username)
                    }
                }
                .padding(.vertical, 5)
                
            }
            
        }
        .sheet(isPresented: $showingModal) {
            DocumentDetailView()
        }
    }
}
    #Preview {
        MyDocumentsView()
    }

