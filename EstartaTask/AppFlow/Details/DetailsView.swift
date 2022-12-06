//
//  DetailsView.swift
//  EstartaTask
//
//  Created by Tawfik Sweedy✌️ on 12/6/22.
//

import SwiftUI

struct DetailsView: View {
    
    @State var listingModel : Results?
    
    var body: some View {
        VStack(alignment: .leading , spacing: 20 ) {
            ScrollView(.horizontal , showsIndicators: false ) {
                HStack{
                    ForEach(listingModel?.image_urls_thumbnails ?? [""] , id:\.self) { img in
                        ImgView(listingModel: listingModel)
                            .padding(8)
                    }
                }
            }
            Text("Name : \(listingModel?.name ?? "")")
                .fontWeight(.bold)
            Text("Price : \(listingModel?.price ?? "")")
                .fontWeight(.semibold)
                .foregroundColor(.red)
            Text("Created at : \(listingModel?.created_at ?? "")")
                .foregroundColor(.secondary)
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}

