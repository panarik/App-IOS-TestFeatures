import SwiftUI

private class PlayerViewModel: ObservableObject {
    
    @Published var sliderValue: Double = 0.0
    @Published var cliderColor: Color = .red
    
}


struct PlayerView: View {
    
    @StateObject private var vm: PlayerViewModel = PlayerViewModel()
    
    var body: some View {
        ZStack {
            
            VStack {
                playerControlLayer
            }
        }
    }
}

extension PlayerView {
    
    private var playerControlLayer: some View {
        
        VStack {
            HStack {
                Button (
                    action: {
                    },
                    label: {
                        Text("Play")
                            .font(Font.title2.bold())
                            .padding()
                            .background(Color.gray)
                            .foregroundColor(Color.white)
                            .cornerRadius(20)
                    })
                Button (
                    action: {
                    },
                    label: {
                        Text("Pause")
                            .font(Font.title2.bold())
                            .padding()
                            .background(Color.gray)
                            .foregroundColor(Color.white)
                            .cornerRadius(20)
                    })
            }
            Text("Volume: "+String(format: "%.0f", vm.sliderValue))
                .font(Font.title2)
                .foregroundColor(vm.cliderColor)
            Slider(
                value: $vm.sliderValue,
                in: 0...100,
                step: 1.0,
                onEditingChanged: { _ in
                    vm.cliderColor = .green
                },
                minimumValueLabel: Text("min"),
                maximumValueLabel: Text("max"),
                label: {
                    Text("Volume slider")
                })
            .padding(.horizontal, 30.0)
            .background(Color.white)
            .foregroundColor(Color.red)
            .accentColor(Color.red)
        }
    }
}




struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}
