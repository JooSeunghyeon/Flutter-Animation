import 'package:flutter/material.dart';

class TechStackIcons {
  static final Map<String, IconData> _techIcons = {
    'typescript': Icons.code,
    'javascript': Icons.javascript,
    'dart': Icons.dark_mode,
    'java': Icons.coffee,
    'react': Icons.web,
    'flutter': Icons.flutter_dash,
    'android': Icons.android,
    'html5': Icons.html,
    'css3': Icons.css,
    'express': Icons.developer_board,
    'nextdotjs': Icons.next_plan,
    'prisma': Icons.storage,
    'amazonaws': Icons.cloud,
    'firebase': Icons.local_fire_department,
    'nginx': Icons.security,
    'vercel': Icons.vertical_align_center,
    'testinglibrary': Icons.science,
    'jest': Icons.extension,
    'cypress': Icons.bug_report,
    'docker': Icons.dock,
    'jira': Icons.track_changes,
    'github': Icons.code_off,
    'gitlab': Icons.engineering,
    'visualstudiocode': Icons.code,
    'androidstudio': Icons.android,
    'sonarqube': Icons.analytics,
    'figma': Icons.design_services,
  };

  static IconData getIcon(String slug) {
    return _techIcons[slug] ?? Icons.code;
  }

  static List<IconData> getAllIcons() {
    return _techIcons.values.toList();
  }

  static List<IconData> getIconsFromSlugs(List<String> slugs) {
    return slugs.map((slug) => getIcon(slug)).toList();
  }
}