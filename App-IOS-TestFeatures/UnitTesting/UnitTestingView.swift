 //
//  UnitTestingView.swift
//  Swift-IOS-Features
//
//  Created by panarik on 7/5/22.
//

import SwiftUI

struct UnitTestingView: View {
    
    @StateObject var vm: UnitTestingViewModel
    
    init(isPremium: Bool) {
        _vm = StateObject(wrappedValue: UnitTestingViewModel(isPremium: isPremium, dataService: NewMockDataService(items: nil)))
    }
    
    var body: some View {
        Text(vm.isPremium.description)
            .font(.title)
    }
}

struct UnitTestingView_Previews: PreviewProvider {
    static var previews: some View {
        UnitTestingView(isPremium: true)
    }
}
