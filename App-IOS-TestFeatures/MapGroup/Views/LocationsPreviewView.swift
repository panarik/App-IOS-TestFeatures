import SwiftUI

struct LocationsPreviewView: View {
    
    @EnvironmentObject private var vm: MapViewModel
    private var location: Location
    
    init(location: Location) {
        self.location = location
    }
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            VStack(spacing: 20) {
                imageSection
                titleSection
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 20) {
                learnMoreButton
                nextButton
            }
        }
        .padding(20)
        .background(RoundedRectangle(cornerRadius: 20)
            .fill(.ultraThinMaterial)
            .offset(y: 55))
        .cornerRadius(10)
    }
     
}

struct LocationsPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.orange
            LocationsPreviewView(location: LocationsDataService.locations[0])
        }
    }
}

extension LocationsPreviewView {
    
    var imageSection: some View {
        ZStack {
            Image(location.imageNames.first ?? "loading")
                .resizable()
                .frame(width: 150, height: 150)
                .cornerRadius(10)
        }
        .padding(6)
        .background(Color.white)
        .cornerRadius(10)
    }
    
    var titleSection: some View {
        VStack(alignment: .leading) {
            Text(location.name)
                .font(.title3)
                .fontWeight(.bold)
            Text(location.cityName)
                .font(.subheadline)
        }
    }
    
    var learnMoreButton: some View {
        Button {
            
        } label: {
            Text("Learn more")
                .padding(5)
                .font(.headline)
                .frame(width: 120, height: 35)
                .cornerRadius(10)
        }
        .buttonStyle(.borderedProminent)
    }
    
    var nextButton: some View {
        Button {
            vm.setNextLocation()
        } label: {
            Text("Next")
                .padding(5)
                .font(.headline)
                .frame(width: 120, height: 35)
                .cornerRadius(10)
        }
        .buttonStyle(.bordered)
    }
    
}

