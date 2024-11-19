import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TaskManagerHome(),
    );
  }
}

class TaskManagerHome extends StatefulWidget {
  const TaskManagerHome({super.key});

  @override
  _TaskManagerHomeState createState() => _TaskManagerHomeState();
}

class _TaskManagerHomeState extends State<TaskManagerHome> {
  final List<Map<String, dynamic>> tasks =
      []; // Daftar untuk menyimpan tugas dengan deadline
  final TextEditingController taskController =
      TextEditingController(); // Controller untuk input
  DateTime? selectedDate; // Menyimpan tanggal yang dipilih
  Timer? timer; // Timer untuk mengecek deadline

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel(); // Membatalkan timer saat widget dihapus
    super.dispose();
  }

  // void startDeadlineCheck() {
  //   timer = Timer.periodic(const Duration(minutes: 1), (Timer t) {
  //     checkDeadlines(); // Memeriksa deadline setiap menit
  //   });
  // }

  // void checkDeadlines() {
  //   final now = DateTime.now();
  //   for (var task in tasks) {
  //     if (task['deadline'] != null && task['deadline'].isBefore(now)) {
  //       showDeadlineAlert(
  //           task['title']); // Menampilkan alert jika deadline terlewati
  //       // Menghapus tugas dari daftar setelah memberi notifikasi
  //       removeTask(task);
  //     }
  //   }
  // }

  // void showDeadlineAlert(String taskTitle) {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: const Text('Deadline Terlewati'),
  //         content: Text('Tugas "$taskTitle" sudah melewati deadline!'),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop(); // Tutup dialog
  //             },
  //             child: const Text('OK'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  void removeTask(Map<String, dynamic> task) {
    setState(() {
      tasks.remove(task); // Menghapus tugas dari daftar
    });
  }

  void addTask() {
    if (taskController.text.isNotEmpty && selectedDate != null) {
      setState(() {
        tasks.add({
          'title': taskController.text,
          'deadline': DateTime(selectedDate!.year, selectedDate!.month,
              selectedDate!.day), // Menyimpan hanya tanggal tanpa waktu
        });
        taskController.clear(); // Kosongkan input setelah menambahkan
        selectedDate = null; // Reset tanggal setelah menambahkan
      });
      ScaffoldMessenger.of(context).showSnackBar(
        // Menampilkan Snackbar
        SnackBar(content: Text('Tugas "${taskController.text}" ditambahkan!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        // Notifikasi jika input tidak lengkap
        const SnackBar(
            content: Text('Mohon masukkan tugas dan pilih tanggal!')),
      );
    }
  }

  void deleteTask(int index) {
    // Menampilkan dialog konfirmasi sebelum menghapus tugas
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Konfirmasi'),
          content: const Text('Apakah Anda yakin ingin menghapus tugas ini?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  tasks.removeAt(index); // Hapus tugas berdasarkan index
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  // Menampilkan Snackbar
                  SnackBar(content: Text('Tugas dihapus!')),
                );
                Navigator.of(context).pop(); // Tutup dialog setelah menghapus
              },
              child: const Text('Hapus'),
            ),
          ],
        );
      },
    );
  }

  Future<void> pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked; // Menyimpan tanggal yang dipilih
      });
      ScaffoldMessenger.of(context).showSnackBar(
        // Menampilkan snackbar jika tanggal dipilih
        SnackBar(content: Text('Tanggal dipilih: ${picked.toLocal()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Manager'),
        actions: [
          IconButton(
            icon: const Icon(Icons.date_range),
            onPressed: () => pickDate(context), // Memanggil DatePicker
          ),
        ],
      ),
      body: Column(
        children: [
          // Tempat untuk input tugas baru
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: taskController,
              decoration: const InputDecoration(
                labelText: 'Add a new task',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (_) =>
                  addTask(), // Menambahkan tugas saat menekan enter
            ),
          ),
          // Daftar Tugas
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length, // Menggunakan panjang daftar tugas
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(tasks[index]['title']),
                  subtitle: Text(
                      'Deadline: ${tasks[index]['deadline']?.toLocal().toString().split(' ')[0]}'), // Menampilkan hanya tanggal
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () =>
                        deleteTask(index), // Tampilkan dialog konfirmasi
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
