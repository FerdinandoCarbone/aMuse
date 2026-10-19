//
//  FinalView.swift
//  Project1
//
//  Created by Marta Michelle Caliendo on 28/10/22.
//

import SwiftUI

struct FinalView: View {
    @Binding var userXP: Int
    
    @State private var isActive = false
    
    var body: some View {
        
        ZStack{
            //Color("yellow 2")
                //.ignoresSafeArea()
            Color(.white)
                .ignoresSafeArea()

            VStack{
                Text("Congratulations! You have earned some points!")
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                HStack{
                    Text("XP: \(userXP)")
                        .font(.title)
                        .fontWeight(.semibold)
                    Image(systemName: "trophy").foregroundColor(Color("Yellow"))
                        .font(.title)
                    
                }.padding(.top, 1)
                
                Image("trofeo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding(.bottom, 30)
                    .padding(.top, 30)
                //.position(x: 196, y: 280)
                Button("Collect XP") {
                    museums[0].completeMuseum()
                    isActive.toggle()
                    
                }
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .fontWeight(.semibold)
                .font(.title3)
                .padding()
                .background(Color("Yellow").opacity(0.8))
                .cornerRadius(40)
                .padding(10)
                .overlay(RoundedRectangle(cornerRadius: 40).stroke(Color("Yellow").opacity(0.8), lineWidth: 5))
                .navigationDestination(isPresented: $isActive) {
                    MuseumList(userXP: $userXP)
                        .navigationBarBackButtonHidden(true)
                }
            }
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    
}
struct FinalView_Previews: PreviewProvider {
    static var previews: some View {
        FinalView(userXP: .constant(10))
    }
}
