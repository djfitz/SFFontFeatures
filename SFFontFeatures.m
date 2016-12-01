/*
    SFFontFeatures.m


Copyright (c) 2016 Doug Hill

Permission is hereby granted, free of charge, to any person obtaining a copy of this software
and associated documentation files (the "Software"), to deal in the Software without restriction,
including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial
portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

@import CoreText;

#import "SFFontFeatures.h"


// =================================================
// UIFont - SFFontFeatures category extension
// =================================================

@implementation UIFont (SFFontFeatures)

// * systemFontOfSize:weight:features:
+ (instancetype) systemFontOfSize:(CGFloat)pointSize weight:(CGFloat)weight features:(NSDictionary*)features
{
	UIFont* newSystemFont = [UIFont systemFontOfSize:pointSize weight:weight];

	return [newSystemFont fontWithFeatures:features];
}

// * fontWithFeatures
- (UIFont*) fontWithFeatures:(NSDictionary*)features;
{
	NSDictionary* featureAttribute = @{ UIFontDescriptorFeatureSettingsAttribute : [UIFont fontFeatureListWithFeatureSpecs:features] };

	return [UIFont fontWithDescriptor:[self.fontDescriptor fontDescriptorByAddingAttributes:featureAttribute] size:self.pointSize];
}

// * fontFeatureListWithFeatureSpecs
+ (NSArray*) fontFeatureListWithFeatureSpecs:(NSDictionary*)featureDictionary
{
	NSMutableArray *retVal = [NSMutableArray new];

	for( NSNumber* nextFeatureKey in featureDictionary.allKeys )
	{
		BOOL featureEnabled = ((NSNumber*)featureDictionary[nextFeatureKey]).boolValue;
		NSDictionary* nextFeatureDict = [UIFont fontFeatureSpecDictionaryForFeature:nextFeatureKey.integerValue enabled:featureEnabled];
		[retVal addObject:nextFeatureDict];
	}

	return retVal.copy;
}

// * fontFeatureDictionaryForFeature
+ (NSDictionary*) fontFeatureSpecDictionaryForFeature:(SFFontFeatureType)feature enabled:(BOOL)enabled
{
	NSDictionary *retVal = nil;

	switch( feature )
	{
		case SFFontFeatureStraightSidedSixAndNine:
			retVal =
				@{
					UIFontFeatureTypeIdentifierKey     : @(kStylisticAlternativesType),
					UIFontFeatureSelectorIdentifierKey : enabled ? @(kStylisticAltOneOnSelector) : @(kStylisticAltOneOffSelector)
				};
			break;

		case SFFontFeatureOpenFour:
			retVal =
				@{
					UIFontFeatureTypeIdentifierKey     : @(kStylisticAlternativesType),
					UIFontFeatureSelectorIdentifierKey : enabled ? @(kStylisticAltTwoOnSelector) : @(kStylisticAltTwoOffSelector)
				};
			break;

		case SFFontFeatureVerticallyCenteredColon:
			retVal =
				@{
					UIFontFeatureTypeIdentifierKey     : @(kStylisticAlternativesType),
					UIFontFeatureSelectorIdentifierKey : enabled ? @(kStylisticAltThreeOnSelector) : @(kStylisticAltThreeOffSelector)
				};
			break;

		case SFFontFeatureHighLegibility:
			retVal =
				@{
					UIFontFeatureTypeIdentifierKey     : @(kStylisticAlternativesType),
					UIFontFeatureSelectorIdentifierKey : enabled ? @(kStylisticAltSixOnSelector) : @(kStylisticAltSixOffSelector)
				};
			break;

		case SFFontFeatureOneStoreyA:
			retVal =
				@{
					UIFontFeatureTypeIdentifierKey     : @(kStylisticAlternativesType),
					UIFontFeatureSelectorIdentifierKey : enabled ? @(kStylisticAltSevenOnSelector) : @(kStylisticAltSevenOffSelector)
				};
			break;

		case SFFontFeatureUpperCaseSmallCapitals:
			retVal =
				@{
					UIFontFeatureTypeIdentifierKey     : @(kUpperCaseType),
					UIFontFeatureSelectorIdentifierKey : @(kUpperCaseSmallCapsSelector)
				};
			break;

		case SFFontFeatureLowerCaseSmallCapitals:
			retVal =
				@{
					UIFontFeatureTypeIdentifierKey     : @(kLowerCaseType),
					UIFontFeatureSelectorIdentifierKey : enabled ? @(kLowerCaseSmallCapsSelector) : @(kDefaultLowerCaseSelector)
				};
			break;

		case SFFontFeatureContextualFractionalForms:
			retVal =
				@{
					UIFontFeatureTypeIdentifierKey     : @(kFractionsType),
					UIFontFeatureSelectorIdentifierKey : enabled ? @(kDiagonalFractionsSelector) : @(kNoFractionsSelector)
				};
			break;

		case SFFontFeatureMonospacedNumbers:
			retVal =
				@{
					UIFontFeatureTypeIdentifierKey     : @(kNumberSpacingType),
					UIFontFeatureSelectorIdentifierKey : enabled ? @(kMonospacedNumbersSelector) : @(kProportionalNumbersSelector)
				};
			break;

		case SFFontFeatureProportionalSpacedNumbers:
			retVal =
				@{
					UIFontFeatureTypeIdentifierKey     : @(kNumberSpacingType),
					UIFontFeatureSelectorIdentifierKey : enabled ? @(kProportionalNumbersSelector) : @(kMonospacedNumbersSelector)
				};
			break;

		case SFFontFeatureSuperiorVerticalPosition:
			retVal =
				@{
					UIFontFeatureTypeIdentifierKey     : @(kVerticalPositionType),
					UIFontFeatureSelectorIdentifierKey : enabled ? @(kSuperiorsSelector) : @(kNormalPositionSelector)
				};
			break;

		case SFFontFeatureInferiorVerticalPosition:
			retVal =
				@{
					UIFontFeatureTypeIdentifierKey     : @(kVerticalPositionType),
					UIFontFeatureSelectorIdentifierKey : enabled ? @(kInferiorsSelector) : @(kNormalPositionSelector)
				};
			break;

		case SFFontFeatureContextualAlternates:
			retVal =
				@{
					UIFontFeatureTypeIdentifierKey     : @(kContextualAlternatesType),
					UIFontFeatureSelectorIdentifierKey : enabled ? @(kContextualAlternatesOnSelector) : @(kContextualAlternatesOffSelector)
				};
			break;
	}

	return retVal;
}

@end
