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

// =====
@implementation SFFontFeatureTraits

- (instancetype) init
{

    if( (self = [super init]) )
    {
        self.straightSidedSixAndNine = def;
        self.openFour = def;
        self.highLegibility = def;
        self.verticallyCenteredColon = def;
        self.oneStoryA = def;
        self.upperCaseSmallCapitals = def;
        self.lowerCaseSmallCapitals = def;
        self.contextualFractionalForms = def;
        self.monospacedNumbers = def;
        self.proportionallySpacedNumbers = def;
        self.superiorPositions = def;
        self.inferiorPositions = def;
        self.contextualAlternatives = def;
    }

    return self;
}

+ (SFFontFeatureTraits*) traitsWithStraightSidedSixAndNineEnabled
{
    SFFontFeatureTraits* retVal = [SFFontFeatureTraits new];
    retVal.straightSidedSixAndNine = on;
    return retVal;
}

+ (SFFontFeatureTraits*) traitsWithOpenFourEnabled
{
    SFFontFeatureTraits* retVal = [SFFontFeatureTraits new];
    retVal.openFour = on;
    return retVal;
}

+ (SFFontFeatureTraits*) traitsWithHighLegibilityEnabled
{
    SFFontFeatureTraits* retVal = [SFFontFeatureTraits new];
    retVal.highLegibility = on;
    return retVal;
}

+ (SFFontFeatureTraits*) traitsWithVerticallyCenteredColonEnabled
{
    SFFontFeatureTraits* retVal = [SFFontFeatureTraits new];
    retVal.verticallyCenteredColon = on;
    return retVal;
}

+ (SFFontFeatureTraits*) traitsWithOneStoryAEnabled
{
    SFFontFeatureTraits* retVal = [SFFontFeatureTraits new];
    retVal.oneStoryA = on;
    return retVal;
}

+ (SFFontFeatureTraits*) traitsWithUpperCaseSmallCapitalsEnabled
{
    SFFontFeatureTraits* retVal = [SFFontFeatureTraits new];
    retVal.upperCaseSmallCapitals = on;
    return retVal;
}

+ (SFFontFeatureTraits*) traitsWithLowerCaseSmallCapitalsEnabled
{
    SFFontFeatureTraits* retVal = [SFFontFeatureTraits new];
    retVal.lowerCaseSmallCapitals = on;
    return retVal;
}

+ (SFFontFeatureTraits*) traitsWithContextualFractionalFormsEnabled
{
    SFFontFeatureTraits* retVal = [SFFontFeatureTraits new];
    retVal.contextualFractionalForms = on;
    return retVal;
}

+ (SFFontFeatureTraits*) traitsWithMonospacedNumbersEnabled
{
    SFFontFeatureTraits* retVal = [SFFontFeatureTraits new];
    retVal.monospacedNumbers = on;
    return retVal;
}

+ (SFFontFeatureTraits*) traitsWithProportionallySpacedNumbersEnabled
{
    SFFontFeatureTraits* retVal = [SFFontFeatureTraits new];
    retVal.proportionallySpacedNumbers = on;
    return retVal;
}

+ (SFFontFeatureTraits*) traitsWithSuperiorPositionsEnabled
{
    SFFontFeatureTraits* retVal = [SFFontFeatureTraits new];
    retVal.superiorPositions = on;
    return retVal;
}

+ (SFFontFeatureTraits*) traitsWithInferiorPositionsEnabled
{
    SFFontFeatureTraits* retVal = [SFFontFeatureTraits new];
    retVal.inferiorPositions = on;
    return retVal;
}

+ (SFFontFeatureTraits*) traitsWithContextualAlternativeEnabled
{
    SFFontFeatureTraits* retVal = [SFFontFeatureTraits new];
    retVal.contextualAlternatives = on;
    return retVal;
}

+ (SFFontFeatureTraits*) traitsWithContextualAlternativeDisabled
{
    SFFontFeatureTraits* retVal = [SFFontFeatureTraits new];
    retVal.contextualAlternatives = off;
    return retVal;
}

@end

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

- (UIFont*) fontWithTraits:(SFFontFeatureTraits*)traits
{
	NSDictionary* featureAttribute = @{ UIFontDescriptorFeatureSettingsAttribute : [UIFont fontFeatureListWithTraits:traits] };

	return [UIFont fontWithDescriptor:[self.fontDescriptor fontDescriptorByAddingAttributes:featureAttribute] size:self.pointSize];
}

