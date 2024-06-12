import type { NativeSyntheticEvent, StyleProp, ViewStyle } from 'react-native';
import type { CardBrand } from '../Token';

export type FieldName = 'CardNumber' | 'Cvc' | 'ExpiryDate' | 'PostalCode';

export interface Details {
  readonly last4: string;
  readonly expiryMonth: number;
  readonly expiryYear: number;
  readonly postalCode?: string;
  readonly brand: CardBrand;
  readonly complete: boolean;
  readonly country: string;
  /**
   * WARNING: Full card details are only returned when the `dangerouslyGetFullCardDetails` prop
   * on the `CardField` component is set to `true`.
   * Only do this if you're certain that you fulfill the necessary PCI compliance requirements.
   * Make sure that you're not mistakenly logging or storing full card details!
   * See the docs for details: https://stripe.com/docs/security/guide#validating-pci-compliance
   */
  readonly number?: string;
  readonly cvc?: string;
}

export interface Styles {
  readonly backgroundColor?: string;
  // disabledBackgroundColor?: string;
  // type?: 'borderless' | 'standard';
  readonly borderWidth?: number;
  readonly borderColor?: string;
  readonly borderRadius?: number;
  readonly textColor?: string;
  readonly fontSize?: number;
  readonly placeholderColor?: string;
  readonly cursorColor?: string;
  readonly textErrorColor?: string;
  readonly fontFamily?: string;
}

export interface Placeholders {
  readonly number?: string;
  readonly expiration?: string;
  readonly cvc?: string;
  readonly postalCode?: string;
}

export type DefaultValues = {
  /** The 2-letter country code for the country selected by default on Android. If this is null, it is set by the device's configured region in the Settings app. */
  readonly countryCode?: string;
};

/**
 * @ignore
 */
export interface NativeProps {
  style?: StyleProp<ViewStyle>;
  autofocus?: boolean;
  cardStyle?: Styles;
  /** Android only */
  placeholders?: Placeholders;
  /** Android only */
  defaultValues?: DefaultValues;
  // postalCodeEnabled: boolean;
  onFocusChange(
    event: NativeSyntheticEvent<{ focusedField: FieldName | null }>
  ): void;
  onFormComplete(event: NativeSyntheticEvent<Details>): void;
  disabled?: boolean;
}

export interface Methods {
  focus(): void;
  blur(): void;
}
