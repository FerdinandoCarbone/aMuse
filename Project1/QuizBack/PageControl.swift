//
//  PageControl.swift
//  Project1
//
//  Created by Ferdinando Carbone on 27/10/22.
//

import SwiftUI

struct PageControl: View {
    
    @Binding var selectedPage: Int
    var pages: Int
    var circleDiameter: CGFloat
    var circleMargin: CGFloat
    
    private var circleRadius: CGFloat { circleDiameter / 2}
    private var pageIndex: CGFloat { CGFloat(selectedPage - 1) }
    
    private var currentPosition: CGFloat {
        // Get the first circle position
        let stackWidth = circleDiameter * CGFloat(pages) + circleMargin * CGFloat(pages - 1)
        let halfStackWidth = stackWidth / 2
        let iniPosition = -halfStackWidth + circleRadius
        
        // Calculate the distance to get the next circle
        let distanceToNextPoint = circleDiameter + circleMargin
        
        // Use the pageIndex to get the current position
        return iniPosition + (pageIndex * distanceToNextPoint)
    }
    
    var body: some View {
        ZStack{
            ZStack {
                // Total number of pages
                HStack(spacing: circleMargin) {
                    ForEach(0 ..< pages) { _ in
                        Circle()
                            .stroke(Color.gray, style: StrokeStyle(lineWidth: 2, lineCap: .round))
                            .frame(width: circleDiameter, height: circleDiameter)
                    }
                }
                
                // Current page index
                Circle()
                    .foregroundColor(Color("DarkGray"))
                    .frame(width: circleDiameter, height: circleDiameter)
                    .offset(x: currentPosition)
                    .animation(.linear(duration: 0.3))
                    .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
            }
            
        }
    }
}

struct PageControlPreview: View {
    
    var pages: Int = 5
    @State var selectedPage: Int = 1
    
    var body: some View {
        VStack{
            PageControl(selectedPage: $selectedPage, pages: pages, circleDiameter: 15.0, circleMargin: 10.0)
                .fixedSize(horizontal: true, vertical: true)
                .padding(/*@START_MENU_TOKEN@*/[.bottom, .trailing], 25.0/*@END_MENU_TOKEN@*/)
            HStack {
                Button(action: {
                    if (selectedPage>1) {
                        selectedPage = selectedPage - 1
                    }
                }, label: {
                    if(selectedPage>1){
                        Image(systemName: "arrow.left")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.blue)
                    }
                    
                })
                //TO DO: Fix the position of the page control because it moves when the arrow disappear
                //Possible solution: The button when on page1 or page5 don't disappear but change to (􀁢 on page 5)
                //Im really sorry i was unable to much else i'll get to you asap
                Spacer()
                Button(action: {
                    if (selectedPage<pages){
                        selectedPage = selectedPage + 1}
                }, label: {
                    if (selectedPage<pages){
                        Image(systemName: "arrow.right")
                            .resizable()
                            .frame(width: 25.0, height: 25)
                            .foregroundColor(.blue)
                    }
                }
                )
            }
        }
        .padding(/*@START_MENU_TOKEN@*/.all, 11.0/*@END_MENU_TOKEN@*/)
        
        
    }
}

struct PageControl_Previews: PreviewProvider {
    static var previews: some View {
        PageControlPreview()
    }
}
