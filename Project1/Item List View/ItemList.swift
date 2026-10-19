//
//  ItemList.swift
//
//  Created by Serena on 20/10/22.
//  Copyright © 2022 Apple. All rights reserved.
//

import Foundation
import SwiftUI


enum FilterType: String {
    case locked = "Locked Items"
    case unlocked = "Unlocked Items"
    case room = "Rooms"
}

class ArrayFilteredItems: ObservableObject {
    @Published var dataArray: [ItemsModel] = []
    @Published var filteredArray: [ItemsModel] = []
    
    @Published var verticalItems: [ItemsModel] = []
    @Published var horizontalItems: [ItemsModel] = []
    @Published var nonPaintingItems: [ItemsModel] = []
    
    @Published var filteredVertical: [ItemsModel] = []
    @Published var filteredHorizontal: [ItemsModel] = []
    @Published var filteredNonPainting: [ItemsModel] = []
    
    init() {
        for item in items {
            dataArray.append(item)
            filteredArray.append(item)
            
            if item.isPainting {
                if item.isVertical {
                    verticalItems.append(item)
                    filteredVertical.append(item)

                } else {
                    horizontalItems.append(item)
                    filteredHorizontal.append(item)
                }
            } else {
                nonPaintingItems.append(item)
                filteredNonPainting.append(item)
            }
        }
    }
    
    func updateFilteredArray() {
        // filteredArray = filteredArray.filter({ !$0.isLocked })
        
        filteredVertical = filteredVertical.filter({ !$0.isLocked })
        filteredHorizontal = filteredHorizontal.filter({ !$0.isLocked })
        filteredNonPainting = filteredNonPainting.filter({ !$0.isLocked })
    }
}

struct ItemList: View {
    @State private var isFiltered: Bool = false
    
    @StateObject var array = ArrayFilteredItems()
    
    @ObservedObject var vm: ViewModel
    @State var isNavigated: Bool = false
    
    @State var tmp: Int = 0
    
    @State private var selectedItem: ItemsModel? = nil
    // var filteredItems: [Item]
    
    //var score = UserDefaults.standard.integer(forKey: "userXP")
    @Binding var userXP: Int
    // var filteredItems: [Item]
    
