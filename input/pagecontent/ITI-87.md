
### 3.87.1 Scope

This transaction allows a File Source to publish a new file and related
metadata. It also enables update of an existing file and update its
metadata and replacement of a file.

The files are not associated with a patient.

### 3.87.2 Actors Roles

<div>
<table border="1" borderspacing="0"
    style="border: 1px solid black; border-collapse: collapse">
    <caption style="text-align:left">
        <b> Table 3.87.2-1: Actor Roles </b>
    </caption>
    <tbody>
        <tr>
            <td style="padding:3px"><b>Actor:</b></td>
            <td><a href="volume-1.html#47113-file-source">File Source</a></td>
        </tr>
       <tr>
            <td><b>Role:</b></td>
            <td>Sends non-patient files and related metadata to a File Manager</td>
        </tr>
        <tr>
            <td><b>Actor:</b></td>
            <td><a href="volume-1.html#47111-file-manager">File Manager</a></td>
        </tr>
        <tr>
            <td><b>Role:</b></td>
            <td>Stores received non-patient files and maintains related metadata</td>
        </tr>
    </tbody>
</table>
</div>
<br>

### 3.87.3 Referenced Standards

<table border="1" borderspacing="0"
    style="border: 1px solid black; border-collapse: collapse">
    <tbody>
        <tr>
            <td style="padding:3px">HL7 FHIR</td>
            <td><a href="http://www.hl7.org/FHIR/R4">HL7 FHIR Release 4.0</a></td>
        </tr>
    </tbody>
</table>

### 3.87.4 Messages

<div>
{%include ITI-87-seq.svg%}
<p><b>Figure 3.87.4-1: Interaction Diagram</b></p>
</div>
<br clear="all">

#### 3.87.4.1 Create File Request Message

The File Source uses this message to submit a new file (Binary Resource)
and related metadata (DocumentReference Resource) to a target File
Manager using a FHIR transaction.

##### 3.87.4.1.1 Trigger Events

The File Source needs to submit a new file to a File Manager. The file
may have been created by the File Source itself or by another file
creator.

##### 3.87.4.1.2 Message Semantics

