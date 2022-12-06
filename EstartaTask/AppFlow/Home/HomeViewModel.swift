//
//  HomeViewModel.swift
//  EstartaTask
//
//  Created by Tawfik Sweedy✌️ on 12/5/22.
//

import Foundation
import Moya
import PromiseKit
import Combine
import SwiftUI

class HomeViewModel : ObservableObject {
    
    let passthroughSubject = PassthroughSubject<String, Error>()
    let passthroughModelSubject = PassthroughSubject<[Results], Error>()
    private let Listings = MoyaProvider<HomeServices>()
    private var cancellables: Set<AnyCancellable> = []
    
    @Published var publishedUserLogedInModel: [Results] = []
    @Published var nodata = false
    @Published var listingsCount = 0
    @Published var isLoading:Bool? = false
    @Published var isAlert = false
    @Published var message = ""
    
    init() {
        passthroughModelSubject.sink { (completion) in
        } receiveValue: { [self](modelData) in
            nodata = false
            withAnimation{
                publishedUserLogedInModel = []
            }
            DispatchQueue.main.async {
                if modelData.isEmpty == true {
                    self.nodata = true
                }else{
                    withAnimation{
                        self.publishedUserLogedInModel = modelData
                        self.listingsCount = modelData.count
                    }
                }
            }
        }.store(in: &cancellables)
    }
    // MARK: - API Services
    func GetListings(){
        firstly { () -> Promise<Any> in
            isLoading = true
            return BGServicesManager.CallApi(self.Listings,HomeServices.Home)
        }.done({ [self] response in
            let result = response as! Response
            //            guard BGNetworkHelper.validateResponse(response: result) else{return}
            let data : ListingsModel = try BGDecoder.decode(data: result.data )
            DispatchQueue.main.async {
                self.passthroughModelSubject.send(data.results ?? [])
            }
        }).ensure { [self] in
            isLoading = false
        }.catch { [self] (error) in
            isAlert = true
            message = "\(error)"
        }
    }
}
