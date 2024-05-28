import type { ViewProps } from 'react-native/Libraries/Components/View/ViewPropTypes';
import type { HostComponent, StyleProp, ViewStyle } from 'react-native';
import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';
// import codegenNativeCommands from 'react-native/Libraries/Utilities/codegenNativeCommands';
import type { DirectEventHandler } from 'react-native/Libraries/Types/CodegenTypes';
import type { CardFormView, CardBrand } from '../types';
// import React from 'react';

export interface NativeProps extends ViewProps {
  readonly style?: StyleProp<ViewStyle>;
  readonly autofocus?: boolean;
  readonly testID?: string;
  readonly disabled?: boolean;
  readonly cardStyle?: CardFormView.Styles;
  readonly preferredNetworks?: Array<CardBrand>;

  /** Android only */
  readonly placeholders?: CardFormView.Placeholders;
  /** Android only */
  readonly defaultValues?: CardFormView.DefaultValues;

  readonly onFormComplete?: DirectEventHandler<{
    readonly card: CardFormView.Details;
  }>;

  readonly dangerouslyGetFullCardDetails?: boolean;
}

export default codegenNativeComponent<NativeProps>(
  'CardFormNativeComponent'
) as HostComponent<NativeProps>;
