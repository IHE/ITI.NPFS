Profile:        NPFSCreateDocumentBundle
Parent:         Bundle
Id:             IHE.NPFS.CreateDocumentBundle
Title:          "NPFS Create Document Bundle"
Description:    "A profile on the Bundle transaction for ITI-87 Submit File used to submit a new file and related metadata
  - shall be a Transaction Bundle
  - all resources shall be compliant with constraints
  - may create one [DocumentReference](StructureDefinition-IHE.NPFS.DocumentReference.html)
    - with a document as a [Binary](http://hl7.org/fhir/R4/binary.html)"

* type = #transaction
* entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #closed
* entry ^slicing.description = "Slicing based on the profile conformance of the entry"
* entry and entry.resource MS

* entry contains 
    DocumenReference 1..1 and
    Documents 1..1
* entry[DocumenReference].resource only 
    IHE.NPFS.DocumentReference 
* entry[DocumenReference] ^short = "the DocumentReference resource"
* entry[DocumenReference] ^definition = "any new DocumentReference"
* entry[DocumenReference].resource 1..1
* entry[DocumenReference].request 1..1
* entry[DocumenReference].request.method = #POST

* entry[Documents].resource ^type.code = "Binary"
* entry[Documents].resource ^type.profile = Canonical(Binary)
* entry[Documents] ^short = "the Document"
* entry[Documents] ^definition = "the Document referenced by the DocumentReference resource"
* entry[Documents].resource 1..1
* entry[Documents].request 1..1
* entry[Documents].request.method = #POST


Profile:        NPFSUpdateDocumentBundle
Parent:         Bundle
Id:             IHE.NPFS.UpdateDocumentBundle
Title:          "NPFS Update Document Bundle"
Description:    "A profile on the Bundle transaction for ITI-87 Submit File used to update a file and related metadata
  - shall be a Transaction Bundle
  - all resources shall be compliant with constraints
  - may update one [DocumentReference](StructureDefinition-IHE.NPFS.DocumentReference.html)
    - with a document as a [Binary](http://hl7.org/fhir/R4/binary.html)"

* type = #transaction
* entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #closed
* entry ^slicing.description = "Slicing based on the profile conformance of the entry"
* entry and entry.resource MS

* entry contains 
    DocumenReference 1..1 and
    Documents 1..1
* entry[DocumenReference].resource only 
    IHE.NPFS.DocumentReference 
* entry[DocumenReference] ^short = "the DocumentReference resource"
* entry[DocumenReference] ^definition = "any new DocumentReference"
* entry[DocumenReference].resource 1..1
* entry[DocumenReference].request 1..1
* entry[DocumenReference].request.method = #PUT

* entry[Documents].resource ^type.code = "Binary"
* entry[Documents].resource ^type.profile = Canonical(Binary)
* entry[Documents] ^short = "the Document"
* entry[Documents] ^definition = "the Document referenced by the DocumentReference resource"
* entry[Documents].resource 1..1
* entry[Documents].request 1..1
* entry[Documents].request.method = #PUT


Profile:        NPFSReplaceDocumentBundle
Parent:         Bundle
Id:             IHE.NPFS.ReplaceDocumentBundle
Title:          "NPFS Replace Document Bundle"
Description:    "A profile on the Bundle transaction for ITI-87 Submit File used to replace a file and related metadata
  - shall be a Transaction Bundle
  - all resources shall be compliant with constraints
  - may replace one [DocumentReference](StructureDefinition-IHE.NPFS.DocumentReference.html)
    - with a document as a [Binary](http://hl7.org/fhir/R4/binary.html)"

* type = #transaction
* entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #closed
* entry ^slicing.description = "Slicing based on the profile conformance of the entry"
* entry and entry.resource MS

* entry contains 
    NewDocumenReference 1..1 and
    OldDocumenReference 1..1 and
    Documents 1..1
* entry[OldDocumenReference].resource only 
    IHE.NPFS.DocumentReferenceOld 
* entry[OldDocumenReference] ^short = "the DocumentReference resource with metadata of the previous file"
* entry[OldDocumenReference] ^definition = "DocumentReference of the previous file"
* entry[OldDocumenReference].resource 1..1
* entry[OldDocumenReference].request 1..1
* entry[OldDocumenReference].request.method = #PUT

* entry[NewDocumenReference].resource only 
    IHE.NPFS.DocumentReferenceNew 
* entry[NewDocumenReference] ^short = "the DocumentReference resource with metadata of the new file"
* entry[NewDocumenReference] ^definition = "DocumentReference of the new file"
* entry[NewDocumenReference].resource 1..1
* entry[NewDocumenReference].request 1..1
* entry[NewDocumenReference].request.method = #POST

* entry[Documents].resource ^type.code = "Binary"
* entry[Documents].resource ^type.profile = Canonical(Binary)
* entry[Documents] ^short = "the Document"
* entry[Documents] ^definition = "the Document referenced by the DocumentReference resource"
* entry[Documents].resource 1..1
* entry[Documents].request 1..1
* entry[Documents].request.method = #POST