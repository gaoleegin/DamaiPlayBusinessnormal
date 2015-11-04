import UIKit
extension UIColor{
    class func colorWithHex(hex:String)->(UIColor) {
        //删除字符串中的空格
        var cString:String = (hex as NSString).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).uppercaseString
        
        if cString.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) < 6 {
            return UIColor.clearColor()
        }
        if cString.hasPrefix("0X") {
            cString = (cString as NSString).substringFromIndex(2)
        }
        if cString.hasPrefix("#"){
            cString = (cString as NSString).substringFromIndex(1)
        }
        if cString.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) != 6 {
            return UIColor.clearColor()
        }
        var range:NSRange = NSRange()
        range.location = 0;
        range.length = 2;
        let rString = (cString as NSString).substringWithRange(range)
        range.location = 2;
        let gString = (cString as NSString).substringWithRange(range)
        range.location = 4;
        let bString = (cString as NSString).substringWithRange(range)
        var r:UInt32 = 0; var g:UInt32 = 0;var b:UInt32 = 0;
        NSScanner(string: rString).scanHexInt(&r)
        NSScanner(string: gString).scanHexInt(&g)
        NSScanner(string: bString).scanHexInt(&b)
        return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: 1.0)
    }
}

