//
//  GroupsViewModels.swift
//  
//
//  Created by Ivan Konishchev on 13.12.2022.
//

import Foundation
import LoadService
import GroupsModel

@available(iOS 13.0, *)
public final class GroupsViewModels: ObservableObject {
    let service: LoadService
    @Published var data: [GroupsItems] = []
    
    public func loadData() async {
        
        await service.loadFromInternet(object: GroupsModel.self) { object in
            
            
        }
        
    }
    
    public init(token: String, userId: String){
        self.service = LoadService(userId: userId, method: .getGroups(token: token, userId: userId))
        
    }
}
