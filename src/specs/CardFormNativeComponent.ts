import type { ViewProps } from 'react-native/Libraries/Components/View/ViewPropTypes';
import type { HostComponent, StyleProp, ViewStyle } from 'react-native';
import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';
import codegenNativeCommands from 'react-native/Libraries/Utilities/codegenNativeCommands';
import type { DirectEventHandler } from 'react-native/Libraries/Types/CodegenTypes';
import type { CardFormView, CardBrand } from '../types';
import React from 'react';

export interface NativeProps extends ViewProps {
  readonly style?: StyleProp<ViewStyle>;
  readonly autofocus?: boolean; //
  readonly testID?: string;
  readonly disabled?: boolean;
  readonly cardStyle?: CardFormView.Styles; //
  readonly preferredNetworks?: Array<CardBrand>;

  /** Android only */
  readonly placeholders?: CardFormView.Placeholders; //
  /** Android only */
  readonly defaultValues?: CardFormView.DefaultValues;

  readonly onFormComplete?: DirectEventHandler<{
    //
    readonly card: CardFormView.Details;
  }>;

  readonly dangerouslyGetFullCardDetails?: boolean;
}

type CardFormNativeComponentType = HostComponent<NativeProps>;

export default codegenNativeComponent<NativeProps>(
  'CardFormView'
) as CardFormNativeComponentType;

interface NativeCommands {
  focus: (viewRef: React.ElementRef<CardFormNativeComponentType>) => void;
  blur: (viewRef: React.ElementRef<CardFormNativeComponentType>) => void;
}

export const Commands: NativeCommands = codegenNativeCommands<NativeCommands>({
  supportedCommands: ['focus', 'blur'],
});