    var body: some View {
        NavigationStack {
            
            VStack {
                HStack{
                    Text("XP: \(userXP)")
                    Image(systemName: "trophy").foregroundColor(Color("Yellow"))
                }
                .font(.title2)
                .fontWeight(.semibold)
                
                List {
                    Section(header: Text("HORIZONTAL PAINTINGS")) {
                        ForEach(array.filteredHorizontal) { item in
                            ZStack {
                                ItemRow(item: item)
                                    .onTapGesture {
                                        isNavigated.toggle()
                                        selectedItem = item
                                    }
                                    .listRowSeparator(.hidden)
                                
                                VStack {
                                    Spacer()
                                    HStack {
                                        Spacer()
                                        if item.isLocked == true {
                                            Button("\(item.price) XP") {
                                                // buy function
                                                tmp = item.buyItem(userXP: userXP, item: item)
                                                UserDefaults.standard.set(tmp, forKey: "userXP")
                                            }
                                            .font(.system(size: 18, weight: .bold))
                                            .padding(.horizontal, 8)
                                            .padding(.vertical, 5)
                                            .frame(width: 70)
                                            .background(Color("LightGray").cornerRadius(20))
                                            .foregroundColor(Color.accentColor)
                                            
                                        } else {
                                            Image(systemName:"checkmark.circle")
                                                .bold()
                                                .font(.title2)
                                                .foregroundColor(.blue)
                                                .padding(.trailing, 6)
                                        }
                                    }
                                    .padding(.bottom, 5)
                                }
                            }
                        }
                    }
                    Section(header: Text("VERTICAL PAINTINGS")) {
                        ForEach(array.filteredVertical) { item in
                            ZStack {
                                ItemRow(item: item)
                                    .onTapGesture {
                                        isNavigated.toggle()
                                        selectedItem = item
                                    }
                                    .listRowSeparator(.hidden)
                                
                                VStack {
                                    Spacer()
                                    HStack {
                                        Spacer()
                                        if item.isLocked == true {
                                            Button("\(item.price) XP") {
                                                // buy function
                                                tmp = item.buyItem(userXP: userXP, item: item)
                                                UserDefaults.standard.set(tmp, forKey: "userXP")
                                            }
                                            .font(.system(size: 18, weight: .bold))
                                            .padding(.horizontal, 8)
                                            .padding(.vertical, 5)
                                            .frame(width: 70)
                                            .background(Color("LightGray").cornerRadius(20))
                                            .foregroundColor(Color.accentColor)
                                            
                                        } else {
                                            Image(systemName:"checkmark.circle")
                                                .bold()
                                                .font(.title2)
                                                .foregroundColor(.blue)
                                                .padding(.trailing, 6)
                                        }
                                    }
                                    .padding(.bottom, 5)
                                }
                            }
                        }
                    }
                    Section(header: Text("OBJECTS")) {
                        ForEach(array.filteredNonPainting) { item in
                            ZStack {
                                ItemRow(item: item)
                                    .onTapGesture {
                                        isNavigated.toggle()
                                        selectedItem = item
                                    }
                                    .listRowSeparator(.hidden)
                                
                                VStack {
                                    Spacer()
                                    HStack {
                                        Spacer()
                                        if item.isLocked == true {
                                            Button("\(item.price) XP") {
                                                // buy function
                                                tmp = item.buyItem(userXP: userXP, item: item)
                                                UserDefaults.standard.set(tmp, forKey: "userXP")
                                            }
                                            .font(.system(size: 18, weight: .bold))
                                            .padding(.horizontal, 8)
                                            .padding(.vertical, 5)
                                            .frame(width: 70)
                                            .background(Color("LightGray").cornerRadius(20))
                                            .foregroundColor(Color.accentColor)
                                            
                                        } else {
                                            Image(systemName:"checkmark.circle")
                                                .bold()
                                                .font(.title2)
                                                .foregroundColor(.blue)
                                                .padding(.trailing, 6)
                                        }
                                    }
                                    .padding(.bottom, 5)
                                }
                            }
                        }
                    }
                }
                
                //                List(array.filteredArray) { item in
                //                    //List(array.horizontalItems) { horiz in
                //                        ZStack {
                //                            ItemRow(item: item)
                //                                .onTapGesture {
                //                                    isNavigated.toggle()
                //                                    selectedItem = item
                //                                }
                //                                .listRowSeparator(.hidden)
                //
                //                            VStack {
                //                                Spacer()
                //                                HStack {
                //                                    Spacer()
                //                                    if item.isLocked == true {
                //                                        Button("\(item.price) XP") {
                //                                            // buy function
                //                                            tmp = item.buyItem(userXP: userXP, item: item)
                //                                            UserDefaults.standard.set(tmp, forKey: "userXP")
                //                                        }
                //                                        .font(.system(size: 18, weight: .bold))
                //                                        .padding(.horizontal, 8)
                //                                        .padding(.vertical, 5)
                //                                        .frame(width: 70)
                //                                        .background(Color("LightGray").cornerRadius(20))
                //                                        .foregroundColor(Color.accentColor)
                //
                //                                    } else {
                //                                        Image(systemName:"checkmark.circle")
                //                                            .bold()
                //                                            .font(.title2)
                //                                            .foregroundColor(.blue)
                //                                            .padding(.trailing, 6)
                //                                    }
                //                                }
                //                                .padding(.bottom, 5)
                //                            }
                //                        }
                //
                //
                //                }
                //            }
                .navigationDestination(isPresented: $isNavigated) {
                    if let selectedItem {
                        ItemDetail(item: selectedItem)
                    }
                }
                .listStyle(.plain)
                .navigationTitle("My Items")
                .toolbar {
                    Button(isFiltered ? "\(Image(systemName: "line.3.horizontal.decrease.circle.fill"))" : "\(Image(systemName: "line.3.horizontal.decrease.circle"))") {
                        isFiltered.toggle()
                        
                        if isFiltered {
                            array.updateFilteredArray()
                        } else {
                            array.filteredVertical = array.verticalItems
                            array.filteredHorizontal = array.horizontalItems
                        }
                    }
                }
            }
        }
        
    }
}