// * fontFeatureListWithFeatureSpecs
+ (NSArray*) fontFeatureListWithTraits:(SFFontFeatureTraits*)traits
{
	NSMutableArray *retVal = [NSMutableArray new];

    NSDictionary* nextFeatureDict = [UIFont fontFeatureSpecDictionaryForFeature:SFFontFeatureStraightSidedSixAndNine enabledT:traits.straightSidedSixAndNine];
    if( nextFeatureDict )
		[retVal addObject:nextFeatureDict];

    nextFeatureDict = [UIFont fontFeatureSpecDictionaryForFeature:SFFontFeatureOpenFour enabledT:traits.openFour];
    if( nextFeatureDict )
		[retVal addObject:nextFeatureDict];

    nextFeatureDict = [UIFont fontFeatureSpecDictionaryForFeature:SFFontFeatureHighLegibility enabledT:traits.highLegibility];
    if( nextFeatureDict )
		[retVal addObject:nextFeatureDict];

    nextFeatureDict = [UIFont fontFeatureSpecDictionaryForFeature:SFFontFeatureVerticallyCenteredColon enabledT:traits.verticallyCenteredColon];
    if( nextFeatureDict )
		[retVal addObject:nextFeatureDict];

    nextFeatureDict = [UIFont fontFeatureSpecDictionaryForFeature:SFFontFeatureOneStoreyA enabledT:traits.oneStoryA];
    if( nextFeatureDict )
		[retVal addObject:nextFeatureDict];

    nextFeatureDict = [UIFont fontFeatureSpecDictionaryForFeature:SFFontFeatureUpperCaseSmallCapitals enabledT:traits.upperCaseSmallCapitals];
    if( nextFeatureDict )
		[retVal addObject:nextFeatureDict];

    nextFeatureDict = [UIFont fontFeatureSpecDictionaryForFeature:SFFontFeatureLowerCaseSmallCapitals enabledT:traits.lowerCaseSmallCapitals];
    if( nextFeatureDict )
		[retVal addObject:nextFeatureDict];

    nextFeatureDict = [UIFont fontFeatureSpecDictionaryForFeature:SFFontFeatureContextualFractionalForms enabledT:traits.contextualFractionalForms];
    if( nextFeatureDict )
		[retVal addObject:nextFeatureDict];

    nextFeatureDict = [UIFont fontFeatureSpecDictionaryForFeature:SFFontFeatureMonospacedNumbers enabledT:traits.monospacedNumbers];
    if( nextFeatureDict )
		[retVal addObject:nextFeatureDict];

    nextFeatureDict = [UIFont fontFeatureSpecDictionaryForFeature:SFFontFeatureProportionalSpacedNumbers enabledT:traits.proportionallySpacedNumbers];
    if( nextFeatureDict )
		[retVal addObject:nextFeatureDict];

    nextFeatureDict = [UIFont fontFeatureSpecDictionaryForFeature:SFFontFeatureSuperiorVerticalPosition enabledT:traits.superiorPositions];
    if( nextFeatureDict )
		[retVal addObject:nextFeatureDict];

    nextFeatureDict = [UIFont fontFeatureSpecDictionaryForFeature:SFFontFeatureInferiorVerticalPosition enabledT:traits.inferiorPositions];
    if( nextFeatureDict )
		[retVal addObject:nextFeatureDict];

    nextFeatureDict = [UIFont fontFeatureSpecDictionaryForFeature:SFFontFeatureContextualAlternates enabledT:traits.contextualAlternatives];
    if( nextFeatureDict )
		[retVal addObject:nextFeatureDict];

	return retVal.copy;
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
        
		NSDictionary* nextFeatureDict = [UIFont fontFeatureSpecDictionaryForFeature:[nextFeatureKey integerValue] enabled:featureEnabled];
		[retVal addObject:nextFeatureDict];
	}

	return retVal.copy;
}

// * fontFeatureDictionaryForFeature
+ (NSDictionary*) fontFeatureSpecDictionaryForFeature:(SFFontFeatureType)feature enabled:(BOOL)enabled
{
    return [UIFont fontFeatureSpecDictionaryForFeature:feature enabledT:enabled ? on : off];
}

