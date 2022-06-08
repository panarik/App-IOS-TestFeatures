import SwiftUI

struct LandmarkListView: View {
    var body: some View {
        List(landmarks) { Landmark in
            LandmarkRow(landmark: Landmark)
        }
    }
}

struct LandmarkListView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkListView()
    }
}
