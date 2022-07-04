import SwiftUI

class DependencyInjectionModel: ObservableObject {
    
}

struct DependencyInjectionScreen: View {
    
    @StateObject private var vm = DependencyInjectionModel()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct DependencyInjection_Previews: PreviewProvider {
    static var previews: some View {
        DependencyInjectionScreen()
    }
}
