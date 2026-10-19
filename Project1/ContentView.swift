//
//  ContentView.swift
//  Project1
//
//  Created by Marta Michelle Caliendo on 13/10/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm: ViewModel = ViewModel()
    @AppStorage("userXP") var userXP = 30
    //@AppStorage(wrappedValue: 10, "userXP") var userXP
    
    init() { //init() è una funzione che serve a dare priorità nella lettura del codice a quello che gli viene dato, in questo caso la visibilità della tab bar 
        let apparence = UITabBarAppearance()
        apparence.configureWithOpaqueBackground()
        UITabBar.appearance().scrollEdgeAppearance = apparence
        //per cambiare colore alla tab bar:
        //UITabBar.appearance().backgroundColor = UIColor(Color.red)
        
        UserDefaults.standard.removeObject(forKey: "userXP")
    }
    
    var body: some View {
        TabView{
            Home2(vm: vm, userXP: $userXP)
                .tabItem {
                    Image(systemName: "figure.mixed.cardio")
                    Text("My Room")
                }
            ItemList(vm: vm, userXP: $userXP)
                .tabItem {
                    Image(systemName: "tray.full.fill")
                    Text("My Items")
                }
            MuseumList(userXP: $userXP)
                .tabItem {
                    Image(systemName: "questionmark.circle")
                    Text("Quiz")
                }
             
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct FirstView: View {
    var body: some View{
        ZStack{
            Color.black
            .opacity(0.5)
            .ignoresSafeArea(edges: .top)
            Text("First View")
        }
    }
}
struct SecondView: View {
    var body: some View{
        ZStack{
            Color.blue
            .opacity(0.5)
            .ignoresSafeArea(edges: .top)
            Text("Second View")
        }
    }
}
struct ThirdView: View {
    var body: some View{
        ZStack{
            Color.red
            .opacity(0.5)
            .ignoresSafeArea(edges: .top)
            Text("Third View")
        }
    }
           
}


