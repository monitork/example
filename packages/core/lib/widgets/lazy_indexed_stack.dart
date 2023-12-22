part of '_widgets.dart';

/// An extended IndexedStack that builds the required widget only when it is needed, and returns the pre-built widget when it is needed again.
class LazyIndexedStack extends StatefulWidget {
  /// Creates LazyIndexedStack that wraps IndexedStack.
  LazyIndexedStack({
    required this.index,
    required this.children,
    super.key,
    Widget? unloadWidget,
    this.alignment = AlignmentDirectional.topStart,
    this.sizing = StackFit.loose,
    this.textDirection,
  }) {
    this.unloadWidget = unloadWidget ?? Container();
  }

  /// Widget to be built when not loaded. Default widget is [Container].
  late final Widget unloadWidget;

  /// Same as alignment attribute of original IndexedStack.
  final AlignmentGeometry alignment;

  /// Same as sizing attribute of original IndexedStack.
  final StackFit sizing;

  /// Same as textDirection attribute of original IndexedStack.
  final TextDirection? textDirection;

  /// The index of the child to show.
  final int index;

  /// The widgets below this widget in the tree.
  ///
  /// A child widget will not be built until the index associated with it is specified.
  /// When the index associated with the widget is specified again, the built widget is returned.
  final List<Widget> children;

  @override
  LazyIndexedStackState createState() => LazyIndexedStackState();
}

///
class LazyIndexedStackState extends State<LazyIndexedStack> {
  late List<Widget> _children;
  final _stackKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    _children = _initialChildren();
  }

  @override
  void didUpdateWidget(LazyIndexedStack oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.children.length != oldWidget.children.length) {
      _children = _initialChildren();
    }

    _children[widget.index] = widget.children[widget.index];
  }

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      key: _stackKey,
      index: widget.index,
      alignment: widget.alignment,
      textDirection: widget.textDirection,
      sizing: widget.sizing,
      children: _children,
    );
  }

  List<Widget> _initialChildren() {
    return widget.children.asMap().entries.map((entry) {
      final index = entry.key;
      final childWidget = entry.value;
      return index == widget.index ? childWidget : widget.unloadWidget;
    }).toList();
  }
}