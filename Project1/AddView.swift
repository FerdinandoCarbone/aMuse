//
//  Select_Items.swift
//  Project1
//
//  Created by Marta Michelle Caliendo on 17/10/22.
//

import SwiftUI

struct AddView: View {
    @Binding var showView: Bool
    @ObservedObject var vm: ViewModel
    @Environment (\.dismiss) private var dismiss //nuova variabile environment per il dismiss
    
    //Questa variabile è uguale all'array [] del nostro model
    /*
     let items: [ItemsModel] = [
     ItemsModel(title: "", subtitle: "", image: "Image1", isUnlocked: true),
     ItemsModel(title: "opera2", subtitle: "desc2", image: "square.and.arrow.up.circle.fill", isUnlocked: true),
     ItemsModel(title: "opera3", subtitle: "desc3", image: "square.and.arrow.down", isUnlocked: true),
     ItemsModel(title: "opera4", subtitle: "desc4", image: "square.and.arrow.down.on.square.fill", isUnlocked: true),
     ItemsModel(title: "opera5", subtitle: "desc5", image: "pencil.slash", isUnlocked: true)
     ]
     */
    let columns: [GridItem] = [
        GridItem(.flexible()),     //quante grid tante colonne
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    //  @State var itemsToShow: String
    // only possible values: "vertical", "horizontal", "nonPainting"
    
    let verticalPaintings: [ItemsModel] = items.filter({ !$0.isLocked && $0.isPainting && $0.isVertical })
    let horizontalPaintings: [ItemsModel] = items.filter({ !$0.isLocked && $0.isPainting && !$0.isVertical })
    let nonPaintings: [ItemsModel] = items.filter({ !$0.isLocked && !$0.isPainting })
    
    var body: some View {
        
        NavigationStack{
            
            ScrollView{
                
                LazyVGrid(columns: columns,alignment: .leading) {
                    switch vm.selectObject?.orientation {
                    case "vertical":
                        ForEach(verticalPaintings) { item in    //per ogni elemento in items crea una view
                            Image(item.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .clipped()
                                .cornerRadius(5)
                                .onTapGesture {
                                    print(item.name)
                                    if vm.selectObject != nil {
                                        
                                        if let selectObject = vm.selectObject {
                                            let newItmes: ObjectsModel = ObjectsModel(id: selectObject.id, names: item.imageName, image: selectObject.image, positionX: selectObject.positionX, positionY: selectObject.positionY, frameWidht: selectObject.frameWidht, frameHeight: selectObject.frameHeight, buttonPosition: selectObject.buttonPosition,
                                                                                      whichRooms: selectObject.whichRooms, orientation: selectObject.orientation)
                                            vm.addItem(object: newItmes)
                                            dismiss()
                                            
                                        }//non si può lavorare con i valori nulli, quindi con if let stiamo dicendo al codice di leggere la variabile solo se il valore non è nullo. Altrimenti l'app crasherebbe. Questo è un modo, un altro sarebbe fornire un valore alternativo da utilizzare se il valore è nullo: ?? 10 .
                                        
                                    }
                                }
                        }
                    case "horizontal":
                        ForEach(horizontalPaintings) { item in    //per ogni elemento in items crea una view
                            Image(item.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .clipped()
                                .cornerRadius(5)
                                .onTapGesture {
                                    print(item.name)
                                    if vm.selectObject != nil {
                                        
                                        if let selectObject = vm.selectObject {
                                            let newItmes: ObjectsModel = ObjectsModel(id: selectObject.id, names: item.imageName, image: selectObject.image, positionX: selectObject.positionX, positionY: selectObject.positionY, frameWidht: selectObject.frameWidht, frameHeight: selectObject.frameHeight, buttonPosition: selectObject.buttonPosition, whichRooms: selectObject.whichRooms, orientation: selectObject.orientation)
                                            vm.addItem(object: newItmes)
                                            dismiss()
                                            
                                        }//non si può lavorare con i valori nulli, quindi con if let stiamo dicendo al codice di leggere la variabile solo se il valore non è nullo. Altrimenti l'app crasherebbe. Questo è un modo, un altro sarebbe fornire un valore alternativo da utilizzare se il valore è nullo: ?? 10 .
                                        
                                    }
                                }
                        }
                    case "nonPainting":
                        ForEach(nonPaintings) { item in    //per ogni elemento in items crea una view
                            Image(item.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .clipped()
                                .cornerRadius(5)
                                .onTapGesture {
                                    print(item.name)
                                    if vm.selectObject != nil {
                                        
                                        if let selectObject = vm.selectObject {
                                            let newItmes: ObjectsModel = ObjectsModel(id: selectObject.id, names: item.imageName, image: selectObject.image, positionX: selectObject.positionX, positionY: selectObject.positionY, frameWidht: selectObject.frameWidht, frameHeight: selectObject.frameHeight, buttonPosition: selectObject.buttonPosition, whichRooms: selectObject.whichRooms, orientation: selectObject.orientation)
                                            vm.addItem(object: newItmes)
                                            dismiss()
                                            
                                        }//non si può lavorare con i valori nulli, quindi con if let stiamo dicendo al codice di leggere la variabile solo se il valore non è nullo. Altrimenti l'app crasherebbe. Questo è un modo, un altro sarebbe fornire un valore alternativo da utilizzare se il valore è nullo: ?? 10 .
                                        
                                    }
                                }
                        }
                    default:
                        Text("Error")
                    }
                }
                .navigationTitle("Add Items")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Cancel") {
                            dismiss()
                        }
                    }
                })
                .padding()
            }
        }
    }
}

struct Select_Items_Previews: PreviewProvider {
    static var previews: some View {
        AddView(showView: .constant(false), vm: ViewModel())
    }
}

