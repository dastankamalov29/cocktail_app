import 'package:cocktail_app/api/cocktail_api.dart';
import 'package:flutter/material.dart';
import '../model/cocktail.dart';
import 'widgets/cocktail_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Cocktail> cocktails = [];
  bool isLoading = false;
  final TextEditingController controller = TextEditingController(text: 'mojito');

  Future<void> search(String query) async {
    setState(() => isLoading = true);
    try {
      final result = await CocktailService.fetchCocktails(query);
      setState(() {
        cocktails = result;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  void initState() {
    super.initState();
    search(controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: TextField(
                controller: controller,
                onSubmitted: search,
                decoration: InputDecoration(
                  hintText: 'Введите название коктейля',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.green, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.green, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            Expanded(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : cocktails.isEmpty
                      ? const Center(child: Text('Ничего не найдено'))
                      : GridView.builder(
                          padding: const EdgeInsets.all(10),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                            childAspectRatio: 0.7,
                          ),
                          itemCount: cocktails.length,
                          itemBuilder: (context, index) {
                            return CocktailCard(cocktail: cocktails[index]);
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
