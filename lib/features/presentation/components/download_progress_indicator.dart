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
    if (mounted && _completed != completed) {
      setState(() {
        _completed = completed;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final double progress = widget.total > 0 ? _completed / widget.total : 0;
    
    return PopScope(
      onPopInvokedWithResult: (didPop, _) async => false,
      child: AlertDialog(
        contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        content: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              SizedBox(
                width: 48, 
                height: 48,
                child: CircularProgressIndicator(
                  value: progress,
                  strokeWidth: 4,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Downloading Images',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              LinearProgressIndicator(value: progress),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$_completed/${widget.total} images',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    '${(progress * 100).toStringAsFixed(0)}%',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              if (_completed == widget.total)
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    'Complete! Closing...',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.green,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}