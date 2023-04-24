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
/** entry[OldDocumenReference].fullUrl = "ex-DocumentReferenceReplaceOld"
* entry[OldDocumenReference].resource = ex-DocumentReferenceReplaceOld
* entry[OldDocumenReference].request.url = "DocumentReference"
* entry[OldDocumenReference].request.method = #PUT*/

* entry[NewDocumenReference].fullUrl = "ex-DocumentReferenceReplaceNew"
* entry[NewDocumenReference].resource = ex-DocumentReferenceReplaceNew 
* entry[NewDocumenReference].request.url = "DocumentReference"
* entry[NewDocumenReference].request.method = #POST

* entry[Documents].fullUrl = "ex-binary"
* entry[Documents].resource = ex-binary
* entry[Documents].request.url = "Binary"
* entry[Documents].request.method = #POST