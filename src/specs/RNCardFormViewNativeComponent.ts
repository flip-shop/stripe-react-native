import type { ViewProps } from 'react-native/Libraries/Components/View/ViewPropTypes';
import type { HostComponent, StyleProp, ViewStyle } from 'react-native';
import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';
import codegenNativeCommands from 'react-native/Libraries/Utilities/codegenNativeCommands';
import type {
  DirectEventHandler,
  Int32,
  Float,
} from 'react-native/Libraries/Types/CodegenTypes';
// import type { CardFormView, CardBrand } from '../types';
import React from 'react';

export interface NativeProps extends ViewProps {
  // readonly style?: StyleProp<ViewStyle>;
  readonly autofocus?: boolean; //
  readonly testID?: string;
  readonly disabled?: boolean;
  readonly cardStyle?: Styles; //
  readonly preferredNetworks?: Array<Int32>;
  // /** Android only */
  readonly placeholders?: Placeholders; //
  // /** Android only */
  readonly defaultValues?: DefaultValues;
  readonly onFormComplete?: DirectEventHandler<CardDetails>;
  readonly dangerouslyGetFullCardDetails?: boolean;
}

type RNCardFormViewNativeComponentType = HostComponent<NativeProps>;

export default codegenNativeComponent<NativeProps>(
  'RNCardFormView'
) as RNCardFormViewNativeComponentType;

interface NativeCommands {
  focus: (viewRef: React.ElementRef<RNCardFormViewNativeComponentType>) => void;
  blur: (viewRef: React.ElementRef<RNCardFormViewNativeComponentType>) => void;
}

export const Commands: NativeCommands = codegenNativeCommands<NativeCommands>({
  supportedCommands: ['focus', 'blur'],
});

type Placeholders = Readonly<{
  readonly number?: string;
  readonly expiration?: string;
  readonly cvc?: string;
  readonly postalCode?: string;
}>;

type DefaultValues = Readonly<{
  readonly countryCode?: string;
}>;

type CardDetails = Readonly<{
  readonly last4: string;
  readonly expiryMonth: Int32;
  readonly expiryYear: Int32;
  readonly postalCode?: string;
  readonly brand: string;
  readonly complete: boolean;
  readonly country: string;
  // /**
  //  * WARNING: Full card details are only returned when the `dangerouslyGetFullCardDetails` prop
  //  * on the `CardField` component is set to `true`.
  //  * Only do this if you're certain that you fulfill the necessary PCI compliance requirements.
  //  * Make sure that you're not mistakenly logging or storing full card details!
  //  * See the docs for details: https://stripe.com/docs/security/guide#validating-pci-compliance
  //  */
  readonly number?: string;
  readonly cvc?: string;
}>;

type Styles = Readonly<{
  readonly backgroundColor?: string;
  // disabledBackgroundColor?: string;
  // type?: 'borderless' | 'standard';
  readonly borderWidth?: Float;
  readonly borderColor?: string;
  readonly borderRadius?: Float;
  readonly textColor?: string;
  readonly fontSize?: Float;
  readonly placeholderColor?: string;
  readonly cursorColor?: string;
  readonly textErrorColor?: string;
  readonly fontFamily?: string;
}>;

enum CardBrand {
  JCB = 0,
  Amex = 1,
  CartesBancaires = 2,
  DinersClub = 3,
  Discover = 4,
  Mastercard = 5,
  UnionPay = 6,
  Visa = 7,
  Unknown = 8,
}
