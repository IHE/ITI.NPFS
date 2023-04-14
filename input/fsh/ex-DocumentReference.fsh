Instance:   ex-DocumentReferenceMinimal
InstanceOf: NPFSDocumentReference
Title: "DocumentReference for Minimal metadata"
Description:      "Example of a minimal DocumentReference resource. This is very unlikely to be acceptable anywhere, but it is the minimum required."
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:oid:1.2.840.113556.1.8000.2554.53432.348.12973.17740.34205.4355.50220.62012"
* status = #current
* type.coding.code = #urn:oid:1.3.6.1.4.1.19376.1.5.3.1.5.1
* type.coding.display = "eReferral workflow"
* category.coding.system = "urn:ihe:iti:npfs:2017:class-codes"
* category.coding.code = #WORKFLOW_DEFINITION
* date = 2023-04-04T11:00:00-05:00
* author = Reference(Patient/ex-patient)
* content.attachment.contentType = #application/pdf
* content.attachment.language = #en-US
* content.attachment.url = "urn:uuid:d3e62cb3-7be5-4971-a765-471669688f33"
* content.attachment.size = 3456
* content.attachment.hash = "07ae8b27c7596b3314601736f32d5f0ed17fc8c0e27a0475e8ea2d8b2c788436"
* content.format.code = http://ihe.net/fhir/ihe.formatcode.fhir/ValueSet/formatcode#urn:ihe:iti:xds-sd:text:2008


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


Instance:   ex-DocumentReferenceReplaceOld
InstanceOf: NPFSDocumentReference
Title: "Old DocumentReference for Replace"
Description:      "Example of a Old DocumentReference resource for Replace. This is fully filled for all mandatory elements and all optional elements."
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:oid:1.2.840.113556.1.8000.2554.53432.348.12973.17740.34205.4355.50220.62012"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:0c287d32-01e3-4d87-9953-9fcc9404eb21"
* identifier.use = #official
* status = #superseded
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
* description = "Example of a Old DocumentReference resource for Replace. This is fully filled for all mandatory elements and all optional elements."
* content.attachment.size = 3456
* content.attachment.hash = "ZGEzOWEzZWU1ZTZiNGIwZDMyNTViZmVmOTU2MDE4OTBhZmQ4MDcwOQ=="
* content.attachment.size = 0
* content.format.code = http://ihe.net/fhir/ihe.formatcode.fhir/ValueSet/formatcode#urn:ihe:iti:xds-sd:text:2008
* relatesTo.code = #appends
* relatesTo.target = Reference(DocumentReference/ex-documentreference)


Instance:   ex-DocumentReferenceReplaceNew
InstanceOf: NPFSDocumentReference
Title: "New DocumentReference for Replace"
Description:      "Example of a New DocumentReference resource for Replace. This is fully filled for all mandatory elements and all optional elements."
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
* description = "Example of a New DocumentReference resource for Replace. This is fully filled for all mandatory elements and all optional elements."
* content.attachment.size = 3456
* content.attachment.hash = "ZGEzOWEzZWU1ZTZiNGIwZDMyNTViZmVmOTU2MDE4OTBhZmQ4MDcwOQ=="
* content.attachment.size = 0
* content.format.code = http://ihe.net/fhir/ihe.formatcode.fhir/ValueSet/formatcode#urn:ihe:iti:xds-sd:text:2008
* relatesTo.code = #replaces
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
* telecom.value = "JohnMoehrke@gmail.com"