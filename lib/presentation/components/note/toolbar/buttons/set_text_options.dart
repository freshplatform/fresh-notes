import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class NoteToolbarTextOptionsButton extends StatelessWidget {
  const NoteToolbarTextOptionsButton({
    required QuillController controller,
    required this.onNavigate,
    required this.onNavigateBack,
    super.key,
  }) : _controller = controller;

  final QuillController _controller;
  final Function(Widget newWidget) onNavigate;
  final VoidCallback onNavigateBack;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        onNavigate(
          _TextOptionsWidget(
            controller: _controller,
            onNavigateBack: onNavigateBack,
          ),
        );
      },
      // tooltip: 'Text options', TODO: Translate
      icon: const Icon(Icons.text_fields),
    );
  }
}

class _TextOptionsWidget extends StatelessWidget {
  const _TextOptionsWidget({
    required QuillController controller,
    required this.onNavigateBack,
  }) : _controller = controller;

  final QuillController _controller;
  final VoidCallback onNavigateBack;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          IconButton(
            onPressed: onNavigateBack,
            icon: const Icon(Icons.close),
          ),
          _ToggleStyleButton(
            iconData: Icons.format_list_bulleted,
            toggledIconData: Icons.format_list_bulleted_outlined,
            controller: _controller,
            attribute: Attribute.ul,
          ),
          _ToggleStyleButton(
            iconData: Icons.format_list_numbered,
            toggledIconData: Icons.format_list_numbered_outlined,
            controller: _controller,
            attribute: Attribute.ol,
          ),
          const VerticalDivider(),
          _ToggleStyleButton(
            controller: _controller,
            attribute: Attribute.leftAlignment,
            iconData: Icons.format_align_left,
            toggledIconData: Icons.format_align_left_outlined,
          ),
          _ToggleStyleButton(
            controller: _controller,
            attribute: Attribute.centerAlignment,
            iconData: Icons.format_align_center,
            toggledIconData: Icons.format_align_center_outlined,
          ),
          _ToggleStyleButton(
            controller: _controller,
            attribute: Attribute.rightAlignment,
            iconData: Icons.format_align_right,
            toggledIconData: Icons.format_align_right_outlined,
          ),
          _ToggleStyleButton(
            controller: _controller,
            attribute: Attribute.justifyAlignment,
            iconData: Icons.format_align_justify,
            toggledIconData: Icons.format_align_justify_outlined,
          ),
          const VerticalDivider(),
          _ToggleStyleButton(
            attribute: Attribute.bold,
            iconData: Icons.format_bold,
            toggledIconData: Icons.format_bold_outlined,
            controller: _controller,
          ),
          _ToggleStyleButton(
            iconData: Icons.format_italic,
            toggledIconData: Icons.format_italic_outlined,
            controller: _controller,
            attribute: Attribute.italic,
          ),
          _ToggleStyleButton(
            iconData: Icons.format_underline,
            toggledIconData: Icons.format_underline_outlined,
            controller: _controller,
            attribute: Attribute.underline,
          ),
          _ToggleStyleButton(
            iconData: Icons.format_strikethrough,
            toggledIconData: Icons.format_strikethrough_outlined,
            controller: _controller,
            attribute: Attribute.strikeThrough,
          ),
          const VerticalDivider(),
          QuillToolbarIndentButton(
            controller: _controller,
            isIncrease: true,
            options: QuillToolbarIndentButtonOptions(
              childBuilder: (options, extraOptions) {
                return IconButton(
                  onPressed: extraOptions.onPressed,
                  icon: const Icon(Icons.format_indent_increase),
                );
              },
            ),
          ),
          QuillToolbarIndentButton(
            controller: _controller,
            isIncrease: false,
            options: QuillToolbarIndentButtonOptions(
              childBuilder: (options, extraOptions) {
                return IconButton(
                  onPressed: extraOptions.onPressed,
                  icon: const Icon(Icons.format_indent_decrease),
                );
              },
            ),
          ),
          const SizedBox(
            width: 80,
          ),
        ],
      ),
    );
  }
}

// class _TextOptionSection extends StatelessWidget {
//   const _TextOptionSection({
//     required this.buttons,
//     // ignore: unused_element
//     super.key,
//     // ignore: unused_element
//     this.boxConstraints = const BoxConstraints(
//       minHeight: 70,
//     ),
//   });

//   final List<Widget> buttons;
//   final BoxConstraints boxConstraints;

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Container(
//         constraints: boxConstraints,
//         child: Card(
//           // shape: const RoundedRectangleBorder(
//           //   borderRadius: BorderRadius.all(
//           //     Radius.circular(16),
//           //   ),
//           // ),
//           child: SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               children: buttons,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class _ToggleStyleButton extends StatelessWidget {
  const _ToggleStyleButton({
    required this.iconData,
    required this.toggledIconData,
    required QuillController controller,
    required this.attribute,
  }) : _controller = controller;

  final QuillController _controller;
  final Attribute attribute;
  final IconData iconData;
  final IconData toggledIconData;

  @override
  Widget build(BuildContext context) {
    return QuillToolbarToggleStyleButton(
      controller: _controller,
      attribute: attribute,
      options: QuillToolbarToggleStyleButtonOptions(
        iconData: iconData,
        childBuilder: (options, extraOptions) {
          void sharedOnPressed() {
            extraOptions.onPressed?.call();
          }

          if (extraOptions.isToggled) {
            return IconButton.filled(
              tooltip: options.tooltip,
              onPressed: sharedOnPressed,
              icon: Icon(
                iconData,
              ),
            );
          }

          return IconButton(
            tooltip: options.tooltip,
            onPressed: sharedOnPressed,
            icon: Icon(
              iconData,
            ),
          );
        },
      ),
    );
  }
}

// class _IndentTextButton extends StatelessWidget {
//   const _IndentTextButton({
//     required QuillController controller,
//     required this.isIncrease,
//     required this.onButtonPressed,
//     required this.tooltip,
//     // ignore: unused_element
//     super.key,
//   }) : _controller = controller;

//   final QuillController _controller;
//   final bool isIncrease;
//   final VoidCallback? onButtonPressed;

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       tooltip: tooltip,
//       onPressed: () {
//         _controller.indentSelection(isIncrease);
//         onButtonPressed?.call();
//       },
//       icon: Icon(
//         isIncrease
//             ? Icons.format_indent_increase
//             : Icons.format_indent_decrease,
//       ),
//     );
//   }
// }
