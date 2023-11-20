import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class SideRail extends StatefulWidget {
  const SideRail({
    super.key,
    required this.isExpanded,
    required this.navItems,
    required this.selectedIndex,
    this.backgroundColor,
    this.selectedColor,
    this.unselectedColor,
    this.selectedTextStyle,
    this.logo,
    this.header,
    this.footer,
    this.margin,
    this.logoAlignment = Alignment.center,
    this.onTap,
    this.collapsedWidth = 100,
    this.expandedWidth = 220,
    this.footerPadding = 10,
    this.headerPadding = 10,
    this.logoPadding = 10,
    this.tileActiveColor,
  })  : assert(collapsedWidth >= 100),
        assert(expandedWidth >= 220);
  final Function(int)? onTap;
  final bool isExpanded;
  final int selectedIndex;
  final List<NavDestinationItem> navItems;
  final Color? backgroundColor, selectedColor, unselectedColor, tileActiveColor;
  final TextStyle? selectedTextStyle;
  final Widget? logo;
  final Widget? header;
  final Widget? footer;
  final EdgeInsets? margin;
  final Alignment? logoAlignment;

  final double collapsedWidth,
      expandedWidth,
      footerPadding,
      logoPadding,
      headerPadding;

  @override
  State<SideRail> createState() => _SideRailState();
}

class _SideRailState extends State<SideRail> {
  final controller = AutoScrollController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Material(
        surfaceTintColor:
            widget.backgroundColor ?? theme.scaffoldBackgroundColor,
        color: widget.backgroundColor ?? theme.scaffoldBackgroundColor,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          width:
              widget.isExpanded ? widget.expandedWidth : widget.collapsedWidth,
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: widget.logoAlignment,
                padding: EdgeInsets.all(widget.logoPadding),
                child: widget.logo ?? const SizedBox.shrink(),
              ),
              Divider(
                color: Colors.grey.withOpacity(.2),
              ),
              Visibility(
                visible: widget.header != null,
                child: Padding(
                  padding: EdgeInsets.all(widget.headerPadding),
                  child: Column(
                    children: [
                      widget.header ?? const SizedBox.shrink(),
                      SizedBox(height: widget.headerPadding),
                      Divider(
                        color: Colors.grey.withOpacity(.2),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: ListView.builder(
                controller: controller,
                itemCount: widget.navItems.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final item = widget.navItems[index];
                  return AutoScrollTag(
                    key: ValueKey(index),
                    controller: controller,
                    index: index,
                    child: _DestinationItem(
                      onTap: widget.onTap,
                      item: item,
                      items: widget.navItems,
                      controller: controller,
                      margin: widget.margin,
                      tileActiveColor: widget.tileActiveColor,
                      activeColor: widget.selectedColor,
                      selectedTextStyle: widget.selectedTextStyle,
                      unSelectedColor: widget.unselectedColor,
                      selectedIndex: widget.selectedIndex,
                      expanded: widget.isExpanded,
                    ),
                  );
                },
                padding: const EdgeInsets.symmetric(vertical: 15),
              )),
              Visibility(
                visible: widget.footer != null,
                child: Column(
                  children: [
                    Divider(
                      color: Colors.grey.withOpacity(.2),
                    ),
                    Padding(
                        padding: EdgeInsets.all(
                            widget.footer == null ? 0 : widget.footerPadding),
                        child: widget.footer ?? const SizedBox.shrink()),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class NavDestinationItem {
  final Widget icon, title;

  final Widget? trailing, activeIcon;

  final bool? expandable;
  final double? iconSize, textSize, radius;
  final EdgeInsets? margin;
  final bool isSectionHeader;

  final List<NavDestinationItem>? expansionList;
  final Color? selectedColor, unselectedColor;

  const NavDestinationItem({
    Key? key,
    required this.icon,
    required this.title,
    this.activeIcon,
    this.selectedColor,
    this.unselectedColor,
    this.trailing,
    this.expandable,
    this.expansionList,
    this.iconSize,
    this.textSize,
    this.radius,
    this.margin,
    required this.isSectionHeader,
  });
}

class _DestinationItem extends StatelessWidget {
  const _DestinationItem({
    required this.item,
    required this.items,
    required this.selectedIndex,
    required this.expanded,
    this.margin,
    this.activeColor,
    this.unSelectedColor,
    this.selectedTextStyle,
    this.onTap,
    this.tileActiveColor,
    required this.controller,
  });

  final NavDestinationItem item;
  final List<NavDestinationItem> items;
  final int selectedIndex;
  final bool expanded;
  final AutoScrollController controller;
  final EdgeInsets? margin;
  final Color? activeColor, unSelectedColor, tileActiveColor;
  final TextStyle? selectedTextStyle;
  final Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final selectedColor = item.selectedColor ?? activeColor ?? Colors.white;

    final unselectedColor =
        item.unselectedColor ?? unSelectedColor ?? Colors.grey;

    final index = items
        .where((element) => !element.isSectionHeader)
        .toList()
        .indexOf(item);
    return item.isSectionHeader
        ? Visibility(
            visible: expanded,
            replacement: Divider(
              color: Colors.grey.withOpacity(.3),
            ),
            child: Row(
              children: [
                Flexible(
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 20, right: 20, top: 20, bottom: 10),
                    child: DefaultTextStyle(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: item.textSize ?? 12, color: Colors.grey),
                      child: item.title,
                    ),
                  ),
                ),
              ],
            ),
          )
        : Container(
            margin: margin ?? item.margin,
            child: InkWell(
              hoverColor: tileActiveColor?.withOpacity(.1) ??
                  theme.primaryColor.withOpacity(.1),
              borderRadius: BorderRadius.circular(item.radius ?? 0),
              onTap: () async {
                onTap?.call(index);

                await controller.scrollToIndex(index,
                    duration: const Duration(seconds: 1),
                    preferPosition: AutoScrollPosition.middle);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(item.radius ?? 0),
                  color: index == selectedIndex
                      ? tileActiveColor ?? theme.primaryColor
                      : null,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 15),
                  child: Row(
                      mainAxisAlignment: expanded
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.center,
                      children: [
                        IconTheme(
                          data: IconThemeData(
                            color: index == selectedIndex
                                ? selectedColor
                                : unselectedColor,
                            size: item.iconSize ?? 18,
                          ),
                          child: index == selectedIndex
                              ? item.activeIcon ?? item.icon
                              : item.icon,
                        ),
                        Flexible(
                            child: AnimatedOpacity(
                          opacity: expanded ? 1 : 0,
                          duration: const Duration(microseconds: 50),
                          child: Visibility(
                            visible: expanded,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(width: 15),
                                Expanded(
                                  child: DefaultTextStyle(
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: index == selectedIndex
                                        ? selectedTextStyle ??
                                            Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                    fontSize:
                                                        item.textSize ?? 12,
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        index ==
                                                                selectedIndex
                                                            ? selectedColor
                                                            : unselectedColor)
                                        : Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                                fontSize: item.textSize ?? 12,
                                                color: index ==
                                                        selectedIndex
                                                    ? selectedColor
                                                    : unselectedColor),
                                    child: item.title,
                                  ),
                                ),
                                // SizedBox(width: 15),
                                IconTheme(
                                  data: IconThemeData(
                                    color: index == selectedIndex
                                        ? selectedColor
                                        : unselectedColor,
                                  ),
                                  child:
                                      item.trailing ?? const SizedBox.shrink(),
                                )
                              ],
                            ),
                          ),
                        ))
                      ]),
                ),
              ),
            ),
          );
  }
}
