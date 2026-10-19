//
//  RoomsList.swift
//  Project1
//
//  Created by Serena on 01/11/22.
//

import SwiftUI

struct RoomsList: View {
    @ObservedObject var vm: ViewModel
    
    var room = roomsGlobal[0]
    
    @State var tmp: Int = 0
    
    @Binding var userXP: Int
    
    @State var isActive: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                HStack {
                    Image(systemName: "chevron.backward")
                        .font(.title2)
                        .foregroundColor(.accentColor)
                        .fontWeight(.medium)
                    Button("My Room") {
                        isActive.toggle()
                    }
                    .padding(.horizontal, -5)
                    .navigationDestination(isPresented: $isActive) {
                        Home2(vm: vm, userXP: $userXP)
                    }
                }
                .padding(.horizontal)
                Spacer()
            }
            
            HStack{
                Text("XP: \(userXP)")
                Image(systemName: "trophy").foregroundColor(Color("Yellow"))
            }
            .font(.title2)
            .fontWeight(.semibold)
            
            List(vm.rooms) { room in
                ZStack {
                    RoomRow(room: room)
                    HStack {
                        Spacer()
                        if room.isUnlocked == false {
                            Button("\(room.price) XP") {
                                // buy function
                                tmp = vm.buyItem(userXP: userXP, item: room)
                                UserDefaults.standard.set(tmp, forKey: "userXP")
                            }
                            .font(.system(size: 18, weight: .bold))
                            .padding(.horizontal, 8)
                            .padding(.vertical, 5)
                            .frame(width: 70)
                            .background(Color("LightGray").cornerRadius(20))
                            .foregroundColor(Color.accentColor)
                            .padding(.top, 150)
                            .padding(.horizontal, 20)
                            
                        } else {
                            Image(systemName:"checkmark.circle")
                                .bold()
                                .font(.title2)
                                .foregroundColor(.blue)
                                .padding(.top, 150)
                                .padding(.horizontal, 20)
                        }
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("My Room")
            .toolbar(.hidden, for: .navigationBar)
            
            
            
            
            Spacer()
        }
        .navigationTitle("My Rooms")
    }
}

struct RoomsList_Previews: PreviewProvider {
    static var previews: some View {
        RoomsList(vm: ViewModel(), userXP: .constant(30))
    }
}
