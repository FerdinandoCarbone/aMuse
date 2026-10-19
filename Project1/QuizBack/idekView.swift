//
//  idekView.swift
//  Project1
//
////  Created by Ferdinando Carbone on 27/10/22.
////
//
//import SwiftUI
//
//struct idekView: View {
//    var body: some View {
//        NavigationStack{
//            //usiamo la scrollview per fixare il bug con .ignores....
//            ScrollView(.init()) {
//                TabView{
//                    QuizView()
//                    QuizView()
//                    QuizView()
//                    QuizView()
//                    QuizView()
//                }
//                //modificatore della tabview(capisce da solo il numero di pagine)
//                .tabViewStyle(.page)
//            }
//            //deve stare fuori dallo scroll
//            .ignoresSafeArea(edges: .top)
//            .navigationTitle("Quiz")
//            //per nascondere la toolbar
//            .toolbar(.hidden, for: .navigationBar)
//            //binding richiede il dollaro per richiamare la variabile
//            
//            
//            
//        }
//    }
//}
//struct idekView_Previews: PreviewProvider {
//    static var previews: some View {
//        idekView()
//    }
//}
