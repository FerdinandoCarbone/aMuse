//
//  Home.swift
//  Project1
//
//  Created by Marta Michelle Caliendo on 13/10/22.
//Home di prova

import SwiftUI
struct Home: View {
    //quando il valore buleano passa da zero a uno deve cambiare la view
    @Binding var showView: Bool
    @ObservedObject var vm : ViewModel
    
    @Binding var userXP: Int
    
    @State private var isActive: Bool = false
    
    var wichRoom: [ObjectsModel] = []
    var filterRoom: [ObjectsModel] = []
    
    init(showView: Binding <Bool>, vm: ViewModel, userXP: Binding <Int>) {//filter array, il bool in questo caso è di tipo binding e va inizializzato con le <>
        self._showView = showView //per andare a modificare/accedere ad un binding si usa _, con l'observedobject non c'è bisogno
        self.vm = vm
        filterRoom = vm.objects.filter({ $0.whichRooms == 1 })
        self._userXP = userXP
    }
    
    
    //la prima volta che dichiaro il model lo dichiaro come @stateobject, le altre volte che lo devo passare lo richiamo come @observedobject, in questo caso senza paresentesi perchè lo stiamo solo richiamando senza inizianizzarlo
    
    var body: some View {
        // NavigationStack{
        
        VStack {
            ZStack{
                Color("Color1")
                    .ignoresSafeArea()
                
                
                Image("parquet")
                    .padding(.top, 200)
                    .frame(height: 40)
                    .position(x: 195, y: 600)
                
                
                Image("tappeto")
                    .position(x: 196, y: 650)
                
                ZStack{
                    ///
                    ForEach(filterRoom) {object in
                        ObjectsView(showView: $showView, object: object, selectItem: $vm.selectObject)
                            .position(x: object.positionX, y: object.positionY)
                        
                        
                    }
                    
                    
                    /*  ForEach(objects) { object in
                     
                     Image(object.image)
                     .resizable()
                     .scaledToFit()
                     .frame(width: object.frame)
                     .position(x: object.positionX, y: object.positionY)
                     ObjectsView(showView: $showView)*/
                    
                    
                }
            }
            Spacer()
            HStack {
                Spacer()
                HStack {
                    Image(systemName: "plus.circle")
                        .foregroundColor(.accentColor)
                    Button("Add Room") {
                        isActive.toggle()
                    }
                }
                .fontWeight(.bold)
                .padding(.all,5)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color("LightGray")))
                //.opacity(20.0)
                .padding(.bottom, 45)
                .padding(.trailing, 20)
                .navigationDestination(isPresented: $isActive) {
                    RoomsList(vm: ViewModel(), userXP: $userXP)
            }
        }
    }
}
}


// .navigationTitle("Add")
// .navigationBarTitleDisplayMode(.inline)
//  .padding()





//.navigationTitle("My Room")
//per nascondere la toolbar
//.toolbar(.hidden, for: .navigationBar)
//binding richiede il dollaro per richiamare la variabile
/*.navigationDestination(isPresented: $showView) {
 Text("gggg")
 
 }*/
// }


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home(showView: .constant(false), vm: ViewModel(), userXP: .constant(10))
        //per inizializzare il binding
    }
    
}




/*
 // NavigationStack{
 
 ZStack{
 Color("Color1")
 .ignoresSafeArea()
 
 
 Image("parquet")
 .padding(.top, 200)
 .frame(height: 40)
 .position(x: 195, y: 600)
 Image("mobile")
 .padding(.bottom, 420)
 .frame(height: 30)
 .position(x: 330, y: 730)
 addButton
 .position(x: 330, y: 438)
 
 Image("tappeto")
 .position(x: 196, y: 650)
 //Per mettere l'immagine e il buttom stack a parte
 
 ZStack {
 ZStack{
 Image("quadro1")
 .resizable()
 .scaledToFit()
 .frame(width: 140)
 // .position(x: 210, y: 380)
 addButton
 }
 .position(x: 210, y: 356)
 
 /*      Button {
  showView.toggle()
  } label: {
  Image(systemName: "plus.circle")
  .resizable()
  .scaledToFit()
  .frame(width: 40)
  
  }*/
 }
 .position(x: 80, y: 140)
 ZStack {
 Image("quadro2")
 .resizable()
 .scaledToFit()
 .frame(width: 160)
 // .position(x: 200, y: 420)
 addButton
 
 }
 .position(x: 295, y: 190)
 ZStack{
 Image("quadro1")
 .resizable()
 .scaledToFit()
 .frame(width: 180)
 // .position(x: 100, y: 300)
 addButton }
 .position(x: 100, y: 300)
 }
 
 
 
 //.navigationTitle("My Room")
 //per nascondere la toolbar
 //.toolbar(.hidden, for: .navigationBar)
 //binding richiede il dollaro per richiamare la variabile
 /*.navigationDestination(isPresented: $showView) {
  Text("gggg")
  
  }*/
 // }
 */
