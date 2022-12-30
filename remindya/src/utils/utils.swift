//
//  utils.swift
//  remindya
//
//  Created by aldinugroho on 19/12/22.
//

import Foundation
import UIKit

extension UIColor {
    struct customcolor {
        static var appcolor: UIColor { return UIColor(named: "AppColor")! }
        static var lightblue: UIColor { return UIColor(named: "Lightblue")! }
        static var blueeventtime: UIColor { return UIColor(named: "BlueEventTime")! }
        static var bluedarkbtn: UIColor { return UIColor(named: "BlueDarkBtn")! }
    }
}


extension UILabel {
    func newTimeEvent(time: String = "18.30 AM") -> NSMutableAttributedString {
        let defaultWord = "Next up event\nAlarm on "
        let custom = time
        let defaultfont = UIFont.systemFont(ofSize: 25)
        let customfont = UIFont.systemFont(ofSize: 35)
        let fontDescriptor = customfont.fontDescriptor.withSymbolicTraits(.traitBold)
        let boldFont = UIFont(descriptor: fontDescriptor!, size: 35)
        let dafaultAtt: [NSAttributedString.Key: Any] = [.font: defaultfont, .foregroundColor: UIColor.white]
        let customAtt: [NSAttributedString.Key: Any] = [.font: boldFont, .foregroundColor: UIColor.customcolor.blueeventtime]
        let defaultText = NSMutableAttributedString(string: defaultWord, attributes: dafaultAtt)
        defaultText.append(NSMutableAttributedString(string: custom, attributes: customAtt))
        return defaultText
    }
}
