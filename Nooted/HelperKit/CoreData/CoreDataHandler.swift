//
//  CoreDataHandler.swift
//  Nooted
//
//  Created by Nikunj Mewada on 01/04/24.
//

import Foundation
import CoreData
import Combine

class CoreDataHandler: ObservableObject {
    private let container = NSPersistentContainer(name: "Nooted")
    private var notesItem = [NotesItem]()
    let publisher = PassthroughSubject<Bool, Never>()

    static let shared = CoreDataHandler()

    init() {
        container.loadPersistentStores { description, err in
            if err != nil {
                debugPrint("Cannot Load Container")
            }
        }
        fetchNotes()
    }

    private func fetchNotes() {
        let request = NSFetchRequest<NotesItem>(entityName: "NotesItem")
        
        do {
            notesItem = try container.viewContext.fetch(request)
            debugPrint("Fetched notes", notesItem)

        } catch {
            debugPrint("Cannot Fetch Items \(error)")
        }
    }
    
    func getNotesItem() -> [NotesItem] {
        notesItem.reversed()
    }

    func addNote(title: String, note: String) {
        let newNoteItem = NotesItem(context: container.viewContext)
        newNoteItem.title = title
        newNoteItem.note = note
        saveNote()
    }

    func deleteNote(index: Int) {
        let entity = notesItem[notesItem.count - index - 1]

        container.viewContext.delete(entity)
        saveNote()
    }

    private func saveNote() {
        do {
            try container.viewContext.save()
            fetchNotes()
        } catch {
            debugPrint("Error in saving note")
        }
    }
}
