Instance:   ex-CreateDocumentBundle
InstanceOf: NPFSCreateDocumentBundle
Title: "Create Document Bundle"
Description:      "Example of Bundle transaction for ITI-87 Submit File used to submit a new file and related metadata"
Usage: #example

* type = #transaction
* entry[DocumenReference].fullUrl = "urn:uuid:cccccccc-4444-0000-0000-000000000001"
* entry[DocumenReference].resource = cccccccc-4444-0000-0000-000000000001 
* entry[DocumenReference].request.url = "DocumentReference"
* entry[DocumenReference].request.method = #POST

* entry[Documents].fullUrl = "urn:uuid:cccccccc-4444-0000-0000-000000000002"
* entry[Documents].resource = cccccccc-4444-0000-0000-000000000002
* entry[Documents].request.url = "Binary"
* entry[Documents].request.method = #POST


Instance:   ex-UpdateDocumentBundle
InstanceOf: NPFSUpdateDocumentBundle
Title: "Update Document Bundle"
Description:      "Example of Bundle transaction for ITI-87 Submit File used to update a file and related metadata"
Usage: #example

* type = #transaction
* entry[DocumenReference].fullUrl = "urn:uuid:cccccccc-4444-0000-0000-000000000001"
* entry[DocumenReference].resource = cccccccc-4444-0000-0000-000000000001 
* entry[DocumenReference].request.url = "DocumentReference"
* entry[DocumenReference].request.method = #PUT

* entry[Documents].fullUrl = "urn:uuid:cccccccc-4444-0000-0000-000000000002"
* entry[Documents].resource = cccccccc-4444-0000-0000-000000000002
* entry[Documents].request.url = "Binary"
* entry[Documents].request.method = #PUT


Instance:   ex-ReplaceDocumentBundle
InstanceOf: NPFSReplaceDocumentBundle
Title: "Replace Document Bundle"
Description:      "Example of Bundle transaction for ITI-87 Submit File used to Replace a file and related metadata"
Usage: #example

* type = #transaction
* entry[OldDocumenReference].fullUrl = "urn:uuid:cccccccc-4444-0000-0000-000000000003"
* entry[OldDocumenReference].resource = cccccccc-4444-0000-0000-000000000003
* entry[OldDocumenReference].request.url = "DocumentReference"
* entry[OldDocumenReference].request.method = #PUT

* entry[NewDocumenReference].fullUrl = "urn:uuid:cccccccc-4444-0000-0000-000000000004"
* entry[NewDocumenReference].resource = cccccccc-4444-0000-0000-000000000004 
* entry[NewDocumenReference].request.url = "DocumentReference"
* entry[NewDocumenReference].request.method = #POST

* entry[Documents].fullUrl = "urn:uuid:cccccccc-4444-0000-0000-000000000002"
* entry[Documents].resource = cccccccc-4444-0000-0000-000000000002
* entry[Documents].request.url = "Binary"
* entry[Documents].request.method = #POST