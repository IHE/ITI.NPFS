Profile:        AuditSearchFileConsumer
Parent:         IHE.BasicAudit.Query
Id:             IHE.NPFS.SearchFile.Audit.Consumer
Title:          "Audit Event for Search File Transaction by the File Consumer"
Description:    """
Defines constraints on the AuditEvent Resource to record when a Search File Transaction happens, as recorded by the File Consumer.
- Build off of the IHE BasicAudit Query event
- add the ITI-88 as a subtype
- client is File Consumer
- server is File Manager
- entity slices for query
- entity slice for transaction is available
"""
* modifierExtension 0..0
* subtype 2..
* subtype contains iti88 1..1
* subtype[iti88] = urn:ihe:event-type-code#ITI-88 "Search File"
* agent[client] obeys val-audit-source
* agent[client] ^short = "File Consumer"
* agent[server] ^short = "File Manager"
* entity[query] ^short = "Search Parameters"





Profile:        AuditSearchFileManager
Parent:         IHE.BasicAudit.Query
Id:             IHE.NPFS.SearchFile.Audit.Manager
Title:          "Audit Event for Search File Transaction at File Manager"
Description:    """
Defines constraints on the AuditEvent Resource to record when a Search File Transaction happens, as recorded by the File Manager.
- Build off of the IHE BasicAudit Query event
- add the ITI-88 as a subtype
- client is File Consumer
- server is File Manager
- entity slices for query
- entity slice for transaction is available
"""
* modifierExtension 0..0
* subtype 2..
* subtype contains iti88 1..1
* subtype[iti88] = urn:ihe:event-type-code#ITI-88 "Search File"
* agent[server] obeys val-audit-source
* agent[client] ^short = "File Consumer"
* agent[server] ^short = "File Manager"
* entity[query] ^short = "Search Parameters"





Profile:        AuditUpdateDocumentReferenceSource
Parent:         IHE.BasicAudit.Update
Id:             IHE.NPFS.UpdateDocumentReference.Audit.Source
Title:          "Audit Event for Update DocumentReference Transaction at File Source"
Description:    """
Defines constraints on the File Source AuditEvent Resource to record when an Update DocumentReference Transaction happens, as recorded by the File Source.
- Build off of the IHE BasicAudit Update event
- add the ITI-89 as a subtype
- client is File Source
- server is File Manager
- entity slices for the DocumentReference reference
- entity slice for transaction is available
"""
* modifierExtension 0..0
* subtype 2..
* subtype contains iti89 1..1
* subtype[iti89] = urn:ihe:event-type-code#ITI-89 "Update DocumentReference"
* entity[data].role = http://terminology.hl7.org/CodeSystem/object-role#3 "Report"
* agent[client] obeys val-audit-source
* agent[client] ^short = "File Source"
* agent[server] ^short = "File Manager"
* entity[data] ^short = "the DocumentReference reference"






Profile:        AuditUpdateDocumentReferenceManager
Parent:         IHE.BasicAudit.Update
Id:             IHE.NPFS.UpdateDocumentReference.Audit.Manager
Title:          "Audit Event for Update DocumentReference Transaction at the File Manager"
Description:    """
Defines constraints on the File Manager AuditEvent Resource to record when a Update DocumentReference Transaction happens, as recorded by the File Manager.
- Build off of the IHE BasicAudit PatientRead event
- add the ITI-89 as a subtype
- client is File Source
- server is File Manager
- entity slices for DocumentReference reference
- entity slice for transaction is available
"""
* modifierExtension 0..0
* subtype 2..
* subtype contains iti89 1..1
* subtype[iti89] = urn:ihe:event-type-code#ITI-89 "Update DocumentReference"
* entity[data].role = http://terminology.hl7.org/CodeSystem/object-role#3 "Report"
* agent[server] obeys val-audit-source
* agent[client] ^short = "File Source"
* agent[server] ^short = "File Manager"
* entity[data] ^short = "the DocumentReference reference"





Profile:        AuditRetrieveFileConsumer
Parent:         IHE.BasicAudit.Read
Id:             IHE.NPFS.RetrieveFile.Audit.Consumer
Title:          "Audit Event for Retrieve File Transaction at File Consumer"
Description:    """
Defines constraints on the File Consumer AuditEvent Resource to record when a Retrieve File Transaction happens, as recorded by the File Consumer.
- Build off of the IHE BasicAudit Read event
- add the ITI-109 as a subtype
- client is File Consumer
- server is File Manager
- entity slices for data
- entity slice for transaction is available
"""
* modifierExtension 0..0
* subtype 2..
* subtype contains iti109 1..1
* subtype[iti109] = urn:ihe:event-type-code#ITI-109 "Retrieve File"
* entity[data].role = http://terminology.hl7.org/CodeSystem/object-role#3 "Report"
* agent[client] obeys val-audit-source
* agent[client] ^short = "File Consumer"
* agent[server] ^short = "File Manager"
* entity[data] ^short = "the data"






