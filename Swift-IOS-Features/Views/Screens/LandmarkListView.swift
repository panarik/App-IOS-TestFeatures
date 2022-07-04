import SwiftUI

struct LandmarkListView: View {
    
    @State var isLinkActive = false
    
    var body: some View {
        
        //List with items
        NavigationView {
            List(landmarks) { landmark in
                NavigationLink {
                    Text(String(landmark.name))
                        .font(.title)
                }
            label: {
                LandmarkRow(landmark: landmark)
            }
            }
            .navigationTitle("Main menu")
        }
    }
}

struct LandmarkListView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkListView()
    }
}
