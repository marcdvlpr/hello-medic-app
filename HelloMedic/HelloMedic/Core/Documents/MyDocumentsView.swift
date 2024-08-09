//
//  MyDocumentsView.swift
//  HelloMedic
//
//  Created by Apprenant 162 on 01/08/2024.
//
import SwiftUI
import UIKit

struct MyDocumentsView: View {
    let textToShare = "Partager"
    @State private var isShareSheetPresented = false
    @State private var isButtonSelected = false
    @State private var showingModal = false
    
    struct ActivityViewController: UIViewControllerRepresentable {
        let activityItems: [Any]
            
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
                return controller
            }
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
            }
        }
       
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
            Button(action: {
                showingModal = true
                
            }, label: {
                
                HStack{
                    Image(systemName: "pills")
                        .foregroundStyle(Color.hmSkyBlue)
                    
                    Text("Ordonnance de médicaments")
                        .foregroundStyle(Color.hmBlue)
                        .font(.system(size: 19
                                     ))
                }
                
                HStack{
                    Text("Dr KIGUERI")
                        .foregroundStyle(Color.black)
                    
                    Text("01 Août 2024")
                        .foregroundStyle(Color.black)
                    
                }
                HStack{
                    Image(systemName: "person.fill")
                        .foregroundStyle(Color.hmSkyBlue)
                    Text("John DOE")
                        .foregroundStyle(Color.black)
                        .padding()
                    Button(action: {
                    self.isShareSheetPresented.toggle()
                    }) {
                    Image(systemName: "square.and.arrow.up")
                    }
                    .sheet(isPresented: $isShareSheetPresented) {
                ActivityViewController(activityItems: [textToShare])
                    };
                        
                                }
            })
            .sheet(isPresented: $showingModal) {
                DocumentDetailView()
            }
         
            ForEach(array) { document in
                VStack {
                    
                    HStack {
                        
                        Image(systemName: "pills")
                            .foregroundStyle(Color.hmSkyBlue)
                        
                        Text(document.titre)
                            .foregroundStyle(Color.hmBlue)
                            .font(.system(size: 19
                                         ))
                        
                        
                    }
                    HStack {
                        Text(document.docname)
                        
                        Text(document.date)
                    }
                    HStack {
                        Image(systemName: "person.fill")
                            .foregroundStyle(Color.hmSkyBlue)
                        Text(document.username)
                            .padding()
                        Image(systemName: "square.and.arrow.up")
                            .foregroundStyle(Color.blue)
                    }
                }
                .padding(.vertical, 5)
                
            }

            }
            
            }

        }
    
    #Preview {
        MyDocumentsView()
    }