Profile:        AuditRetrieveFileManager
Parent:         IHE.BasicAudit.Read
Id:             IHE.NPFS.RetrieveFile.Audit.Manager
Title:          "Audit Event for Retrieve File Transaction at the File Manager"
Description:    """
Defines constraints on the File Manager AuditEvent Resource to record when a Retrieve File Transaction happens, as recorded by the File Manager.
- Build off of the IHE BasicAudit Read event
- add the ITI-109 as a subtype
- client is File Consumer
- server is File Manager
- entity slices for data
- entity slice for transaction is available
"""
* modifierExtension 0..0
* subtype 2..
* subtype contains iti109 1..1
* subtype[iti109] = urn:ihe:event-type-code#ITI-109 "Retrieve File"
* entity[data].role = http://terminology.hl7.org/CodeSystem/object-role#3 "Report"
* agent[server] obeys val-audit-source
* agent[client] ^short = "File Consumer"
* agent[server] ^short = "File Manager"
* entity[data] ^short = "the data"






Profile:        AuditSubmitFileManager
Parent:         AuditEvent
Id:             IHE.NPFS.SubmitFile.Audit.Manager
Title:          "Audit Event for Submit File Transaction at Manager"
Description:    "Defines constraints on the AuditEvent Resource to record when a Submit File Transaction happens at the Manager.
- Import event
- shall have source of itself
- shall have a File Source agent
- shall have a File Manager agent
- may have user, app, organization agent(s)
- shall have a DocumentReference identity entity"
* modifierExtension 0..0
* type = DCM#110107 "Import"
* action = #C
* subtype ^slicing.discriminator.type = #value
* subtype ^slicing.discriminator.path = "$this"
* subtype ^slicing.rules = #open // allow other codes
* subtype 1..
* subtype contains iti87 1..1
* subtype[iti87] = urn:ihe:event-type-code#ITI-87 "Submit File"
// * severity in R5
* recorded 1..1 // already required
* outcome 1..1
* outcomeDesc MS // encouraged
// source is already required, see invariant val-audit-source use
* agent 2..*
* agent ^slicing.discriminator.type = #pattern
* agent ^slicing.discriminator.path = "type"
* agent ^slicing.rules = #open
* agent ^slicing.description = "Source, Manager, and possibly the user who participated"
* agent contains 
	fileSource 1..1 and
	fileManager 1..1 
	// may be many including app identity, user identity, etc
* agent[fileSource].type = DCM#110153 "Source Role ID"
* agent[fileSource].who 1..1
* agent[fileSource].network 1..1
* agent[fileManager].type = DCM#110152 "Destination Role ID"
* agent[fileManager].who 1..1
* agent[fileManager] obeys val-audit-source
* agent[fileManager].network 1..1
* agent[fileSource] ^short = "File Source"
* agent[fileManager] ^short = "File Manager"
* entity 1..1
* entity ^slicing.discriminator.type = #pattern
* entity ^slicing.discriminator.path = "type"
* entity ^slicing.rules = #closed
* entity ^slicing.description = "DocumentReference involved"
* entity contains
	docRef 1..1
* entity[docRef].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[docRef].role = http://terminology.hl7.org/CodeSystem/object-role#20 "Job"
* entity[docRef].what 1..1
* entity[docRef].what only Reference(DocumentReference) 
* entity[docRef] ^short = "docRef"

Invariant: val-audit-source
Description: "The Audit Source is this agent too."
Expression: "$this.who = %resource.source.observer"
Severity: #error

Profile:        AuditSubmitFileSource
Parent:         AuditEvent
Id:             IHE.NPFS.SubmitFile.Audit.Source
Title:          "Audit Event for Submit File Transaction at Source"
Description:    "Defines constraints on the AuditEvent Resource to record when a Submit File Transaction happens at the Source.
- Export event
- shall have source of itself
- shall have a File Source agent
- shall have a File Manager agent
- may have user, app, organization agent(s)
- shall have a patient entity
- shall have a submission set identity entity"
* modifierExtension 0..0
* type = DCM#110106 "Export"
* action = #R
* subtype ^slicing.discriminator.type = #value
* subtype ^slicing.discriminator.path = "$this"
* subtype ^slicing.rules = #open // allow other codes
* subtype 1..
* subtype contains iti87 1..1
* subtype[iti87] = urn:ihe:event-type-code#ITI-87 "Submit File"
// * severity in R5
* recorded 1..1 // already required
* outcome 1..1
* outcomeDesc MS // encouraged
// source is already required, see invariant val-audit-source use
* agent 2..*
* agent ^slicing.discriminator.type = #pattern
* agent ^slicing.discriminator.path = "type"
* agent ^slicing.rules = #open
* agent ^slicing.description = "Source, Manager, and possibly the user who participated"
* agent contains 
	fileSource 1..1 and
	fileManager 1..1 
	// may be many including app identity, user identity, etc
* agent[fileSource].type = DCM#110153 "Source Role ID"
* agent[fileSource].who 1..1
* agent[fileSource] obeys val-audit-source
* agent[fileSource].network 1..1
* agent[fileManager].type = DCM#110152 "Destination Role ID"
* agent[fileManager].who 1..1
* agent[fileManager].network 1..1
* agent[fileSource] ^short = "File Source"
* agent[fileManager] ^short = "File Manager"
* entity 1..1
* entity ^slicing.discriminator.type = #pattern
* entity ^slicing.discriminator.path = "type"
* entity ^slicing.rules = #closed
* entity ^slicing.description = "documentReference involved"
* entity contains
	docRef 1..1
* entity[docRef].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[docRef].role = http://terminology.hl7.org/CodeSystem/object-role#20 "Job"
* entity[docRef].what 1..1
* entity[docRef].what only Reference(DocumentReference) 
* entity[docRef] ^short = "documentReference"

