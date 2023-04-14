Instance:   ex-CreateDocumentBundle
InstanceOf: NPFSCreateDocumentBundle
Title: "Create Document Bundle"
Description:      "Example of Bundle transaction for ITI-87 Submit File used to submit a new file and related metadata"
Usage: #example

* type = #transaction
* entry[DocumenReference].fullUrl = "ex-DocumentReferenceComprehensive"
* entry[DocumenReference].resource = ex-DocumentReferenceComprehensive 
* entry[DocumenReference].request.url = "DocumentReference"
* entry[DocumenReference].request.method = #POST

* entry[Documents].fullUrl = "ex-binary"
* entry[Documents].resource = ex-binary
* entry[Documents].request.url = "Binary"
* entry[Documents].request.method = #POST


Instance:   ex-UpdateDocumentBundle
InstanceOf: NPFSUpdateDocumentBundle
Title: "Update Document Bundle"
Description:      "Example of Bundle transaction for ITI-87 Submit File used to update a file and related metadata"
Usage: #example

* type = #transaction
* entry[DocumenReference].fullUrl = "ex-DocumentReferenceComprehensive"
* entry[DocumenReference].resource = ex-DocumentReferenceComprehensive 
* entry[DocumenReference].request.url = "DocumentReference"
* entry[DocumenReference].request.method = #PUT

* entry[Documents].fullUrl = "ex-binary"
* entry[Documents].resource = ex-binary
* entry[Documents].request.url = "Binary"
* entry[Documents].request.method = #PUT


Instance:   ex-ReplaceDocumentBundle
InstanceOf: NPFSReplaceDocumentBundle
Title: "Replace Document Bundle"
Description:      "Example of Bundle transaction for ITI-87 Submit File used to Replace a file and related metadata"
Usage: #example

* type = #transaction
* entry[OldDocumenReference].fullUrl = "ex-DocumentReferenceReplaceOld"
* entry[OldDocumenReference].resource = ex-DocumentReferenceReplaceOld
* entry[OldDocumenReference].request.url = "DocumentReference"
* entry[OldDocumenReference].request.method = #PUT

* entry[NewDocumenReference].fullUrl = "ex-DocumentReferenceReplaceNew"
* entry[NewDocumenReference].resource = ex-DocumentReferenceReplaceNew 
* entry[NewDocumenReference].request.url = "DocumentReference"
* entry[NewDocumenReference].request.method = #POST

* entry[Documents].fullUrl = "ex-binary"
* entry[Documents].resource = ex-binary
* entry[Documents].request.url = "Binary"
* entry[Documents].request.method = #POST

/**
Instance:   ex-DocumentReferenceComprehensive
InstanceOf: NPFSDocumentReference
Title: "DocumentReference for Comprehensive fully filled metadata"
Description:      "Example of a Comprehensive DocumentReference resource. This is fully filled for all mandatory elements and all optional elements."
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:oid:1.2.840.113556.1.8000.2554.53432.348.12973.17740.34205.4355.50220.62012"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:0c287d32-01e3-4d87-9953-9fcc9404eb21"
* identifier.use = #official
* status = #current
* content.attachment.contentType = #text/plain
* content.attachment.url = "http://example.com/nowhere.txt"
* type.coding.code = #urn:oid:1.3.6.1.4.1.19376.1.5.3.1.5.1
* type.coding.display = "eReferral workflow"
* category.coding.system = "urn:ihe:iti:npfs:2017:class-codes"
* category.coding.code = #WORKFLOW_DEFINITION
* date = 2023-04-04T11:00:00-05:00
* securityLabel = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#N
* content.attachment.language = #en-US
* content.attachment.creation = 2023-04-04T11:00:00-05:00
* author = Reference(Patient/ex-patient)
* authenticator = Reference(Practitioner/ex-practitioner)
* context.period.start = 2020-12-31T23:50:50-05:00
* context.period.end = 2020-12-31T23:50:50-05:00
* context.event = http://terminology.hl7.org/CodeSystem/v3-ActCode#ACCTRECEIVABLE
* content.format = http://ihe.net/fhir/ihe.formatcode.fhir/CodeSystem/formatcode#urn:ihe:iti:xds-sd:text:2008
* content.attachment.title = "DocumentReference for Comprehensive minimally filled metadata"
* description = "Example of a Comprehensive DocumentReference resource. This is minimally filled for all mandatory elements."
* content.attachment.size = 3456
* content.attachment.hash = "ZGEzOWEzZWU1ZTZiNGIwZDMyNTViZmVmOTU2MDE4OTBhZmQ4MDcwOQ=="
* content.attachment.size = 0
* content.format.code = http://ihe.net/fhir/ihe.formatcode.fhir/ValueSet/formatcode#urn:ihe:iti:xds-sd:text:2008
* relatesTo.code = #appends
* relatesTo.target = Reference(DocumentReference/ex-documentreference)


Instance:   in-patient
InstanceOf: Patient
Title:      "Dummy inline Patient example"
Description: "Dummy inline patient example for completeness sake. No actual use of this resource other than an example target"
Usage: #inline


Instance: in-author
InstanceOf: Practitioner
Title: "Dummy inline Practitioner example"
Description: "Dummy inline Practitioner example for completeness sake. No actual use of this resource other than an example target"
Usage: #inline
* telecom.system = #email
* telecom.value = "JohnMoehrke@gmail.com" */