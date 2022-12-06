//
//  ListView.swift
//  EstartaTask
//
//  Created by Tawfik Sweedy✌️ on 12/5/22.
//

import SwiftUI

struct ListView: View {
    
    @State var listingModel : Results?
    
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: listingModel?.image_urls_thumbnails?[0] ?? "")) { image in
                image.resizable()
            } placeholder: {
                Image("cover_vector")
                    .resizable()
            }
            .scaledToFill()
            .frame(width: 100, height: 100)
            .cornerRadius(8)
            .padding(.vertical , 8)
            VStack(alignment: .leading , spacing: 5 ){
                Text(listingModel?.name ?? "")
                    .fontWeight(.bold)
                    .lineLimit(2)
                Text(listingModel?.price ?? "")
                    .fontWeight(.semibold)
                    .foregroundColor(.red)
                Text(listingModel?.created_at ?? "")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }.padding(3)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
