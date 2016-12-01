/*
    SFFontFeatures.h

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

@import UIKit;


// ============================================================================================================
// Font Features
// ============================================================================================================

typedef NS_ENUM(NSUInteger, SFFontFeatureType)
{
	/*!
		Alternate glyph forms of the six and nine characters that have a straight side.

		These glyph variant forms are easier to distinguish from each other and an eight at smaller
		point sizes. There are also stylistic differences that might be desirable.
	*/
    SFFontFeatureStraightSidedSixAndNine,

	/*!
		Alternate glyph form of the four character that has an open top.

		This glyph variant form is easier to distinguish from other glyphs at smaller
		point sizes. There are also stylistic differences that might be desirable.
	*/
    SFFontFeatureOpenFour,

	/*!
		Turns on a collection of font features that create higher legibility, especially at smaller point sizes.

		By experimentation, it appears that this does the following:
		• Turns on Straight-sided six and nine
		• Turns on Open Four
		• Uses alternate lower-case 'l' glyph with a serif/swoosh.
		• Tracking and Kerning is changed.
		• possibly others.
	*/
    SFFontFeatureHighLegibility,

	/*!
		Centers the colon ':' glyph on the line with capital letter glyphs, rather than sitting on the baseline.
		Used most often with displaying time e.g. 10:20

		This feature is on by default for SF font. For the default case, this feature will only be applied if the
		character stream has <numeric digits>:<numeric digits>. If your character stream is not of this form,
		e.g. a:1, you will need to turn this on manually.
	*/
    SFFontFeatureVerticallyCenteredColon,

	/*!
		Alternate form of the lower-case a that is an oval with a straight bar on the right side.
		Doesn't have the usual curved swash on the top.
	*/
	SFFontFeatureOneStoreyA,

	/*!
		Glyphs for upper-case characters are converted to smaller height versions.

		These alternate glyphs are the same height as lower-case glyphs. Also, numbers will be shrunk to be the same
		height.
	*/
	SFFontFeatureUpperCaseSmallCapitals,

	/*!
		Glyphs for lower-case characters are converted to upper-case glyphs.

		These alternate glyphs are the same height as lower-case glyphs. Also, numbers will be shrunk to be the same
		height.
	*/
	SFFontFeatureLowerCaseSmallCapitals,

	/*!
		Character streams that are of the form <numeric digits>/<numberic digits> are converted
		to a fractional form.

		This form is accomplished by doing the following:
		• First set of numeric digits (e.g. numerator) are changed to a smaller point size. This could change the font to
		SF Display vs. Text, changes tracking, possibly changing other letter forms.
		• Numerator is superscripted.
		• Slash character is changed to the special unicode fraction /.
		• The second set of numeric digits (e.g. denominator) is changed to a smaller size, as the numerator above.
		• Denominator is possibly subscripted.
		• Numerator and denominator fit neatly above and below the fraction / character glyph.
	*/
	SFFontFeatureContextualFractionalForms,

	/*!
		Numbers use monospaced versions.
	*/
	SFFontFeatureMonospacedNumbers,

	/*!
		Numbers use proportionally spaced versions.
	*/
	SFFontFeatureProportionalSpacedNumbers,

	/*!
		Implements superscripting by using specific superior glyph forms.
	*/
	SFFontFeatureSuperiorVerticalPosition,

	/*!
		Implements subscripting by using specific inferior glyph forms.
	*/
	SFFontFeatureInferiorVerticalPosition,

	/*!
		Not sure what this does, I see it in the font panel for SF font.
		SDK docs list these values:
			ContextualAlternatesOn/Off
			SwashAlternatesOn/Off
			ContextualSwashAlternatesOn/Off
		For now, this feature setting will enable ContextualAlternatesOn/Off
	*/
	SFFontFeatureContextualAlternates
};

// ============================================================================================================
// UIFont - SFFontFeatures category extension
// ============================================================================================================

/*!
	A convenience extension to UIFont for enabling features specific to the San Francisco font.

	See here for more info:
	http://breaqz.com/font/AlternateStylisticForms.pdf

	Many of the features of the San Francisco font are enabled by odd OpenType settings (e.g. Alternate Stylistic Features)
	which aren't named in the SDK headers. This class extension abstracts the specifics to enable these features.

	NOTE 1: Some of these features are mutually exclusive. e.g. Monospaced Numbers and Proportional numbers.
	They are both in the feature list because sometimes you need to turn off default behavior. However,
	mixing these two settings On in the same font will probably be undefined. Be careful when using multiple
	simultaneous features!

	NOTE 2: Some features require specific character stream requirements. For example, fractional form requires the
	character stream that is applied this font to be <digits>/<digits>. If the feature doesn't seem to work,
	check the character stream.

	NOTE 3: Some features are on by default for the SF font. If so, turning on a feature won't have any visible effect.
	You can try experimenting turning features off to see how they affect the resultant output.

	NOTE 4: If the feature which should be enabled by default doesn't enable due to the character stream requirements
	not being met, you can try explicitly turning it on. See also SFFontFeatureVerticallyCenteredColon

	Due to the above limitations/restrictions, it's probably best practice to enable individual font features for ranges
	of an attributed string. Rather than turning on multiple features for the entire string.

	Finally, feel free to ask Apple to add to their SDKs interfaces to more easily enable these SF font features (e.g. UIKit).
	Particularly, to document the Stylistic Alternatives.
*/
@interface UIFont (SFFontFeatures)

/*!
	Creates a new font object by adding SF font features to the reciever font.

	@param features		A dictionary that describes the features to enable or disable.
	Dictionary items are of the form:
	Key = @(feature)
	Value = @(YES/NO) to enable or disable that feature

	Example:
	UIFont* someFont = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
	UIFont* fontWithFeatures = [someFont fontWithFeatures:@{ @(SFFontFeatureVerticallyCenteredColon) : @(YES) }];

	@return	A new font that is based on this font that has the specified features.
*/
- (UIFont*) fontWithFeatures:(NSDictionary*)features;

/*!
	Conveniance method that creates a new font and adds the features to it.
*/
+ (instancetype) systemFontOfSize:(CGFloat)pointSize weight:(CGFloat)weight features:(NSDictionary*)features;

@end
