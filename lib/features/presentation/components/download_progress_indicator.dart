import 'package:flutter/material.dart';

class DownloadProgressDialog extends StatefulWidget {
  final int total;
  
  const DownloadProgressDialog({super.key, required this.total});

  @override
  DownloadProgressDialogState createState() => DownloadProgressDialogState();
}

class DownloadProgressDialogState extends State<DownloadProgressDialog> {
  int _completed = 0;
  
  void updateProgress(int completed) {
    setState(() {
      _completed = completed;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final double progress = widget.total > 0 ? _completed / widget.total : 0;
    
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          const CircularProgressIndicator(),
          const SizedBox(height: 24),
          Text(
            'Downloading Images',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          LinearProgressIndicator(value: progress),
          const SizedBox(height: 8),
          Text(
            '$_completed/${widget.total} images',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Text(
            '${(progress * 100).toStringAsFixed(0)}%',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}