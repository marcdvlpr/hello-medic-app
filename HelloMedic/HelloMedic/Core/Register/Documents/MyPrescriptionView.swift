//
//  MyDocumentsView.swift
//  HelloMedic
//
//  Created by Apprenant 162 on 01/08/2024.
//
import SwiftUI
import UIKit

struct MyPrescriptionView: View {
    @StateObject private var viewModel = MyPrescription()
    @State private var showingModal = false
    
    
    var body: some View {
       
        
        NavigationView {
            VStack{
                ZStack{
                    Rectangle()
                        .frame(width: 400, height: 100)
                        .foregroundStyle(.hmBlue)
                    Text("Mes Documents")
                        .font(.largeTitle)
                        .foregroundStyle(Color.white)
                }
                
                List(viewModel.ordonnance) { ordo in
                    Button(action: {
                        showingModal = true
                    }, label: {
                        HStack{
                            Image(systemName: "pills")
                                .foregroundStyle(Color.hmSkyBlue)
                            
                            Text(ordo.titre)
                                .foregroundStyle(Color.hmBlue)
                                .font(.system(size: 19
                                             ))
                        }
                        HStack{
                            Text(ordo.docname)
                                .foregroundStyle(Color.black)
                            
                            Text(ordo.date)
                                .foregroundStyle(Color.black)
                        }
                        HStack{
                            Image(systemName: "person.fill")
                                .foregroundStyle(Color.hmSkyBlue)
                            Text(ordo.username)
                                .foregroundStyle(Color.black)
                                .padding()
                            
                            Button(action: {
                            }) {
                            Image(systemName: "square.and.arrow.up")
                            }
                        }
                    })
                    .sheet(isPresented: $showingModal) {
                        DocumentDetailView()
                    }
                }
                .onAppear {
                    viewModel.fetchordonnance()
                }
            }
        }
         
    }
}
    

    #Preview {
        MyPrescriptionView()
    }