The File Source shall issue an HTTP request according to requirements
defined in the HL7<sup>®</sup> FHIR<sup>®</sup> standard for “create”
interaction (<http://hl7.org/fhir/R4/http.html#create> ). The message
uses an HTTP POST method to submit a FHIR Bundle Resource.

The Bundle Resource:

- shall contain one Binary Resource
  (<https://www.hl7.org/fhir/R4/binary.html>) representing the file. The
  Binary Resource shall contain the base64-encoded file in the content
  element and the mime-type of the file in the contentType element.

- shall contain one FHIR DocumentReference Resource
  (<https://www.hl7.org/fhir/R4/documentreference.html)> with the file’s
  metadata. Constraints on the DocumentReference Resource are listed in
  Table 3.87.4.1.2-1.

- may contain other resources that are referenced by the
  DocumentReference Resource.

The File Source shall submit FHIR resources in either XML format or JSON
format. Values for media-type of the request message are defined in the
ITI TF-2x: Appendix Z.6 (currently in the Appendix Z on HL7 FHIR Trial
Implementation Supplement)*.*

<p style="font-weight:bold">Table 3.87.4.1.2-1: DocumentReference Resource Constraints</p>

<table>
<colgroup>
<col style="width: 34%" />
<col style="width: 38%" />
<col style="width: 27%" />
</colgroup>
<thead>
<tr class="header">
<th style="border:1px solid black; text-align:center">Element Name</th>
<th style="border:1px solid black; text-align:center">IHE Constraint</th>
<th style="border:1px solid black; text-align:center">Notes</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="border:1px solid black"><p>id</p>
<p>[0..1]</p></td>
<td style="border:1px solid black"></td>
<td style="border:1px solid black">The id element shall be provided if the File Source is sending a
Replace File Message (<a href="ITI-87.html#387422-message-semantics">Section 3.87.4.2.2</a>). The value is the id of the
DocumentReference Resource to be updated.</td>
</tr>
<tr class="even">
<td style="border:1px solid black"><p>masterIdentifier</p>
<p>[0..1]</p></td>
<td style="border:1px solid black"></td>
<td style="border:1px solid black"><a href="ITI-87.html#3874124-masteridentifier-element">See Section 3.87.4.1.2.4.</a></td>
</tr>
<tr class="odd">
<td style="border:1px solid black"><p>status</p>
<p>[1..1]</p></td>
<td style="border:1px solid black"></td>
<td style="border:1px solid black"></td>
</tr>
<tr class="even">
<td style="border:1px solid black"><p>type</p>
<p>[0..1]</p></td>
<td style="border:1px solid black">[1..1]</td>
<td style="border:1px solid black"><a href="ITI-87.html#3874122-type-element">See Section 3.87.4.1.2.2.</a></td>
</tr>
<tr class="odd">
<td style="border:1px solid black"><p>category</p>
<p>[0..1]</p></td>
<td style="border:1px solid black">[1..1]</td>
<td style="border:1px solid black">File’s class (e.g., Workflow Definition, Stylesheet, Privacy
Policy). <a href="ITI-87.html#3874121-category-element">See Section 3.87.4.1.2.1.</a></td>
</tr>
<tr class="even">
<td style="border:1px solid black"><p>subject</p>
<p>[0..1]</p></td>
<td style="border:1px solid black">[0..0]</td>
<td style="border:1px solid black"></td>
</tr>
<tr class="odd">
<td style="border:1px solid black"><p>date</p>
<p>[0..1]</p></td>
<td style="border:1px solid black">[1..1]</td>
<td style="border:1px solid black">Time when the file was submitted.</td>
</tr>
<tr class="even">
<td style="border:1px solid black"><p>author</p>
<p>[0..*]</p></td>
<td style="border:1px solid black">[1..*]</td>
<td style="border:1px solid black">The author element shall be valued with at least a reference to an
Organization Resource.</td>
</tr>
<tr class="odd">
<td style="border:1px solid black"><p>relatesTo</p>
<p>[0..*]</p></td>
<td style="border:1px solid black"></td>
<td style="border:1px solid black"><a href="ITI-87.html#3874123-file-relationships">See Section 3.87.4.1.2.3.</a></td>
</tr>
<tr class="even">
<td style="border:1px solid black"><p>content.attachment.contentType</p>
<p>[0..1]</p></td>
<td style="border:1px solid black">[1..1]</td>
<td style="border:1px solid black"></td>
</tr>
<tr class="odd">
<td style="border:1px solid black"><p>content.attachment.language</p>
<p>[0..1]</p></td>
<td style="border:1px solid black">Required if known</td>
<td style="border:1px solid black"></td>
</tr>
<tr class="even">
<td style="border:1px solid black"><p>content.attachment.data</p>
<p>[0..1]</p></td>
<td style="border:1px solid black">[0..0]</td>
<td style="border:1px solid black"></td>
</tr>
<tr class="odd">
<td style="border:1px solid black"><p>content.attachment.url</p>
<p>[0..1]</p></td>
<td style="border:1px solid black">[1..1]</td>
<td style="border:1px solid black"><p>For new submitted files this element shall be valued with the
same opaque identifier of the entry.fullurl related to the Binary
Resource.</p>
<p>For updates to files this element shall be valued with the URL of the
Binary Resource that can be used to retrieve the file using the Retrieve
Document [ITI-68] transaction.</p></td>
</tr>
<tr class="even">
<td style="border:1px solid black"><p>content.attachment.size</p>
<p>[0..1]</p></td>
<td style="border:1px solid black">[1..1]</td>
<td style="border:1px solid black"></td>
</tr>
<tr class="odd">
<td style="border:1px solid black"><p>content.attachment.hash</p>
<p>[0..1]</p></td>
<td style="border:1px solid black">[1..1]</td>
<td style="border:1px solid black"></td>
</tr>
<tr class="even">
<td style="border:1px solid black"><p>content.format</p>
<p>[0..1]</p></td>
<td style="border:1px solid black">[1..1]</td>
<td style="border:1px solid black">File’s format. The values of this metadata should be defined by
local domain policies.</td>
</tr>
<tr class="odd">
<td style="border:1px solid black"><p>context.sourcePatientInfo</p>
<p>[0..1]</p></td>
<td style="border:1px solid black">[0..0]</td>
<td style="border:1px solid black"></td>
</tr>
<tr class="even">
<td style="border:1px solid black"><p>context.encounter</p>
<p>[0..*]</p></td>
<td style="border:1px solid black">[0..0]</td>
<td style="border:1px solid black"></td>
</tr>
<tr class="odd">
<td style="border:1px solid black"><p>context.related</p>
<p>[0..*]</p></td>
<td style="border:1px solid black">[0..0]</td>
<td style="border:1px solid black"></td>
</tr>
</tbody>
</table>

See ITI TF-2x: Appendix W for informative implementation material for
this transaction.

Sections below provide specific guidance about how handle metadata for
stylesheets, workflow definitions, and privacy policies. If other files
types will be managed, local policy should establish values for type,
category, format, mime-type and masterIdentifier elements

###### 3.87.4.1.2.1 category element

Codes in the category element shall be from Table 3.87.4.1.2.1-1, if any
of the codes within the value set can apply to the concept being
communicated. If the table does not cover the concept (based on human
review), an alternate code may be used instead.

<p style="font-weight:bold">Table 3.87.4.1.2.1-1: Coded values the category element</p>
 
<table>
<colgroup>
<col style="width: 30%" />
<col style="width: 40%" />
<col style="width: 30%" />
</colgroup>
<thead>
<tr class="header">
<th style="border:1px solid black; padding:3px; text-align:center">coding.code</th>
<th style="border:1px solid black; padding:3px; text-align:center">coding.display</th>
<th style="border:1px solid black; padding:3px; text-align:center">coding.system</th>
</tr>
</thead>
<tbody>
<tr>
<td style="border:1px solid black">STYLESHEET</td>
<td style="border:1px solid black">Code for Stylesheets</td>
<td style="border:1px solid black">urn:ihe:iti:npfs:2017:class-codes</td>
</tr>
<tr>
<td style="border:1px solid black">WORKFLOW_DEFINITION</td>
<td style="border:1px solid black">Code for Workflow Definitions</td>
<td style="border:1px solid black">urn:ihe:iti:npfs:2017:class-codes</td>
</tr>
<tr>
<td style="border:1px solid black">57017-6</td>
<td style="border:1px solid black">Code for Privacy policy Organization Document</td>
<td style="border:1px solid black">http://www.loinc.org</td>
</tr>
</tbody>
</table> 

###### 3.87.4.1.2.2 type element

This section identifies specific guidelines for the type element which
depends on the “class” of the file:

- If the file submitted is a Workflow Definition template, the type
  element could be valued with the workflow definition reference of the
  Workflow Definition profile (see workflowDefinitionReference as
  defined by the XDW Profile; see ITI TF-3: 5.4.2.2).

- If the file submitted is a Patient Privacy Policy (see ITI TF-1:
  19.2.1 Basic Patient Privacy Consent), the type element should be
  valued with the LOINC code 57017-6 “Privacy policy Organization
  Document” as shown in Table 3.87.4.1.2.1-1 .

- If the file submitted is a Stylesheet, the type element will be valued
  with a codeable concept defined by local policy that classifies the
  type of the stylesheet. The codeable concept of the type element shall
  be defined by both a code and a system (e.g., code= “laboratory”
  system=”http://localdomain.org/stylesheetstype”).

###### 3.87.4.1.2.3 File relationships 

The relatesTo element holds relationships that the file has with other
non-patient files. The DocumentReference.relatesTo element allows for
the creation of those relationships (i.e., replacement, sign, transform,
or append).

###### 3.87.4.1.2.4 MasterIdentifier element

This section identifies specific requirements for the masterIdentifier
element, if used:

- If the file submitted is a Workflow Definition template, the
  masterIdentifier element shall be valued with the
  workflowDefinitionReference as defined by the XDW Profile (see ITI
  TF-3: 5.4.2.2).

- If the file submitted is a Patient Privacy Policy (see ITI TF-1:
  19.2.1 Basic Patient Privacy Consent),, the masterIdentifier element
  shall be valued with the associated Patient Privacy Policy Identifier.

Local policies should define how to handle this element in case of
file’s revision, update or replacement.

###### 3.87.4.1.2.5 Create File request message example

An example of a Create File Request Bundle is presented below.

<table style="width:70%; border:1px solid black">
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th style="padding:5px; font-weight:normal">{<br />
"resourceType": "Bundle",<br />
"type": "transaction",<br />
"entry": [<br />
{<br />
"resource": {<br />
"resourceType": "DocumentReference",<br />
"status": "current",<br />
"type": {"coding": [{<br />
"code": "urn:oid:1.3.6.1.4.1.19376.1.5.3.1.5.1",<br />
"display": "eReferral workflow "<br />
}]},<br />
"category": {"coding": [{<br />
"system": "urn:ihe:iti:npfs:2017:class-codes",<br />
"code": "WORKFLOW_DEFINITION"<br />
}]},<br />
"date": "2017-04-17T11:00:00",<br />
"author": [{"reference":
"urn:uuid:9f146027-bbab-467e-b8f7-5b695c4c6891"}],<br />
"content": [{<br />
"attachment": {<br />
"contentType": "application/pdf",<br />
"language": "en-US",<br />
"url": "urn:uuid:d3e62cb3-7be5-4971-a765-471669688f33",<br />
"size": "3456",<br />
"hash":
"07ae8b27c7596b3314601736f32d5f0ed17fc8c0e27a0475e8ea2d8b2c788436"<br />
},<br />
"format": [{"code": "application/pdf"}]<br />
}]<br />
},<br />
"request": {<br />
"method": "POST",<br />
"url": "http://ihe-npfs.com/DocumentReference"<br />
}<br />
},<br />
{<br />
"fullUrl": "urn:uuid:d3e62cb3-7be5-4971-a765-471669688f33",<br />
"resource": {<br />
"resourceType": "Binary",<br />
"contentType": "application/pdf",<br />
"content":
"PD94bWwgdmVyc2ldHRwOi8vd3d3LncKPC9DbGluaWNhbERvY3VtZW50Pgo="<br />
},<br />
"request": {<br />
"method": "POST",<br />
"url": "http://ihe-npfs.com/Binary"<br />
}<br />
},<br />
{<br />
"fullUrl": "urn:uuid:9f146027-bbab-467e-b8f7-5b695c4c6891",<br />
"resource": {<br />
"resourceType": "Organization",<br />
"identifier": [{<br />
"system": "urn:oid:1.12.234.56",<br />
"value": "IHE FACILITY1039"<br />
}]<br />
},<br />
"request": {<br />
"method": "POST",<br />
"url": "http://ihe-npfs.com/Organization"<br />
}<br />
}<br />
]<br />
}</th>
</tr>
</thead>
<tbody>
</tbody>
</table>

Figure 3.87.4.1.2.5-1: Create File Request example

##### 3.87.4.1.3 Expected Actions

The File Manager shall support all the media-types defined in ITI TF-2x:
Appendix Z.6 (currently in the Appendix Z on HL7 FHIR Trial
Implementation Supplement).

On receipt of the Create File Request, the File Manager shall validate
the Resources and respond with one of the HTTP codes defined in Section
3.87.4.4.2 Message Semantics.

The File Manager shall process the Bundle atomically.

The File Manager shall support Create File Request messages that contain
one Binary Resource and one DocumentReference Resource. The File Manager
shall store these resources and make them available for further
processing, e.g., file update or replacement \[ITI-87\], file metadata
update \[ITI-89\], search \[ITI-88\], and retrieve \[ITI-68\].

If the File Manager receives a Create File Request message that contains
resources other than the required ones, it may respond to the File
Source with a failure (see Section 3.87.4.4.2).

#### 3.87.4.2 Update File Request Message

The File Source uses this message to update a file already existing on
the File Manager.

This message is used when there is a prior file that does not need to be
preserved.

The File Manager is not required to support FHIR resource versioning
(<https://www.hl7.org/fhir/R4/versions.html>.)

##### 3.87.4.2.1 Trigger Events

The File Source needs to update a file that exists on the File Manager.

Prior to sending the update, the File Source shall discover the resource
ids of the existing DocumentReference Resource and the Binary Resource
to be updated.

##### 3.87.4.2.2 Message Semantics

The File Source shall issue an HTTP request according to requirements
defined in the HL7<sup>®</sup> FHIR<sup>®</sup> standard for “update”
interaction (<http://hl7.org/fhir/R4/http.html#update>).

The message uses an HTTP POST to submit a FHIR Bundle that contains the
updated Binary and DocumentReference Resources. For each resource in the
Bundle, the bundle.entry.request.method shall be valued with the HTTP
PUT Method.

The Bundle Resource shall contain:

- one Binary Resource (<https://www.hl7.org/fhir/R4/binary.html>)
  representing the file that will update the existing Binary Resource.
  The id of the Binary Resource shall be valued with the id of the
  Binary Resource to be updated on the File Manager.

- one DocumentReference Resource
  (<https://www.hl7.org/fhir/R4/documentreference.html>) with updated
  metadata. The id of the DocumentReference Resource shall be valued
  with the id of the DocumentReference Resource to be updated;
  constraints on the DocumentReference Resource are listed in Table
  3.87.4.1.2-1.

The File Source shall submit FHIR resources in either XML format or JSON
format. Values for media-type of the request message are defined in the
ITI TF-2x: Appendix Z.6 (currently in the Appendix Z on HL7 FHIR Trial
Implementation Supplement)*.*

###### 3.87.4.2.2.1 Update File Request message example

An example of a Replace File Request Bundle is presented below.

<table style="width:70%; border:1px solid black">
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th style="padding:5px"><p><br/>{<br />
"resourceType": "Bundle",<br />
"type": "transaction",<br />
"entry": [<br />
{</p>
<p>"fullUrl": "http://ihe-npfs.com/DocumentReference/1234",<br />
"resource": {<br />
"resourceType": "DocumentReference",</p>
<p>"id": "1234",<br />
"status": "current",<br />
"type": {"coding": [{<br />
"code": "1.3.6.1.4.1.19376.1.5.3.1.5. ",<br />
"display": "eReferral workflow "<br />
}]},<br />
"category": {"coding": [{<br />
"system": "urn:ihe:iti:npfs:2017:class-codes",<br />
"code": "WORKFLOW_DEFINITION"<br />
}]},<br />
"date": "2017-04-17T11:00:00",<br />
"author": [{"reference": "
http://ihe-npfs.com/Organization/1564"}],<br />
"content": [{<br />
"attachment": {<br />
"contentType": "application/pdf",<br />
"language": "en-US",<br />
"url": "http://ihe-npfs.com/Binary/1236",<br />
"size": "3456",<br />
"hash":
"07ae8b27c7596b3314601736f32d5f0ed17fc8c0e27a0475e8ea2d8b2c788436"<br />
},<br />
"format": [{"code": "application/pdf"}]<br />
}]<br />
},<br />
"request": {<br />
"method": "PUT",<br />
"url": "http://ihe-npfs.com/DocumentReference/1234"<br />
}<br />
},<br />
{<br />
"fullUrl": "http://ihe-npfs.com/Binary/1236",<br />
"resource": {<br />
"resourceType": "Binary",</p>
<p>"id": "1236",<br />
"contentType": "application/pdf",<br />
"content":
"PD94bWwgdmVyc2ldHRwOi8vd3d3LncKPC9DbGluaWNhbERvY3VtZW50Pgo="<br />
},<br />
"request": {<br />
"method": "PUT",<br />
"url": "http://ihe-npfs.com/Binary/1236"<br />
}<br />
}<br />
]<br />
}</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

Figure 3.87.4.2.2.1-1: Update File Request example

##### 3.87.4.2.3 Expected Actions

The File Manager shall support all the media-type defined in ITI TF-2x:
Appendix Z.6 (currently in the Appendix Z on HL7 FHIR Trial
Implementation Supplement).

On receipt of the Update File Request, the File Manager shall respond
with one of the HTTP codes defined in Section 3.87.4.4.2 Message
Semantics.

The File Manager shall process the Bundle atomically.

The File Manager shall support Update File Request messages that contain
one Binary Resource and one DocumentReference Resource. The File Manager
shall store these resources and make them available for further
processing, e.g., file update or replacement \[ITI-87\], file metadata
update \[ITI-89\], search \[ITI-88\], and retrieve \[ITI-68\]

The previous content in the updated Binary and DocumentReference
Resources will be no longer accessible, and the new file will be
retrievable using the same bundle.entry.fullUrl as the previous one.

If the File Manager receives an Update File Request message that
contains resources other than the required ones, it may respond to the
File Source with a failure (see Section 3.87.4.4.2).

#### 3.87.4.3 Replace File Request Message

The File Source uses this message to replace a file already existing on
the File Manager.

This message is used when there is a prior file that needs to be
preserved, so the existing Binary and Document Reference Resources will
be superseded (i.e., deprecated).

The File Manager is not required to support FHIR resource versioning
(<https://www.hl7.org/fhir/R4/versions.html>.)

##### 3.87.4.3.1 Trigger Events

The File Source needs to replace a file that exists on the File Manager.

The replace mechanism will be handled by creating a new file and
updating the previous DocumentReference Resource in one message.

##### 3.87.4.3.2 Message Semantics

This message uses an HTTP POST to submit a FHIR Bundle that contains the
new Binary and DocumentReference Resources and also the prior
DocumentReference Resource that needs to be replaced.

The Bundle Resource shall contain:

- one Binary Resource representing the new file, valued according to
  Section 3.87.4.1.2, with the bundle.entry.request.method element set
  to POST

- one DocumentReference Resource with metadata for the new file, where
  the DocumentReference.status shall be set to “current”, the
  relatesTo.code shall be set to “replaces”, and the relatesTo.target to
  the URL of the previous DocumentReference Resource, and the
  bundle.entry.request.method element set to POST

- one DocumentReference Resource with metadata of the previous file,
  valued as specified in Section 3.89.4.1.1 with the
  bundle.entry.request.method element set to PUT and the
  DocumentReference.status to “superseded”.

##### 3.87.4.3.3 Expected Actions

The File Manager shall support all the media-types defined in ITI TF-2x:
Appendix Z.6 (currently in the Appendix Z on HL7 FHIR Trial
Implementation Supplement).

On receipt of the Replace File Request, the File Manager shall validate
the Resources and respond with one of the HTTP codes defined in Section
3.87.4.4.2 Message Semantics.

The File Manager shall process the Bundle atomically.

The File Manager shall store these resources and make the new file
available for further processing, e.g., file update or replacement
\[ITI-87\], file metadata update \[ITI-89\], search \[ITI-88\], and
retrieve \[ITI-68\].

If the File Manager receives a Replace File Request message that
contains resources other than the required ones, it may respond to the
File Source with a failure (see Section 3.87.4.4.2).

#### 3.87.4.4 Submit File Response Message

The File Manager sends a Submit File Response message in response to a
Create File Request, an Update File Request, or a Replace File Request
Message.

##### 3.87.4.4.1 Trigger Events

When the File Manager has finished creating or updating the file and
metadata received from the File Source, the File Manager sends this
message to the File Source acknowledging the result of the create,
update or replace request.

##### 3.87.4.4.2 Message Semantics

When the File Manager has processed the request, it shall return an HTTP
response with an overall status code.

The File Manager returns a HTTP status code appropriate to the
processing, conforming to the transaction specification requirements as
specified in <http://hl7.org/fhir/R4/http.html#transaction-response>.

To allow the File Source to know the outcome of processing the
transaction, and the identities assigned to the resources by the File
Manager, the File Manager shall return a Bundle, with type set to
transaction-response, that contains one entry for each entry in the
request, in the same order as received, with the outcome of processing
the entry. Each entry element shall contain a response element with an
HTTP Status Code which details the outcome of processing of the request
entry.

If the operation is a success, the HTTP status code of the response
shall be a 2xx code.

If the operation is a failure, the File Manager shall be capable of
returning the following status code:

- 422 – Unprocessable Entity:

- When the FHIR Resource DocumentReference.type is not supported by the
  > File Manager.

- If the Bundle Resource contains resources other than Binary,
  > DocumentReference Resources and the resources referenced by the
  > DocumentReference Resource.

The File Manager can return other status codes 4xx or 5xx in accordance
to internal business rules that are out of scope for this transaction.

###### 3.87.4.4.2.1 Submit File Response message example 

<table style="width:70%; border:1px solid black">
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th style="padding:5px"><p><br/>{<br />
“resourceType”:”Bundle”,<br />
“type”:”transaction-response”,<br />
“entry”:[<br />
{<br />
“response”:<br />
{<br />
“status”:”201”</p>
<p>“location”:”http://www.ihe.org/DocumentReference/453”<br />
}<br />
},<br />
{<br />
“response”:<br />
{<br />
“status”:”201”</p>
<p>“location”:”http://www.ihe.org/Binary/123”<br />
}<br />
},</p>
<p>{<br />
“response”:<br />
{<br />
“status”:”201”</p>
<p>“location”:”http://www.ihe.org/Organization/789”<br />
}<br />
}<br />
]<br />
}</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

##### 3.87.4.4.3 Expected Actions

The File Source processes the response according to application-defined
rules.

### 3.87.5 Security Considerations

Actors involved in this transaction should be aware that even if the
Resources exchanged do not contain PHI or other private information,
actions such creating, updating, or replacing those Resources could
compromise patient care or have other legal ramifications. For general
security considerations, see ITI TF-2x: Appendix Z.8 (currently in the
Appendix Z on HL7 FHIR Trial Implementation Supplement).

#### 3.87.5.1 Security Audit Considerations

This transaction does not require the actors involved to send audit
messages to an Audit Record Repository because it does not convey PHI.
However, the auditing of the Submit File transaction is recommended in
order to avoid malicious creation/updating of files associated with the
care of the patient. The audit message for the Submit File transaction
shall comply with the structure defined in DICOM<sup>®</sup>[^2] PS3.15
Annex A.5.1.