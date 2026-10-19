//
//  Home2.swift
//  Project1
//
//  Created by Marta Michelle Caliendo on 17/10/22.
//

import SwiftUI

struct Home2: View {
    @ObservedObject var vm: ViewModel
    
    @Binding var userXP: Int
    
    //stateobject per inizializzare il view model, quindi creiamo la variabile, diciamo che è di tipo View model e che è uguale (inizializzare è proprio questo) alla classe ViewModel(), si scrive come le view ma sta per classe
    
    @State private var showView: Bool = false
    
    var body: some View {
        NavigationStack{
            //usiamo la scrollview per fixare il bug con .ignores....
            ScrollView(.init()) {
                TabView{
                    Home(showView: $showView, vm: vm, userXP: $userXP)
//                    if  vm.roomUnlocked["Room2"] ?? false {
//                        Room2(showView: $showView, vm: vm)
//                    }
                    if vm.rooms[0].isUnlocked == true {
                        Room2(showView: $showView, vm: vm, userXP: $userXP)
                    }
                }
                //modificatore della tabview(capisce da solo il numero di pagine)
                .tabViewStyle(.page)
            }
            //deve stare fuori dallo scroll
            .ignoresSafeArea(edges: .top)
            .navigationTitle("My Room")
            //per nascondere la toolbar
            .toolbar(.hidden, for: .navigationBar)
            //binding richiede il dollaro per richiamare la variabile
            .sheet(isPresented: $showView) {
                AddView(showView: .constant(false), vm: vm)
            }
            
                
            
        }
     
    }
}

struct Home2_Previews: PreviewProvider {
    static var previews: some View {
        Home2(vm: ViewModel(), userXP: .constant(10)) 
    }
}
//inizializziamo il model qui perchè qui c'è la navigation stack, la tab view, lo scroll view e la sheet is presented che serve a fare l'add items, quindi qui ci sono tutte le view che devono accedere a questo model
