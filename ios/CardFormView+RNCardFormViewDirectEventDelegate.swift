import Foundation

@objc public protocol RNCardFormViewDirectEventDelegate: AnyObject {
    func onFormCompleteEvent(
        expiryMonth: NSNumber?,
        expiryYear: NSNumber?,
        complete: Bool,
        brand: String?,
        last4: String?,
        postalCode: String,
        country: String?,
        number: String?,
        cvc: String?
    )
}

extension CardFormView: RNCardFormViewDirectEventDelegate {
    public func onFormCompleteEvent(
        expiryMonth: NSNumber?,
        expiryYear: NSNumber?,
        complete: Bool,
        brand: String?,
        last4: String?,
        postalCode: String,
        country: String?,
        number: String?,
        cvc: String?
    ) {
        #if NEW_ARCH_ENABLED_SWIFT
            eventDelegate?.onFormCompleteEvent(
                expiryMonth: expiryMonth,
                expiryYear: expiryYear,
                complete: complete,
                brand: brand,
                last4: last4,
                postalCode: postalCode,
                country: country,
                number: number,
                cvc: cvc
            )
        #else
            var cardData: [String: Any?] = [
                "expiryMonth": expiryMonth ?? NSNull(),
                "expiryYear": expiryYear ?? NSNull(),
                "complete": complete,
                "brand": Mappers.mapFromCardBrand(brand) ?? NSNull(),
                "last4": last4 ?? "",
                "postalCode": postalCode ?? "",
                "country": country,
            ]
            if let number {
                cardData["number"] = number
            }
            if let cvc {
                cardData["cvc"] = cvc
            }

            onFormComplete?(cardData)
        #endif
    }
}
