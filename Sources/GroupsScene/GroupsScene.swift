/*
 
 
 */
import Foundation
import SwiftUI

@available(iOS 16.0, *)
public struct GroupsScene: View {
    private var rowHeight: CGFloat = 80
    @Binding var isSelected: Bool
    @ObservedObject var viewModel: GroupsViewModels
    
    public var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                List(viewModel.data) { group in
                    
                    GroupTableCell(groupName: group.groupName, logo: group.photoGroup, rowHeight: self.rowHeight)
                     
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 2, trailing: 0))
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                    
                    
                    
                }
                .listStyle(GroupedListStyle())
                
            }
            .navigationTitle("Groups")
            .navigationBarTitleDisplayMode(.inline)
            
        }
        .task {
            await self.viewModel.loadData()
        }
    }
    
    public init(token: String, userId: String, isSelected: Binding<Bool>) {
        self._isSelected = isSelected
        self.viewModel = GroupsViewModels(token: token, userId: userId)
    }
}

