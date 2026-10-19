//
//  ItemDetail.swift
//
//  Created by Serena on 20/10/22.
//  Copyright © 2022 Apple. All rights reserved.
//

import Foundation
import SwiftUI

struct ItemDetail: View {
    var item: ItemsModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                // TODO: Navigation
                Text(item.name)
                    .font(.title)
                    .fontWeight(.semibold)
                    //.frame(width: .infinity)
                // TODO: frame not working
                
                HStack {
                    ItemImage(image: item.image)
                        .padding(.vertical, 20.0)
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                    
                VStack(alignment: .leading) {
                    Text("General Description")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Text(item.description)

                    // detail icons
                    VStack {
                        Divider()
                            .frame(height: 1)
                            .overlay(.gray)
                        HStack {
                            VStack {
                                Text(item.iconName1)
                                    .tracking(4)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color("DarkGray"))
                                    .multilineTextAlignment(.center)
                                    .textCase(.uppercase)
                                    
                                Image(systemName: item.iconSymbol1)
                                    .font(.system(size:25))
                                    .padding(.vertical, 1)
                                Text(item.iconText1)
                            }
                            .frame(minWidth: 0, maxWidth: .infinity)
                            Divider()
                                .frame(width: 1)
                                .overlay(.gray)
                                
                            
                            VStack {
                                Text(item.iconName2)
                                    .tracking(4)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color("DarkGray"))
                                    .multilineTextAlignment(.center)
                                    .textCase(.uppercase)
                                    
                                Image(systemName: item.iconSymbol2)
                                    .font(.system(size:25))
                                    .padding(.vertical, 1)
                                Text(item.iconText2)
                                
                            }
                            .frame(minWidth: 0, maxWidth: .infinity)
                            Divider()
                                .frame(width: 1)
                                .overlay(.gray)
                            
                            VStack {
                                Text(item.iconName3)
                                    .tracking(4)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color("DarkGray"))
                                    .multilineTextAlignment(.center)
                                    .textCase(.uppercase)
                                    .padding(.bottom)
                                    
                                Image(systemName: item.iconSymbol3)
                                    .font(.system(size:25))
                                    .padding(.vertical, 1)
                                Text(item.iconText3)
                                    .padding(.top, 1)
                                
                            }
                            .frame(minWidth: 0, maxWidth: .infinity)
                            
                        }
                        Divider()
                            .frame(height: 1)
                            .overlay(.gray)
                    }

                    Text("Did you know?")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Text(item.curiosity)
                        
                    
                }

            }
            .padding(.all, 20.0)
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
        
    
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetail(item: items[0])
    }
}
