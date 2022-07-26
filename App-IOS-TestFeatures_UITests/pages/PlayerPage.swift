import Foundation
import XCTest

class PlayerPage: BasePage {
    
    var volumeStatus = Control.app.staticTexts["VolumeStatusText"]
    var volumeSlider = Control.app.sliders["VolumeSlider"]
    
    func onPage() {
        XCTAssertTrue(volumeSlider.waitForExistence(timeout: 1))
    }
    
    func setVolume(_ volume: Int) {
        let position:CGFloat = (CGFloat.init(volume))/100
        volumeSlider.adjust(toNormalizedSliderPosition: position)
    }

}
