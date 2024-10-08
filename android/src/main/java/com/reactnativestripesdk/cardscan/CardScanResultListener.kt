package com.reactnativestripesdk.cardscan

import com.stripe.android.stripecardscan.payment.card.ScannedCard

interface CardScanResultListener {
  fun onCardScanned(card: ScannedCard)
  fun onCardScannerDismissed()
  fun onCardScannedError(error: Throwable)
}
