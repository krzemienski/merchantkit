internal struct ConstructedReceipt : Receipt {
    var productIdentifiers: Set<String> {
        return self.entries.keys
    }
    
    private let entries: Buckets<String, ReceiptEntry>
    
    init(from allEntries: [ReceiptEntry]) {
        var entriesForProductIdentifier = Buckets<String, ReceiptEntry>()
        
        for entry in allEntries {
            entriesForProductIdentifier[entry.productIdentifier].append(entry)
        }
        
        self.entries = entriesForProductIdentifier
    }
    
    func entries(forProductIdentifier productIdentifier: String) -> [ReceiptEntry] {
        return self.entries[productIdentifier]
    }
}
