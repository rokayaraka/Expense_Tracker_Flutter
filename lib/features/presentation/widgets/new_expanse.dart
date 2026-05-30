import 'package:expanse_tracker_app/features/domain/expanse_entity.dart';
import 'package:flutter/material.dart';

class NewExpanse extends StatefulWidget {
  const NewExpanse({super.key, required this.addExpanse, this.expanses});

  final ExpanseEntity? expanses;
  final Future<void> Function(ExpanseEntity expanse) addExpanse;

  @override
  State<NewExpanse> createState() => _NewExpanseState();
}

class _NewExpanseState extends State<NewExpanse> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  DateTime? _selectedDate = DateTime.now();

  Category? _selectedCategory = Category.food;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    if(widget.expanses!=null){
      _titleController.text=widget.expanses!.title;
      _amountController.text=widget.expanses!.amount.toString();
      _selectedCategory=widget.expanses!.category;
      _selectedDate=widget.expanses!.date;

    }
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return AnimatedPadding(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      padding: EdgeInsets.only(bottom: bottomInset),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _titleController,
                maxLength: 50,
                decoration: InputDecoration(
                  labelText: "Title",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                      maxLength: 50,
                      decoration: InputDecoration(
                        labelText: "Amount",
                        prefixText: "\$",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Flexible(
                          child: Text(
                            _selectedDate == null
                                ? "No Date"
                                : "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}",
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        IconButton(
                          onPressed: presentDataPicker,
                          icon: Icon(Icons.calendar_month),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  DropdownButton<Category>(
                    value: _selectedCategory,
                    items: Category.values
                        .map(
                          (category) => DropdownMenuItem(
                            value: category,
                            child: Text(category.name.toUpperCase()),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value == null) return;
                      setState(() {
                        _selectedCategory = value;
                      });
                    },
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: submitExpanse,
                    child: Text("Save"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  void presentDataPicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    final pickDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,

      lastDate: now,
    );
    if (pickDate == null) {
      return;
    }

    setState(() {
      _selectedDate = pickDate;
    });
  }

  Future<void> submitExpanse() async {
    final enteredAmount = double.tryParse(_amountController.text);

    final amountIsValid = enteredAmount == null || enteredAmount <= 0;

    if (_titleController.text.trim().isEmpty || amountIsValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter a title and a valid amount.')),
      );
      return;
    }

    await widget.addExpanse(
      ExpanseEntity(
        title: _titleController.text,
        amount: enteredAmount,
        date: _selectedDate!,
        category: _selectedCategory!,
      ),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }
}
