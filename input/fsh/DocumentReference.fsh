Profile:   NPFSDocumentReference
Parent: DocumentReference
Id: IHE.NPFS.DocumentReference
Title:      "NPFS DocumentReference"
Description: "A profile on the DocumentReference resource for NPFS."
* id 0..1 MS
* masterIdentifier 0..1 
* identifier 0..* MS
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "use"
* identifier ^slicing.rules = #open
* status 1..1 
* type 1..1 
* category 1..1
* category from DocumentReferenceCategory (extensible)
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
* content.attachment.title 0..1
* content.attachment.creation 0..1 MS
* content.format 1..1 MS
* context.encounter 0..0
* context.event 0..*
* context.period 0..1 MS
* context.facilityType 0..1 MS
* context.practiceSetting 0..1 MS
* context.sourcePatientInfo 0..0
* context.related 0..0




