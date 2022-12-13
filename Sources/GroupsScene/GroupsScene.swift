/*
 
 
 */

import SwiftUI
import LoadService

@available(iOS 13.0, *)
public struct GroupsScene: View {
    var service = LoadService(userId: "", method: .getGroups(token: "", userId: ""))
    public var body: some View {
        ZStack {
            Text("GroupScenePackage")
        }
    }
    
    public init(){}
}
