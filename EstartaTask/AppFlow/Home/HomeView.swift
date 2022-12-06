//
//  HomeView.swift
//  EstartaTask
//
//  Created by Tawfik Sweedy✌️ on 12/5/22.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var homeViewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            List{
                ForEach(homeViewModel.publishedUserLogedInModel, id:\.self) { listItem in
                    NavigationLink {
                        DetailsView(listingModel: listItem)
                    } label: {
                        ListView(listingModel: listItem)
                    }
                }
            }.navigationBarTitle(Text("Listings"))
        }
        .onAppear{
            homeViewModel.GetListings()
        }
        .overlay(content: {
            LottieLoader(isPresented: $homeViewModel.isLoading)
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