+ (NSDictionary*) fontFeatureSpecDictionaryForFeature:(SFFontFeatureType)feature enabledT:(TriState)featureTristate
{
	NSDictionary *retVal = nil;

	switch( feature )
	{
		case SFFontFeatureStraightSidedSixAndNine:
            if( featureTristate != def )
            {
                retVal =
                    @{
                        UIFontFeatureTypeIdentifierKey     : @(kStylisticAlternativesType),
                        UIFontFeatureSelectorIdentifierKey : featureTristate == on ? @(kStylisticAltOneOnSelector) : @(kStylisticAltOneOffSelector)
                    };
            }
			break;

		case SFFontFeatureOpenFour:
            if( featureTristate != def )
            {
                retVal =
                    @{
                        UIFontFeatureTypeIdentifierKey     : @(kStylisticAlternativesType),
                        UIFontFeatureSelectorIdentifierKey : featureTristate == on ? @(kStylisticAltTwoOnSelector) : @(kStylisticAltTwoOffSelector)
                    };
            }
			break;

		case SFFontFeatureVerticallyCenteredColon:
        {
            if( featureTristate != def )
            {
                retVal =
                    @{
                        UIFontFeatureTypeIdentifierKey     : @(kStylisticAlternativesType),
                        UIFontFeatureSelectorIdentifierKey : featureTristate == on ? @(kStylisticAltThreeOnSelector) : @(kStylisticAltThreeOffSelector)
                    };
            }
			break;
        }
		case SFFontFeatureHighLegibility:
            if( featureTristate != def )
            {
                retVal =
                    @{
                        UIFontFeatureTypeIdentifierKey     : @(kStylisticAlternativesType),
                        UIFontFeatureSelectorIdentifierKey : featureTristate == on ? @(kStylisticAltSixOnSelector) : @(kStylisticAltSixOffSelector)
                    };
            }
			break;

		case SFFontFeatureOneStoreyA:
            if( featureTristate != def )
            {
                retVal =
                    @{
                        UIFontFeatureTypeIdentifierKey     : @(kStylisticAlternativesType),
                        UIFontFeatureSelectorIdentifierKey : featureTristate == on ? @(kStylisticAltSevenOnSelector) : @(kStylisticAltSevenOffSelector)
                    };
            }
			break;

		case SFFontFeatureUpperCaseSmallCapitals:
            if( featureTristate != def )
            {
                retVal =
                    @{
                        UIFontFeatureTypeIdentifierKey     : @(kUpperCaseType),
                        UIFontFeatureSelectorIdentifierKey : featureTristate == on ? @(kUpperCaseSmallCapsSelector) : @(kDefaultUpperCaseSelector)
                    };
            }
			break;

		case SFFontFeatureLowerCaseSmallCapitals:
            if( featureTristate != def )
            {
                retVal =
                    @{
                        UIFontFeatureTypeIdentifierKey     : @(kLowerCaseType),
                        UIFontFeatureSelectorIdentifierKey : featureTristate == on ? @(kLowerCaseSmallCapsSelector) : @(kDefaultLowerCaseSelector)
                    };
            }
			break;

		case SFFontFeatureContextualFractionalForms:
            if( featureTristate != def )
            {
                retVal =
                    @{
                        UIFontFeatureTypeIdentifierKey     : @(kFractionsType),
                        UIFontFeatureSelectorIdentifierKey : featureTristate == on ? @(kDiagonalFractionsSelector) : @(kNoFractionsSelector)
                    };
            }
			break;

		case SFFontFeatureMonospacedNumbers:
            if( featureTristate != def )
            {
                retVal =
                    @{
                        UIFontFeatureTypeIdentifierKey     : @(kNumberSpacingType),
                        UIFontFeatureSelectorIdentifierKey : featureTristate == on ? @(kMonospacedNumbersSelector) : @(kProportionalNumbersSelector)
                    };
            }
			break;

		case SFFontFeatureProportionalSpacedNumbers:
            if( featureTristate != def )
            {
                retVal =
                    @{
                        UIFontFeatureTypeIdentifierKey     : @(kNumberSpacingType),
                        UIFontFeatureSelectorIdentifierKey : featureTristate == on ? @(kProportionalNumbersSelector) : @(kMonospacedNumbersSelector)
                    };
            }
			break;

		case SFFontFeatureSuperiorVerticalPosition:
            if( featureTristate != def )
            {
                retVal =
                    @{
                        UIFontFeatureTypeIdentifierKey     : @(kVerticalPositionType),
                        UIFontFeatureSelectorIdentifierKey : featureTristate == on ? @(kSuperiorsSelector) : @(kNormalPositionSelector)
                    };
            }
			break;

		case SFFontFeatureInferiorVerticalPosition:
            if( featureTristate != def )
            {
                retVal =
                    @{
                        UIFontFeatureTypeIdentifierKey     : @(kVerticalPositionType),
                        UIFontFeatureSelectorIdentifierKey : featureTristate == on ? @(kInferiorsSelector) : @(kNormalPositionSelector)
                    };
            }
			break;

		case SFFontFeatureContextualAlternates:
            if( featureTristate != def )
            {
                retVal =
                    @{
                        UIFontFeatureTypeIdentifierKey     : @(kContextualAlternatesType),
                        UIFontFeatureSelectorIdentifierKey : featureTristate == on ? @(kContextualAlternatesOnSelector) : @(kContextualAlternatesOffSelector)
                    };
            }
			break;
	}

	return retVal;
}

@end
