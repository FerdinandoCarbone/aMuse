/*
Abstract:
A view that clips an image to a circle and adds a stroke and shadow.
*/

import SwiftUI

struct ItemImage: View {
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .scaledToFit()
            .shadow(radius: 5)
            //.clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
    }
}

struct ItemImage_Previews: PreviewProvider {
    static var previews: some View {
        ItemImage(image: Image("wave"))
    }
}
