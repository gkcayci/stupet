import 'package:flutter/material.dart';
import 'package:stupet/color/color_theme.dart';
import 'package:stupet/components/customAppBar.dart';
import 'package:stupet/screen/homePage.dart';

class Note {
  final String title;
  final String content;

  Note({required this.title, required this.content});
}

class NotesPage extends StatefulWidget {
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  List<Note> _notesList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        // title: "Notlarım",
        onBackButtonPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        },
      ),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/background.png"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.white30.withOpacity(0.25),
                BlendMode.darken,
              ),
            ),
          ),
          child: _buildNotesList()),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorTheme().yellow,
        onPressed: _addNewNote,
        child: Icon(
          Icons.add,
          size: 40,
          color: Colors.white,
        ),
      ),
    );
  }

  void _addNewNote() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController _titleController = TextEditingController();
        TextEditingController _contentController = TextEditingController();

        return AlertDialog(
          title: Text('Yeni Not Ekle'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Başlık'),
              ),
              TextField(
                controller: _contentController,
                decoration: InputDecoration(labelText: 'İçerik'),
                maxLines: 6,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'İptal',
                style: TextStyle(color: ColorTheme().darkGray),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'Ekle',
                style: TextStyle(color: ColorTheme().darkGray),
              ),
              onPressed: () {
                String title = _titleController.text;
                String content = _contentController.text;
                Note newNote = Note(title: title, content: content);
                setState(() {
                  _notesList.add(newNote);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildNotesList() {
    return ListView.builder(
      itemCount: _notesList.length,
      itemBuilder: (BuildContext context, int index) {
        Note note = _notesList[index];
        return ListTile(
          title: Text(note.title),
          subtitle: Text(note.content),
          trailing: IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onPressed: () {
              _showDeleteConfirmationDialog(index);
            },
          ),
          onTap: () {
            _showEditNoteDialog(index);
          },
        );
      },
    );
  }

  void _deleteNote(int index) {
    setState(() {
      _notesList.removeAt(index);
    });
  }

  void _showDeleteConfirmationDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Notu Sil'),
          content: Text('Bu notu silmek istediğinize emin misiniz?'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.close, color: Colors.red),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            IconButton(
              icon: Icon(Icons.check, color: Colors.green),
              onPressed: () {
                _deleteNote(index);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showEditNoteDialog(int index) {
    Note selectedNote = _notesList[index];
    TextEditingController _titleController =
        TextEditingController(text: selectedNote.title);
    TextEditingController _contentController =
        TextEditingController(text: selectedNote.content);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Notu Düzenle'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Başlık'),
              ),
              TextField(
                controller: _contentController,
                decoration: InputDecoration(labelText: 'İçerik'),
                maxLines: 6,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('İptal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Kaydet'),
              onPressed: () {
                String title = _titleController.text;
                String content = _contentController.text;
                setState(() {
                  _notesList[index] = Note(title: title, content: content);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
