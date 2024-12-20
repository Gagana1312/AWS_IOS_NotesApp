//
//  NotesView.swift
//  Getting Started
//
//  Created by Gagana Ananda on 11/27/24.
//
//
//import SwiftUI
//
//
//struct NotesView: View {
//    @EnvironmentObject private var authenticationService: AuthenticationService
//    @EnvironmentObject private var notesService: NotesService
//    @EnvironmentObject private var storageService: StorageService
//    @State private var isSavingNote = false
//
//    var body: some View {
//        NavigationStack{
//            List {
//                if notesService.notes.isEmpty {
//                    Text("No notes")
//                }
//                ForEach(notesService.notes, id: \.id) { note in
//                    NoteView(note: note)
//                }
//                .onDelete { indices in
//                    for index in indices {
//                        let note = notesService.notes[index]
//                        Task {
//                            await notesService.delete(note)
//                            if let image = note.image {
//                                await storageService.remove(withName: image)
//                            }
//                        }
//                    }
//                }
//            }
//            .navigationTitle("Notes")
//            .toolbar {
//                Button("Sign Out") {
//                    Task {
//                        await authenticationService.signOut()
//                    }
//                }
//            }
//            .toolbar {
//                ToolbarItem(placement: .bottomBar) {
//                    Button("⨁ New Note") {
//                        isSavingNote = true
//                    }
//                    .bold()
//                }
//            }
//            .sheet(isPresented: $isSavingNote) {
//                SaveNoteView()
//            }
//        }
//        .task {
//            await notesService.fetchNotes()
//        }
//    }
//}


import SwiftUI

struct NotesView: View {
    @EnvironmentObject private var authenticationService: AuthenticationService
    @EnvironmentObject private var notesService: NotesService
    @EnvironmentObject private var storageService: StorageService
    @State private var isSavingNote = false

    var body: some View {
        NavigationStack {
            List {
                if notesService.notes.isEmpty {
                    Text("No notes")
                }
                ForEach(notesService.notes, id: \.id) { note in
                    NoteView(note: note)
                }
                .onDelete { indices in
                    for index in indices {
                        let note = notesService.notes[index]
                        Task {
                            await notesService.delete(note)
                            if let image = note.image {
                                await storageService.remove(withName: image)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Notes")
            .toolbar {
                Button("Sign Out") {
                    Task {
                        await authenticationService.signOut()
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button("⨁ New Note") {
                        isSavingNote = true
                    }
                    .bold()
                }
            }
            .sheet(isPresented: $isSavingNote, onDismiss: {
                Task {
                    await notesService.fetchNotes() // Fetch updated notes
                }
            }) {
                SaveNoteView()
            }
        }
        .task {
            await notesService.fetchNotes() // Initial notes fetch
        }
    }
}
