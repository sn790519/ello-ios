//
//  Fonts.swift
//  Ello
//
//  Created by Sean Dougherty on 11/24/14.
//  Copyright (c) 2014 Ello. All rights reserved.
//

import UIKit

var boldItalic: String? = nil

extension UIFont {
    public class func defaultFont(size: CGFloat = 14) -> UIFont { return UIFont(name: "AtlasGrotesk-Regular", size: size)! }
    public class func defaultBoldFont(size: CGFloat = 14) -> UIFont { return UIFont(name: "AtlasGrotesk-Bold", size: size)! }

    public class func regularFont(size: CGFloat = 14) -> UIFont { return UIFont(name: "AtlasGrotesk-Regular", size: size)! }
    public class func regularBoldFont(size: CGFloat = 14) -> UIFont { return UIFont(name: "AtlasGrotesk-Bold", size: size)! }

    public class func typewriterFont(size: CGFloat = 12) -> UIFont { return UIFont(name: "AtlasTypewriter-Regular", size: size)! }
    public class func typewriterBoldFont(size: CGFloat = 12) -> UIFont { return UIFont(name: "AtlasTypewriter-Medium", size: size)! }
    public class func typewriterItalicFont(size: CGFloat = 12) -> UIFont { return UIFont(name: "AtlasTypewriter-RegularItalic", size: size)! }
    public class func typewriterBoldItalicFont(size: CGFloat = 12) -> UIFont { return UIFont(name: "AtlasTypewriter-MediumItalic", size: size)! }

    public class func editorFont(size: CGFloat = 14) -> UIFont { return UIFont(name: "AtlasGrotesk-Regular", size: size)! }
    public class func editorItalicFont(size: CGFloat = 14) -> UIFont { return UIFont(name: "AtlasGrotesk-RegularItalic", size: size)! }
    public class func editorBoldFont(size: CGFloat = 14) -> UIFont { return UIFont(name: "AtlasGrotesk-Bold", size: size)! }
    public class func editorBoldItalicFont(size: CGFloat = 14) -> UIFont { return UIFont(name: boldItalic!, size: size)! }

    public class func findBoldItalic() {
        for familyName in UIFont.familyNames() {
            if familyName == "Atlas Grotesk Web" {
                for fontName in UIFont.fontNamesForFamilyName(familyName) {
                    boldItalic = fontName
                    print("today, the font name is \(fontName)")
                    return
                }
            }
        }
    }

    public class func printAvailableFonts() {
        for familyName:AnyObject in UIFont.familyNames()
        {
            print("Family Name: \(familyName)")
            for fontName:AnyObject in UIFont.fontNamesForFamilyName(familyName as! String)
            {
                print("--Font Name: \(fontName)")
            }
        }
    }
}
