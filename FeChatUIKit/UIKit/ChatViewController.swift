//
//  ChatViewController.swift
//  FeChatUIKit
//
//  Created by Felipe Vieira on 08/05/23.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import SwiftUI

class MessagesObservable: ObservableObject {
    @Published var messages: [Message] = []
}
class ChatViewController: UIViewController {
    
    let db = Firestore.firestore()
    private var observable: MessagesObservable = MessagesObservable()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let messageSender = Auth.auth().currentUser?.email else { return }
        
        loadMessages()
        addSwiftUI(
            ChatView(
                messages: observable,
                onSendPressed: sendPressed,
                sender: messageSender
            )
        )
    }
    
    func loadMessages() {
        db.collection(K.FStore.collectionName).order(by: K.FStore.dateField).addSnapshotListener { querySnapshot, error in
            self.observable.messages = []
            if let error {
                print("Error \(error)")
            } else {
                if let snapshotDocs = querySnapshot?.documents {
                    snapshotDocs.forEach { doc in
                        let data = doc.data()
                        if let messageSender = data[K.FStore.senderField] as? String, let messageBody = data[K.FStore.bodyField] as? String {
                            
                            let newMessage = Message(sender: messageSender, body: messageBody)
                            self.observable.messages.append(newMessage)
                        }
                    }
                }
            }
        }
    }
    
    func sendPressed(messageBody: String) {
        if let messageSender = Auth.auth().currentUser?.email {
            db.collection(K.FStore.collectionName)
                .addDocument(
                    data: [
                        K.FStore.senderField: messageSender,
                        K.FStore.bodyField: messageBody,
                        K.FStore.dateField: Date().timeIntervalSince1970
                    ]
                ) { error in
                    if let error {
                        print("Logg \(error)")
                    } else {
                        print("Logg Saved!!")
                    }
                }
        }
    }
}
