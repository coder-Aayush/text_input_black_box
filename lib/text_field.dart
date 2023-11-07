import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormField extends StatefulWidget {
  static const double _defaultFontSize = 14.0;

  final AutovalidateMode? autovalidateMode;

  final String? initialValue;

  final Function(String)? onFieldSubmitted;

  final Function(String?)? onSaved;

  final String? Function(String?)? validator;

  static const int noMaxLength = -1;

  final Key? textFieldKey;

  final TextSpan? textSpan;

  final TextStyle? style;

  final StrutStyle? strutStyle;

  final double minFontSize;

  final double maxFontSize;

  final double stepGranularity;

  final List<double>? presetFontSizes;

  final TextAlign textAlign;

  final TextDirection? textDirection;

  final Locale? locale;

  final bool wrapWords;

  final Widget? overflowReplacement;

  final int? maxLines;

  final String? semanticsLabel;
  final TextEditingController? controller;

  final FocusNode? focusNode;

  final InputDecoration decoration;
  final TextInputType keyboardType;

  final TextInputAction? textInputAction;

  final TextCapitalization textCapitalization;

  final TextAlignVertical? textAlignVertical;

  final Iterable<String>? autofillHints;

  final bool autofocus;

  final bool obscureText;

  final bool autocorrect;

  final SmartDashesType smartDashesType;

  final SmartQuotesType smartQuotesType;

  final bool enableSuggestions;
  final int? minLines;

  final bool expands;

  final bool readOnly;

  final ToolbarOptions toolbarOptions;

  final bool? showCursor;

  /// The maximum number of characters (Unicode scalar values) to allow in the
  /// text field.
  ///
  /// If set, a character counter will be displayed below the
  /// field showing how many characters have been entered. If set to a number
  /// greater than 0, it will also display the maximum number allowed. If set
  /// to [TextField.noMaxLength] then only the current character count is displayed.
  ///
  /// After [maxLength] characters have been input, additional input
  /// is ignored, unless [maxLengthEnforcement] is set to
  /// [MaxLengthEnforcement.none].
  ///
  /// The text field enforces the length with a [LengthLimitingTextInputFormatter],
  /// which is evaluated after the supplied [inputFormatters], if any.
  ///
  /// This value must be either null, [TextField.noMaxLength], or greater than 0.
  /// If null (the default) then there is no limit to the number of characters
  /// that can be entered. If set to [TextField.noMaxLength], then no limit will
  /// be enforced, but the number of characters entered will still be displayed.
  ///
  /// Whitespace characters (e.g. newline, space, tab) are included in the
  /// character count.
  ///
  /// If [maxLengthEnforcement] is [MaxLengthEnforcement.none], then more than
  /// [maxLength] characters may be entered, but the error counter and divider
  /// will switch to the [decoration]'s [InputDecoration.errorStyle] when the
  /// limit is exceeded.
  ///
  /// {@macro flutter.services.lengthLimitingTextInputFormatter.maxLength}
  final int? maxLength;

  /// Determines how the [maxLength] limit should be enforced.
  ///
  /// {@macro flutter.services.textFormatter.effectiveMaxLengthEnforcement}
  ///
  /// {@macro flutter.services.textFormatter.maxLengthEnforcement}
  final MaxLengthEnforcement? maxLengthEnforcement;

  /// {@macro flutter.widgets.editableText.onChanged}
  ///
  /// See also:
  ///
  ///  * [inputFormatters], which are called before [onChanged]
  ///    runs and can validate and change ("format") the input value.
  ///  * [onEditingComplete], [onSubmitted], [onSelectionChanged]:
  ///    which are more specialized input change notifications.
  final ValueChanged<String>? onChanged;

  /// {@macro flutter.widgets.editableText.onEditingComplete}
  final VoidCallback? onEditingComplete;

  /// {@macro flutter.widgets.editableText.inputFormatters}
  final List<TextInputFormatter>? inputFormatters;

  /// If false the text field is "disabled": it ignores taps and its
  /// [decoration] is rendered in grey.
  ///
  /// If non-null this property overrides the [decoration]'s
  /// [Decoration.enabled] property.
  final bool? enabled;

  /// {@macro flutter.widgets.editableText.cursorWidth}
  final double cursorWidth;

  /// {@macro flutter.widgets.editableText.cursorRadius}
  final Radius? cursorRadius;

  /// The color to use when painting the cursor.
  ///
  /// Defaults to [TextSelectionThemeData.cursorColor] or [CupertinoTheme.primaryColor]
  /// depending on [ThemeData.platform].
  final Color? cursorColor;

  /// The appearance of the keyboard.
  ///
  /// This setting is only honored on iOS devices.
  ///
  /// If unset, defaults to [ThemeData.brightness].
  final Brightness? keyboardAppearance;

  /// {@macro flutter.widgets.editableText.scrollPadding}
  final EdgeInsets scrollPadding;

  /// {@macro flutter.widgets.editableText.enableInteractiveSelection}
  final bool enableInteractiveSelection;

  /// {@template flutter.material.textfield.onTap}
  /// Called for each distinct tap except for every second tap of a double tap.
  ///
  /// The text field builds a [GestureDetector] to handle input events like tap,
  /// to trigger focus requests, to move the caret, adjust the selection, etc.
  /// Handling some of those events by wrapping the text field with a competing
  /// GestureDetector is problematic.
  ///
  /// To unconditionally handle taps, without interfering with the text field's
  /// internal gesture detector, provide this callback.
  ///
  /// If the text field is created with [enabled] false, taps will not be
  /// recognized.
  ///
  /// To be notified when the text field gains or loses the focus, provide a
  /// [focusNode] and add a listener to that.
  ///
  /// To listen to arbitrary pointer events without competing with the
  /// text field's internal gesture detector, use a [Listener].
  /// {@endtemplate}
  final GestureTapCallback? onTap;

  /// Callback that generates a custom [InputDecorator.counter] widget.
  ///
  /// See [InputCounterWidgetBuilder] for an explanation of the passed in
  /// arguments.  The returned widget will be placed below the line in place of
  /// the default widget built when [counterText] is specified.
  ///
  /// The returned widget will be wrapped in a [Semantics] widget for
  /// accessibility, but it also needs to be accessible itself.  For example,
  /// if returning a Text widget, set the [semanticsLabel] property.
  ///
  /// {@tool snippet}
  /// ```dart
  /// Widget counter(
  ///   BuildContext context,
  ///   {
  ///     int currentLength,
  ///     int maxLength,
  ///     bool isFocused,
  ///   }
  /// ) {
  ///   return Text(
  ///     '$currentLength of $maxLength characters',
  ///     semanticsLabel: 'character count',
  ///   );
  /// }
  /// ```
  /// {@end-tool}
  ///
  /// If buildCounter returns null, then no counter and no Semantics widget will
  /// be created at all.
  final InputCounterWidgetBuilder? buildCounter;

  /// {@macro flutter.widgets.editableText.scrollPhysics}
  final ScrollPhysics? scrollPhysics;

  /// {@macro flutter.widgets.editableText.scrollController}
  final ScrollController? scrollController;

  final bool fullwidth;

  final double? minWidth;

  /// Creates a [CustomFormField] widget.
  ///
  /// If the [style] argument is null, the text will use the style from the
  /// closest enclosing [DefaultTextStyle].
  const CustomFormField({
    Key? key,
    this.autovalidateMode,
    this.initialValue,
    this.validator,
    this.onFieldSubmitted,
    this.onSaved,
    this.fullwidth = true,
    this.textFieldKey,
    this.style,
    this.strutStyle,
    this.minFontSize = 12,
    this.maxFontSize = double.infinity,
    this.stepGranularity = 1,
    this.presetFontSizes,
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.locale,
    this.wrapWords = true,
    this.overflowReplacement,
    this.semanticsLabel,
    this.controller,
    this.focusNode,
    this.decoration = const InputDecoration(),
    TextInputType? keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.textAlignVertical,
    this.autofillHints,
    this.autofocus = false,
    this.obscureText = false,
    this.autocorrect = true,
    SmartDashesType? smartDashesType,
    SmartQuotesType? smartQuotesType,
    this.enableSuggestions = true,
    this.maxLines = 1,
    this.expands = false,
    this.readOnly = false,
    ToolbarOptions? toolbarOptions,
    this.showCursor,
    this.maxLength,
    this.maxLengthEnforcement,
    this.onChanged,
    this.onEditingComplete,
    this.inputFormatters,
    this.enabled,
    this.cursorWidth = 2.0,
    this.cursorRadius,
    this.cursorColor,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.enableInteractiveSelection = true,
    this.onTap,
    this.buildCounter,
    this.scrollPhysics,
    this.scrollController,
    this.minLines,
    this.minWidth,
  })  : textSpan = null,
        smartDashesType = smartDashesType ??
            (obscureText ? SmartDashesType.disabled : SmartDashesType.enabled),
        smartQuotesType = smartQuotesType ??
            (obscureText ? SmartQuotesType.disabled : SmartQuotesType.enabled),
        assert(minLines == null || minLines > 0),
        assert((minWidth == null && fullwidth == true) || fullwidth == false),
        assert(!obscureText || maxLines == 1,
            'Obscured fields cannot be multiline.'),
        assert(maxLength == null ||
            maxLength == TextField.noMaxLength ||
            maxLength > 0),
        keyboardType = keyboardType ??
            (maxLines == 1 ? TextInputType.text : TextInputType.multiline),
        toolbarOptions = toolbarOptions ??
            (obscureText
                ? const ToolbarOptions(
                    selectAll: true,
                    paste: true,
                  )
                : const ToolbarOptions(
                    copy: true,
                    cut: true,
                    selectAll: true,
                    paste: true,
                  )),
        super(key: key);

  /// The text to display.
  ///
  /// This will be null if a [textSpan] is provided instead.
  String get data => controller!.text;

  /// {@macro flutter.rendering.editable.selectionEnabled}
  bool get selectionEnabled => enableInteractiveSelection;

  @override
  _CustomFormFieldState createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  late double _textSpanWidth;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, size) {
      var defaultTextStyle = DefaultTextStyle.of(context);

      var style = widget.style;
      if (widget.style == null || widget.style!.inherit) {
        style = defaultTextStyle.style.merge(widget.style);
      }
      if (style!.fontSize == null) {
        style = style.copyWith(fontSize: CustomFormField._defaultFontSize);
      }

      var maxLines = widget.maxLines ?? defaultTextStyle.maxLines;
      _sanityCheck();

      var result = _calculateFontSize(size, style, maxLines);
      var fontSize = result[0] as double;
      var textFits = result[1] as bool;

      Widget textField;
      textField = _buildTextField(fontSize, style, maxLines);
      if (widget.overflowReplacement != null && !textFits) {
        return widget.overflowReplacement!;
      } else {
        return textField;
      }
    });
  }

  @override
  void initState() {
    super.initState();

    widget.controller!.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  Widget _buildTextField(double fontSize, TextStyle style, int? maxLines) {
    return SizedBox(
      width: widget.fullwidth
          ? double.infinity
          : math.max(fontSize,
              _textSpanWidth * MediaQuery.of(context).textScaleFactor),
      child: TextFormField(
        key: widget.textFieldKey,
        autovalidateMode: widget.autovalidateMode,
        autocorrect: widget.autocorrect,
        autofillHints: widget.autofillHints,
        autofocus: widget.autofocus,
        buildCounter: widget.buildCounter,
        controller: widget.controller,
        cursorColor: widget.cursorColor,
        cursorRadius: widget.cursorRadius,
        cursorWidth: widget.cursorWidth,
        decoration: widget.decoration,
        enabled: widget.enabled,
        enableInteractiveSelection: widget.enableInteractiveSelection,
        enableSuggestions: widget.enableSuggestions,
        expands: widget.expands,
        focusNode: widget.focusNode,
        initialValue: widget.initialValue,
        inputFormatters: widget.inputFormatters,
        keyboardAppearance: widget.keyboardAppearance,
        keyboardType: widget.keyboardType,
        maxLength: widget.maxLength,
        maxLengthEnforcement: widget.maxLengthEnforcement,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        obscureText: widget.obscureText,
        onFieldSubmitted: widget.onFieldSubmitted,
        onChanged: widget.onChanged,
        onEditingComplete: widget.onEditingComplete,
        onTap: widget.onTap,
        onSaved: widget.onSaved,
        readOnly: widget.readOnly,
        scrollController: widget.scrollController,
        scrollPadding: widget.scrollPadding,
        scrollPhysics: NeverScrollableScrollPhysics(),
        showCursor: widget.showCursor,
        smartDashesType: widget.smartDashesType,
        smartQuotesType: widget.smartQuotesType,
        strutStyle: widget.strutStyle,
        style: style.copyWith(fontSize: fontSize),
        textAlign: widget.textAlign,
        textAlignVertical: widget.textAlignVertical,
        textCapitalization: widget.textCapitalization,
        textDirection: widget.textDirection,
        textInputAction: widget.textInputAction,
        toolbarOptions: widget.toolbarOptions,
        validator: widget.validator,
      ),
    );
  }

  List _calculateFontSize(
      BoxConstraints size, TextStyle? style, int? maxLines) {
    var span = TextSpan(
      style: widget.textSpan?.style ?? style,
      text: widget.textSpan?.text ?? widget.data,
      children: widget.textSpan?.children,
      recognizer: widget.textSpan?.recognizer,
    );

    var userScale = MediaQuery.textScaleFactorOf(context);

    int left;
    int right;

    var presetFontSizes = widget.presetFontSizes?.reversed.toList();
    if (presetFontSizes == null) {
      num defaultFontSize =
          style!.fontSize!.clamp(widget.minFontSize, widget.maxFontSize);
      var defaultScale = defaultFontSize * userScale / style.fontSize!;
      if (_checkTextFits(span, defaultScale, maxLines, size)) {
        return [defaultFontSize * userScale, true];
      }

      left = (widget.minFontSize / widget.stepGranularity).floor();
      right = (defaultFontSize / widget.stepGranularity).ceil();
    } else {
      left = 0;
      right = presetFontSizes.length - 1;
    }

    var lastValueFits = false;
    while (left <= right) {
      var mid = (left + (right - left) / 2).toInt();
      double scale;
      if (presetFontSizes == null) {
        scale = mid * userScale * widget.stepGranularity / style!.fontSize!;
      } else {
        scale = presetFontSizes[mid] * userScale / style!.fontSize!;
      }

      if (_checkTextFits(span, scale, maxLines, size)) {
        left = mid + 1;
        lastValueFits = true;
      } else {
        right = mid - 1;
        if (maxLines == null) left = right - 1;
      }
    }

    if (!lastValueFits) {
      right += 1;
    }

    double fontSize;
    if (presetFontSizes == null) {
      fontSize = right * userScale * widget.stepGranularity;
    } else {
      fontSize = presetFontSizes[right] * userScale;
    }

    return [fontSize, lastValueFits];
  }

  bool _checkTextFits(
      TextSpan text, double scale, int? maxLines, BoxConstraints constraints) {
    double constraintWidth = constraints.maxWidth;
    double constraintHeight = constraints.maxHeight;
    if (widget.decoration.contentPadding != null) {
      constraintWidth -= widget.decoration.contentPadding!.horizontal;
      constraintHeight -= widget.decoration.contentPadding!.vertical;
    }

    if (!widget.wrapWords) {
      List<String?> words = text.toPlainText().split(RegExp('\\s+'));

      // Adds prefix and suffix text
      if (widget.decoration.prefixText != null) {
        words.add(widget.decoration.prefixText);
      }
      if (widget.decoration.suffixText != null) {
        words.add(widget.decoration.suffixText);
      }

      var wordWrapTp = TextPainter(
        text: TextSpan(
          style: text.style,
          text: words.join(''),
        ),
        textAlign: widget.textAlign,
        textDirection: widget.textDirection ?? TextDirection.ltr,
        textScaleFactor: scale,
        maxLines: words.length,
        locale: widget.locale,
        strutStyle: widget.strutStyle,
      );

      wordWrapTp.layout(maxWidth: constraintWidth);
      double _width = (widget.decoration.contentPadding != null)
          ? wordWrapTp.width + widget.decoration.contentPadding!.horizontal
          : wordWrapTp.width;
      _textSpanWidth = math.max(_width, widget.minWidth ?? 0);

      if (wordWrapTp.didExceedMaxLines ||
          wordWrapTp.width > constraints.maxWidth) {
        return false;
      }
    }

    String word = text.toPlainText();

    // if (word.isNotEmpty) {
    // replace all \n with 'space with \n' to prevent dropping last character to new line
    // var textContents = text.text ?? '';
    // word = textContents.replaceAll('\n', ' \n');
    // \n is 10, <space> is 32
    // if (textContents.codeUnitAt(textContents.length - 1) != 10 &&
    //     textContents.codeUnitAt(textContents.length - 1) != 32) {
    //   word += ' ';
    // }
    // }

    // Adds prefix and suffix text
    word += widget.decoration.prefixText ?? '';
    word += widget.decoration.suffixText ?? '';

    var tp = TextPainter(
      text: TextSpan(
        text: word,
        recognizer: text.recognizer,
        children: text.children,
        semanticsLabel: text.semanticsLabel,
        style: text.style,
      ),
      textAlign: widget.textAlign,
      textDirection: widget.textDirection ?? TextDirection.ltr,
      textScaleFactor: scale,
      maxLines: maxLines,
      locale: widget.locale,
      strutStyle: widget.strutStyle,
    );

    tp.layout(maxWidth: constraintWidth);
    double _width = (widget.decoration.contentPadding != null)
        ? tp.width + widget.decoration.contentPadding!.horizontal
        : tp.width;

    double _height = (widget.decoration.contentPadding != null)
        ? tp.height + widget.decoration.contentPadding!.vertical
        : tp.height;

    _textSpanWidth = math.max(_width, widget.minWidth ?? 0);

    if (maxLines == null) {
      if (_height >= constraintHeight) {
        return false;
      } else {
        return true;
      }
    } else {
      if (_width >= constraintWidth) {
        return false;
      } else {
        return true;
      }
    }
  }

  void _sanityCheck() {
    assert(widget.key == null || widget.key != widget.textFieldKey,
        'Key and textKey cannot be the same.');

    if (widget.presetFontSizes == null) {
      assert(widget.stepGranularity >= 0.1,
          'StepGranularity has to be greater than or equal to 0.1. It is not a good idea to resize the font with a higher accuracy.');
      assert(widget.minFontSize >= 0,
          'MinFontSize has to be greater than or equal to 0.');
      assert(widget.maxFontSize > 0, 'MaxFontSize has to be greater than 0.');
      assert(widget.minFontSize <= widget.maxFontSize,
          'MinFontSize has to be smaller or equal than maxFontSize.');
      assert(widget.minFontSize / widget.stepGranularity % 1 == 0,
          'MinFontSize has to be multiples of stepGranularity.');
      if (widget.maxFontSize != double.infinity) {
        assert(widget.maxFontSize / widget.stepGranularity % 1 == 0,
            'MaxFontSize has to be multiples of stepGranularity.');
      }
    } else {
      assert(widget.presetFontSizes!.isNotEmpty,
          'PresetFontSizes has to be nonempty.');
    }
  }
}
