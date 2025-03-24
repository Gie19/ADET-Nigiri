import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs_lite.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  const TopBar({super.key});

  void _launchURL(BuildContext context, String url) async {
    final theme = Theme.of(context);
    try {
      await launchUrl(
        Uri.parse(url),
        options: LaunchOptions(
          barColor: theme.colorScheme.surface,
          onBarColor: theme.colorScheme.onSurface,
          barFixingEnabled: false,
        ),
      );
    } catch (e) {
      debugPrint("Could not launch URL: $e");
    }
  }

  Widget buildDrawer(BuildContext context) {
    Color darkBlue = const Color(0xFF123A6D);

    return Drawer(
      child: Container(
        color: const Color.fromARGB(255, 199, 206, 242),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 199, 206, 242),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Image.asset(
                      "assets/images/logo2.png",
                      height: 180.0,
                    ),
                  ),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: Color(0xFF2D2D2D),
                        size: 30,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.menu, color: Color(0xFF2D2D2D)),
              title: const Text("Menu"),
              onTap: () {
                Navigator.pushNamed(context, "/menu");
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.shopping_cart,
                color: Color(0xFF2D2D2D),
              ),
              title: const Text("Orders"),
              onTap: () {
                Navigator.pushNamed(context, "/cart");
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite, color: Color(0xFF2D2D2D)),
              title: const Text("Favorites"),
              onTap: () {
                Navigator.pushNamed(context, "/favorites");
              },
            ),
            const Divider(color: Colors.white),
            ListTile(
              leading: const Icon(Icons.phone, color: Color(0xFF2D2D2D)),
              title: const Text("Contact Us"),
              subtitle: GestureDetector(
                onTap: () {
                  _launchURL(context, "tel:+639175225156");
                },
                child: const Text("(+63) 917 522 5156"),
              ),
            ),
            const Divider(color: Colors.white),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      _launchURL(context, "https://facebook.com/NigiriStation");
                    },
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(darkBlue, BlendMode.srcIn),
                      child: Image.asset(
                        "assets/images/facebook.png",
                        height: 30.0,
                        width: 40.0,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  GestureDetector(
                    onTap: () {
                      _launchURL(
                        context,
                        "https://instagram.com/nigiristation",
                      );
                    },
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(darkBlue, BlendMode.srcIn),
                      child: Image.asset(
                        "assets/images/instagram.png",
                        height: 30.0,
                        width: 40.0,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  GestureDetector(
                    onTap: () {
                      _launchURL(context, "https://tiktok.com/@nigiristation");
                    },
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(darkBlue, BlendMode.srcIn),
                      child: Image.asset(
                        "assets/images/tiktok.png",
                        height: 30.0,
                        width: 40.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFFBFFF1),
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset("assets/images/logo2.png", height: 75.0),
      ),
      centerTitle: true,
      leading: Builder(
        builder:
            (context) => IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
