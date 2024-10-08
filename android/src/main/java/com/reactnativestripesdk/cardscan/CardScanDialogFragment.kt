package com.reactnativestripesdk.cardscan

import android.os.Bundle
import com.google.android.material.bottomsheet.BottomSheetDialogFragment
import com.stripe.android.stripecardscan.cardscan.CardScanSheet
import com.stripe.android.stripecardscan.cardscan.CardScanSheetResult

class CardScanDialogFragment: BottomSheetDialogFragment() {
  private var cardScanResultListener: CardScanResultListener? = null
  private var cardScanStripePublishableKey: String = ""

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)

    val cardSheet = CardScanSheet.create(
      this,
      cardScanStripePublishableKey,
      { cardScanScreenResult ->
        when (cardScanScreenResult) {
          is CardScanSheetResult.Completed -> {
            val card = cardScanScreenResult.scannedCard
            cardScanResultListener?.onCardScanned(card)
          }

          is CardScanSheetResult.Canceled -> {
            cardScanResultListener?.onCardScannerDismissed()
          }

          is CardScanSheetResult.Failed -> {
            cardScanResultListener?.onCardScannedError(cardScanScreenResult.error)
          }
        }
      }
    )

    cardSheet.present()
  }

  companion object {
    const val TAG = "CardScanDialogFragment"
    fun newInstance(
      listener: CardScanResultListener,
      stripePublishableKey: String
    ) = CardScanDialogFragment().apply {
      cardScanResultListener = listener
      cardScanStripePublishableKey = stripePublishableKey
    }
  }
}