//struct ItemList: View {
//    @ObservedObject var vm: ViewModel
//    @State private var isFiltered: Bool = false
//    @State private var filter: FilterType = .unlocked
//    @State var isNavigated: Bool = false
//
//    @State var tmp: Int = 0
//
//    @StateObject var array = ArrayFilteredItems()
//
//    @State private var selectedItem: ItemsModel? = nil
//    // var filteredItems: [Item]
//
//    //var score = UserDefaults.standard.integer(forKey: "userXP")
//    @Binding var userXP: Int
//
//    var body: some View {
//        NavigationStack {
//
//            VStack {
//
//                HStack{
//                    Text("XP: \(userXP)")
//                    Image(systemName: "trophy").foregroundColor(Color("Yellow"))
//                }
//                .font(.title2)
//                .fontWeight(.semibold)
//
//                if filter != .room {
//                    List(array.filteredArray) { item in
//                        ZStack {
//                            ItemRow(item: item)
//                                .onTapGesture {
//                                    isNavigated.toggle()
//                                    selectedItem = item
//                                }
//                                .listRowSeparator(.hidden)
//
//                            VStack {
//                                Spacer()
//                                HStack {
//                                    Spacer()
//                                    if item.isLocked == true {
//                                        Button("\(item.price) XP") {
//                                            // buy function
//                                            tmp = item.buyItem(userXP: userXP, item: item)
//                                            UserDefaults.standard.set(tmp, forKey: "userXP")
//                                        }
//                                        .font(.system(size: 18, weight: .bold))
//                                        .padding(.horizontal, 8)
//                                        .padding(.vertical, 5)
//                                        .frame(width: 70)
//                                        .background(Color("LightGray").cornerRadius(20))
//                                        .foregroundColor(Color.accentColor)
//
//                                    } else {
//                                        Image(systemName:"checkmark.circle")
//                                            .bold()
//                                            .font(.title2)
//                                            .foregroundColor(.blue)
//                                            .padding(.trailing, 6)
//                                    }
//                                }
//                                .padding(.bottom, 5)
//                            }
//                        }
//
//                    }
//                } else {
//                    List(vm.rooms) { room in
//                        ZStack{
//                            RoomRow(room: room)
//                            VStack {
//                                Spacer()
//                                HStack {
//                                    Spacer()
//                                    if room.isUnlocked == false {
//                                        Button("\(room.price) XP") {
//                                            // buy function
//                                            tmp = vm.buyItem(userXP: userXP, item: room)
//                                            UserDefaults.standard.set(tmp, forKey: "userXP")
//                                        }
//                                        .font(.system(size: 18, weight: .bold))
//                                        .padding(.horizontal, 8)
//                                        .padding(.vertical, 5)
//                                        .frame(width: 70)
//                                        .background(Color("LightGray").cornerRadius(20))
//                                        .foregroundColor(Color.accentColor)
//
//                                    } else {
//                                        Image(systemName:"checkmark.circle")
//                                            .bold()
//                                            .font(.title2)
//                                            .foregroundColor(.blue)
//                                            .padding(.trailing, 6)
//                                    }
//                                }// .navigationTitle("My Rooms")
//                               // .padding(.bottom, 5)
//                            }
//
//                        }
//
//
//
//                    }
//                }
//
//
//
//            }
//            .navigationDestination(isPresented: $isNavigated) {
//                if let selectedItem {
//                    ItemDetail(item: selectedItem)
//                }
//            }
//            .listStyle(.plain)
//            .navigationTitle("My Items")
//            .toolbar
//                      {
//             /*   Button(isFiltered ? "\(Image(systemName: "line.3.horizontal.decrease.circle.fill"))" : "\(Image(systemName: "line.3.horizontal.decrease.circle"))") {
//                    isFiltered.toggle()
//
//                    if isFiltered {
//                        array.updateFilteredArray()
//                    } else {
//                        array.filteredArray = array.dataArray
//                    }
//                }*/
//                Menu {
//                    Button {
//                        filter = .locked
//                       array.filteredArray = array.dataArray.filter({
//                           $0.isLocked
//                       })
//                    } label: {
//                        Text(FilterType.locked.rawValue)
//                    }
//                    Button {
//                        filter = .unlocked
//                        array.updateFilteredArray()
//                    } label: {
//                        Text(FilterType.unlocked.rawValue)
//                    }
//                    Button {
//                        filter = .room
//                    } label: {
//                        Text(FilterType.room.rawValue)
//                    }
//
//                } label: {
//                    Image(systemName: "line.3.horizontal.decrease.circle")
//                }
//
//
//            }
//        }
//    }
//}

struct ItemList_Previews: PreviewProvider {
    static var previews: some View {
        ItemList(vm: ViewModel(), userXP: .constant(10))
    }
}
