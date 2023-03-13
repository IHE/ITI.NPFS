Profile:   NPFSDocumentReference
Parent: DocumentReference
Id: NPFSDocumentReference
Title:      "DocumentReference"
Description: "A profile on the DocumentReference resource for NPFS."
* id 0..1 MS
* masterIdentifier 0..1 
* status 1..1
* type 1..1 
* category 1..1 
* subject 0..0
* date 1..1 
* author 1..* 
* authenticator 0..1
* relatesTo 0..* MS
* description 0..1
* securityLabel 0..* MS
* content.attachment.contentType 1..1
* content.attachment.language 0..1 MS
* content.attachment.language ^short = "Required if known"
* content.attachment.data 0..0
* content.attachment.url 1..1
* content.attachment.size 1..1
* content.attachment.hash 1..1
* content.format 1..1
* content.format from http://ihe.net/fhir/ihe.formatcode.fhir/ValueSet/formatcode (preferred)
* context.encounter 0..0
* context.sourcePatientInfo 0..0
* context.related 0..0
