//
//  RoomRow.swift
//  Project1
//
//  Created by Marta Michelle Caliendo on 30/10/22.
//

import SwiftUI

struct RoomRow: View {
    let room: roomModel
    var body: some View {
        
       
        HStack(alignment: .top) {
                Image(room.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 180)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                   // .padding(.leading)
                VStack(alignment: .leading, spacing: 4) {
                    HStack{
                        Text("\(room.name), \(room.description)")
                            .font(.headline)
                            .italic()
                    }
                    HStack {
                        Text(room.description2)
                            .font(.caption)
                            .multilineTextAlignment(.leading)
                        
                    }
                    //Spacer()
                }
                Spacer()
            }
            
        }
        
        
    }
    


struct RoomRow_Previews: PreviewProvider {
    static var previews: some View {
        RoomRow(room: roomModel(id: 1, name: "Art Room", description: "A new room to add your items", description2: "lalalahghgghgfgfgfgfgfgfgfgffgfgfgfgfgdfgdgdgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfdfggdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfg", isUnlocked: false, imageName: "room2", price: 0))
    }
}
