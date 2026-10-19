//
//  Room2.swift
//  Project1
//
//  Created by Marta Michelle Caliendo on 16/10/22.
//

import SwiftUI

struct Room2: View {
    

    @ObservedObject var vm: ViewModel
    @Binding var showView: Bool
    
    @State private var isActive: Bool = false
    @Binding var userXP: Int
  
    var wichRoom: [ObjectsModel] = []
     var filterRoom: [ObjectsModel] = []
     
    init(showView: Binding <Bool>, vm: ViewModel, userXP: Binding <Int>) {//filter array, il bool in questo caso è di tipo binding e va inizializzato con le <>
     self._showView = showView //per andare a modificare/accedere ad un binding si usa _, con l'observedobject non c'è bisogno
     self.vm = vm
         filterRoom = vm.objects.filter({ $0.whichRooms == 2 })
        self._userXP = userXP
     }


   /* @State var objects: [ObjectsModel] = [
        
        ObjectsModel(names: "", image: "quadro1", positionX: 290 , positionY:  460, frame: 140, buttonPosition: 40, whichRooms: 1),
        ObjectsModel(names: "", image: "quadro2", positionX: 100, positionY:  150, frame: 150, buttonPosition: 40, whichRooms: 1),
        ObjectsModel(names: "", image: "mensola", positionX: 298, positionY: 190, frame: 160, buttonPosition: 40, whichRooms: 2),
        ObjectsModel(names: "", image: "lavagna", positionX: 95, positionY:  466, frame: 135, buttonPosition: 40, whichRooms: 2),
        ObjectsModel(names: "", image: "mensola", positionX: 260, positionY:  310, frame: 160, buttonPosition: 40, whichRooms: 2)
    ]*/
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
                Image("tappeto2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 276).position(x: 197, y: 645)
                ZStack{
                    
                    
                    ForEach(filterRoom) {object in
                        ObjectsView(showView: $showView, object: object, selectItem: $vm.selectObject)
                            .position(x: object.positionX, y: object.positionY)
                        
                    }
                }
                
            }
            
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
                .padding(.bottom, 45)
                .padding(.trailing, 20)
                .navigationDestination(isPresented: $isActive) {
                    RoomsList(vm: ViewModel(), userXP: $userXP)
                }
            }
                    
                    /*ZStack{
                        Image("quadro1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150)
                        // .position(x: 210, y: 380)
                        addButton
                    } .position(x: 95, y: 100)
                    ZStack{
                        Image("mensola")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 190)
                            .position(x: 285, y: 150)
                        addButton
                            .position(x: 285, y: 110)
                    }
                    ZStack{
                        Image("mensola")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 190)
                            .position(x: 250, y: 270)
                        addButton
                            .position(x: 252, y: 230)
                    }
                    ZStack{
                        Image("lavagna")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150)
                            .position(x: 100, y: 450)
                        addButton
                            .position(x: 100, y: 415)
                    }
                    ZStack{
                        Image("quadro2")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 140)
                        // .position(x: 210, y: 380)
                        addButton
                    } .position(x: 300, y: 440)*/
                 /*   .navigationTitle("My Room")
                    //per nascondere la toolbar
                    .toolbar(.hidden, for: .navigationBar)
                    //binding richiede il dollaro per richiamare la variabile
                    .navigationDestination(isPresented: $showView) {
                        Text("gggg")
                        
                    }
                }*/
            
        }
    }
}
    struct Room2_Previews: PreviewProvider {
        static var previews: some View {
            Room2(showView: .constant(false), vm: ViewModel(), userXP: .constant(30))
        }
    }
    extension Room2 {
        private var addButton: some View {
            Button{
                showView.toggle()
            }
        label: { Image(systemName: "plus.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 40)
            
        }
      }
    }
    

