//
//  StringExtensions.swift
//  LeslieRomero
//
//  Created by Lesliee Yaneth on 1/02/21.
//

import UIKit

extension String {

    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }

    func isValidNumber() -> Bool {
        let numberRegEx = "^[0-9]{10}$"
        let numberTest = NSPredicate(format: "SELF MATCHES %@", numberRegEx)
        return numberTest.evaluate(with: self)
    }

    func isValidCP() -> Bool {
        let numberRegEx = "^[0-9]{5}$"
        let numberTest = NSPredicate(format: "SELF MATCHES %@", numberRegEx)
        return numberTest.evaluate(with: self)
    }

    func isValidCLABE() -> Bool {
        let numberRegEx = "^[0-9]{18}$"
        let numberTest = NSPredicate(format: "SELF MATCHES %@", numberRegEx)
        return numberTest.evaluate(with: self)
    }

    func getDateFromString() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "es_MX")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.date(from: self)!
    }

    func stringByRemovingAll(characters: [Character]) -> String {
        return String(self.filter({ !characters.contains($0) }))
    }

    func tokenizeCard() -> String {
        return String(self[self.index(self.endIndex, offsetBy: -4)...])
    }

    func convertStringToURL() -> URL? {
        guard let formStr = self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return nil }
        guard let daUrl = URL(string: formStr) else { return nil }
        return daUrl
    }

    // Base64 encoding a string
    func base64Encoded() -> String? {
        if let data = self.data(using: .utf8) {
            return data.base64EncodedString()
        }
        return nil
    }

    // Base64 decoding a string
    func base64Decoded() -> String? {
        let encoded64 = self.padding(toLength: ((self.count + 3) / 4) * 4, withPad: "=", startingAt: 0)
        if let data = Data(base64Encoded: encoded64) {
            return String(data: data, encoding: .utf8)
        }
        return nil
    }

    func getStringDate() -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MM/dd/yyyy"

        let date: Date? = dateFormatterGet.date(from: self)
        print(dateFormatterPrint.string(from: date!))
        return dateFormatterPrint.string(from: date!)
    }
    func stringToInt() -> Int {

        if let intValue = Int(self) {
            return intValue
        }
        return 0
    }
}
