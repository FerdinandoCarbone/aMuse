//
//  MuseumList.swift
//  Project1
//
//  Created by Serena on 28/10/22.
//

import SwiftUI

class MuseumModel: Identifiable, Codable {
    let id: Int
    let name: String
    let location: String
    let imageName: String
    
    var isCompleted: Bool
    
    var image: Image{
        Image(imageName)
    }
    
    func completeMuseum() {
        self.isCompleted = true
    }
}

struct MuseumList: View {
    
    @Binding var userXP: Int
    @State var isActive: Bool = false
    
    var museum = museums[0]
    
    var body: some View {
        NavigationStack {
            
            VStack {
                
                Text("Museum List")
                    .font(.title)
                    .fontWeight(.semibold)
                
                NavigationStack {
                    HStack(alignment: .top, spacing: 14) {
                        museum.image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                        VStack(alignment: .leading, spacing: 4) {
                            HStack {
                                Text("\(museum.name)")
                                    .font(.headline)
                                    .italic()
                            }
                            HStack {
                                Text(museum.location)
                                    .font(.caption)
                                Spacer()
                                
                                if museum.isCompleted == true {
                                    Text("\(Image(systemName: "checkmark.circle"))")
                                        .padding(.horizontal)
                                        .padding(.vertical, 2)
                                        .foregroundColor(.white)
                                        .background(RoundedRectangle(cornerRadius: 4)
                                        .fill(Color.green))
                                }
                                
                            }
                        }
                        
                    }
                    .padding(.horizontal)
                }
                .onTapGesture {
                    if !museum.isCompleted {
                        isActive.toggle()
                    }
                }
                .navigationDestination(isPresented: $isActive) {
                    QuizView(userXP: $userXP)
                }
                Spacer()
                
            }
            
            
            .navigationTitle("Quiz")
            
        }
        
    }
}

struct MuseumList_Previews: PreviewProvider {
    static var previews: some View {
        MuseumList(userXP: .constant(10))
    }
}
