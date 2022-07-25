import Foundation
import SwiftUI

private class PlayerViewModel: ObservableObject {

    @Published var value: Float = 0.0

}

struct PlayerView: View {

    @StateObject private var vm: PlayerViewModel = PlayerViewModel()

    var body: some View {
        ZStack {
            HStack {
               Button(action: {

               }, label: )
            }
            VStack {
                Slider(value: $vm.value)
                        .padding()
            }
        }


    }

}

class PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }

    #if DEBUG
    @objc class func injected() {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        windowScene?.windows.first?.rootViewController =
                UIHostingController(rootView: PlayerView())
    }
    #endif

}
