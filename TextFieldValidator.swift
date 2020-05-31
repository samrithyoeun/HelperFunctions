class TextFieldValidator {
/**
     validate the textfied to support only two decimal, and auto replace first 0 with the actual value.
     - Use case: Amount Text Field , 01 -> 0.1
    */
    static func validateAmount(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let oldText = textField.text, let r = Range(range, in: oldText) else {
            return true
        }
        
        guard let text = textField.text else { return true }
        if text.count == 1 && (string != "0" && string != "." ) && text == "0" {
            textField.text = string
            return false
        }
        
        let newText = oldText.replacingCharacters(in: r, with: string)
        let isNumeric = newText.isEmpty || (Double(newText) != nil)
        let numberOfDots = newText.components(separatedBy: ".").count - 1
        
        let numberOfDecimalDigits: Int
        
        if let dotIndex = newText.firstIndex(of: ".") {
            numberOfDecimalDigits = newText.distance(from: dotIndex, to: newText.endIndex) - 1
        } else {
            numberOfDecimalDigits = 0
        }
        
        if let integer = newText.components(separatedBy: ".").first {
            
            if Int(integer) ?? 0 == 0 && integer.count > 1 {
                return false
            }
            
        }
        return isNumeric && numberOfDots <= 1 && numberOfDecimalDigits <= 2
    }
}
