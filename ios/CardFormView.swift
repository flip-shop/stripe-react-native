import Foundation
import Stripe

@objc public class CardFormView: UIView, STPCardFormViewDelegate {
    @objc public weak var eventDelegate: RNCardFormViewDirectEventDelegate?
    public var cardForm: STPCardFormView?

    public var cardParams: STPPaymentMethodCardParams? = nil

    @objc public var dangerouslyGetFullCardDetails: Bool = false
    @objc var onFormComplete: RCTDirectEventBlock?
    @objc public var autofocus: Bool = false
    @objc public var disabled: Bool = false
    @objc public var preferredNetworks: [Int]? {
        didSet {
            if let preferredNetworks {
                cardForm?.preferredNetworks = preferredNetworks.map(Mappers.intToCardBrand).compactMap { $0 }
            }
        }
    }

    override public func didSetProps(_ changedProps: [String]!) {
        if let cardForm {
            cardForm.removeFromSuperview()
        }

        let style = cardStyle["type"] as? String == "borderless" ? STPCardFormViewStyle
            .borderless : STPCardFormViewStyle.standard
        let _cardForm = STPCardFormView(style: style)
        _cardForm.delegate = self
        _cardForm.isUserInteractionEnabled = !disabled

        if autofocus == true {
            let _ = _cardForm.becomeFirstResponder()
        }

        cardForm = _cardForm
        addSubview(_cardForm)
        setStyles()
    }

    @objc public var cardStyle: NSDictionary = .init() {
        didSet {
            setStyles()
        }
    }

    public func cardFormView(_ form: STPCardFormView, didChangeToStateComplete complete: Bool) {
        let brand = STPCardValidator.brand(forNumber: cardForm?.cardParams?.card?.number ?? "")
        var number: String?
        var cvc: String?
        if dangerouslyGetFullCardDetails {
            number = cardForm?.cardParams?.card?.number ?? ""
            cvc = cardForm?.cardParams?.card?.cvc ?? ""
        }
        if complete {
            cardParams = cardForm?.cardParams?.card
        } else {
            cardParams = nil
        }
        onFormCompleteEvent(
            expiryMonth: cardForm?.cardParams?.card?.expMonth,
            expiryYear: cardForm?.cardParams?.card?.expYear,
            complete: complete,
            brand: Mappers.mapFromCardBrand(brand),
            last4: cardForm?.cardParams?.card?.last4,
            postalCode: cardForm?.cardParams?.billingDetails?.address?.postalCode ?? "",
            country: cardForm?.cardParams?.billingDetails?.address?.country,
            number: number,
            cvc: cvc
        )
    }

    func focus() {
        let _ = cardForm?.becomeFirstResponder()
    }

    func blur() {
        let _ = cardForm?.resignFirstResponder()
    }

    func setStyles() {
        if let backgroundColor = cardStyle["backgroundColor"] as? String {
            cardForm?.backgroundColor = UIColor(hexString: backgroundColor)
        }
        /**
         The following reveals a bug in STPCardFormView where there's a extra space in the layer,
         and thus must remain commented out for now.

         if let borderWidth = cardStyle["borderWidth"] as? Int {
         cardForm?.layer.borderWidth = CGFloat(borderWidth)
         } else {
         cardForm?.layer.borderWidth = CGFloat(0)
         }

         */
        if let borderColor = cardStyle["borderColor"] as? String {
            cardForm?.layer.borderColor = UIColor(hexString: borderColor).cgColor
        }
        if let borderRadius = cardStyle["borderRadius"] as? Int {
            cardForm?.layer.cornerRadius = CGFloat(borderRadius)
        }
        if let cursorColor = cardStyle["cursorColor"] as? String {
            cardForm?.tintColor = UIColor(hexString: cursorColor)
        }
        // if let disabledBackgroundColor = cardStyle["disabledBackgroundColor"] as? String {
        //     cardForm?.disabledBackgroundColor = UIColor(hexString: disabledBackgroundColor)
        // }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    override public func layoutSubviews() {
        cardForm?.frame = bounds
    }

    @available(*, unavailable) required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
