//
//  ImgView.swift
//  EstartaTask
//
//  Created by Tawfik Sweedy✌️ on 12/6/22.
//

import SwiftUI

struct ImgView: View {
    
    @State var listingModel : Results?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            HStack {
                ForEach(listingModel?.image_urls_thumbnails ?? [""] , id:\.self) { img in
                    AsyncImage(url: URL(string: img )) { image in
                        image.resizable()
                    } placeholder: {
                        Image("cover_vector")
                            .resizable()
                            .cornerRadius(20)
                    }
                    .frame(width: UIScreen.main.bounds.width - 40 , height: 300)
                    .cornerRadius(20)
                }
            }
        }
    }
}

struct ImgView_Previews: PreviewProvider {
    static var previews: some View {
        ImgView()
    }
}
