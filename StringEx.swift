import Foundation 

extension String {

/// Returns a string with all non-numeric characters removed
public var numericString: String {
        let characterSet = CharacterSet(charactersIn: "0123456789.").inverted
        return components(separatedBy: characterSet)
            .joined()
}

}
