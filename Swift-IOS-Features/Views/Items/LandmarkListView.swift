import SwiftUI

struct LandmarkListView: View {
    
    @State var isLinkActive = false
    
    var body: some View {
        //List with items
        NavigationView {
            List(landmarks) { Landmark in
                NavigationLink {
                    Text("Test")
                }
            label: {
                    LandmarkRow(landmark: Landmark)
                }
            }
            .navigationTitle("Main menu")
        }
    }
}
            
    
        
        // Navigation Button
//        NavigationView {
//                    VStack(alignment: .leading) {
//
//                        NavigationLink(destination: Text("OtherView"), isActive: $isLinkActive) {
//                            Button(action: {
//                                self.isLinkActive = true
//                            }) {
//                                Text("Login")
//                            }
//                        }
//                    }
//                    .navigationBarTitle(Text("Login"))
//                }
        
        //Navigation List
//        NavigationView {
//            List(landmarks) { landmark in
//                NavigationLink {
//                    LandmarkDetail(landmark: landmark)
//                } label: {
//                    LandmarkRow(landmark: landmark)
//                }
//            }
//            .navigationTitle("Landmarks")
//        }
        

struct LandmarkListView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkListView()
        
    }
}
