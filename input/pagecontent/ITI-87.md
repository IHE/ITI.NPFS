
### 2:3.87.1 Scope

This transaction allows a File Source to publish a new file and related
metadata. It also enables update of an existing file and update its
metadata and replacement of a file.

The files are not associated with a patient.

### 2:3.87.2 Actors Roles

<div>
<table border="1" borderspacing="0"
    style="border: 1px solid black; border-collapse: collapse">
    <caption style="text-align:left">
        <b> Table 2:3.87.2-1: Actor Roles </b>
    </caption>
    <tbody>
        <tr>
            <td style="padding:3px"><b>Actor:</b></td>
            <td><a href="volume-1.html#147113-file-source">File Source</a></td>
        </tr>
       <tr>
            <td><b>Role:</b></td>
            <td>Sends non-patient files and related metadata to a File Manager</td>
        </tr>
        <tr>
            <td><b>Actor:</b></td>
            <td><a href="volume-1.html#147111-file-manager">File Manager</a></td>
        </tr>
        <tr>
            <td><b>Role:</b></td>
            <td>Stores received non-patient files and maintains related metadata</td>
        </tr>
    </tbody>
</table>
</div>
<br>

### 2:3.87.3 Referenced Standards

<table border="1" borderspacing="0"
    style="border: 1px solid black; border-collapse: collapse">
    <tbody>
        <tr>
            <td style="padding:3px">HL7 FHIR</td>
            <td><a href="http://www.hl7.org/FHIR/R4">HL7 FHIR Release 4.0</a></td>
        </tr>
    </tbody>
</table>

### 2:3.87.4 Messages

<div>
{%include ITI-87-seq.svg%}
<p><b>Figure 2:3.87.4-1: Create File Interactions</b></p>
</div>
<br clear="all">

#### 2:3.87.4.1 Create File Request Message

The File Source uses this message to submit a new file (Binary Resource)
and related metadata (DocumentReference Resource) to a target File
Manager using a FHIR transaction.

##### 2:3.87.4.1.1 Trigger Events

The File Source needs to submit a new file to a File Manager. The file
may have been created by the File Source itself or by another file
creator.

##### 2:3.87.4.1.2 Message Semantics

The File Source shall issue an HTTP request according to requirements
defined in the HL7<sup>®</sup> FHIR<sup>®</sup> standard for "create"
interaction (<http://hl7.org/fhir/R4/http.html#create> ). The message
uses an HTTP POST method to submit a FHIR Bundle Resource.

The Bundle Resource:

- shall contain one Binary Resource
  (<https://www.hl7.org/fhir/R4/binary.html>) representing the file. The
  Binary Resource shall contain the base64-encoded file in the content
  element and the mime-type of the file in the contentType element.

- shall contain one FHIR DocumentReference Resource
  (<https://www.hl7.org/fhir/R4/documentreference.html>) with the file’s
  metadata. Constraints on the DocumentReference Resource are listed in [Resource Profile: NPFS DocumentReference](StructureDefinition-IHE.NPFS.DocumentReference.html).

- may contain other resources that are referenced by the
  DocumentReference Resource.

The File Source shall submit FHIR resources in either XML format or JSON
format. Values for media-type of the request message are defined in the
[ITI TF-2: Appendix Z.6](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.6-populating-the-expected-response-format) (currently in the Appendix Z on HL7 FHIR Trial
Implementation Supplement)*.*

See [ITI TF-2: Appendix W](https://profiles.ihe.net/ITI/TF/Volume2/ch-W.html#Appendix%20W) for informative implementation material for
this transaction.

Sections below provide specific guidance about how handle metadata for
stylesheets, workflow definitions, and privacy policies. If other files
types will be managed, local policy should establish values for type,
category, format, mime-type and masterIdentifier elements

###### 2:3.87.4.1.2.1 category element

Codes in the category element shall be from [ValueSet: NPFS DocumentReference category](ValueSet-DocumentReferenceCategory.html), if any
of the codes within the value set can apply to the concept being
communicated. If the table does not cover the concept (based on human
review), an alternate code may be used instead.

###### 2:3.87.4.1.2.2 type element

This section identifies specific guidelines for the type element which
depends on the "class" of the file:

- If the file submitted is a Workflow Definition template, the type
  element could be valued with the workflow definition reference of the
  Workflow Definition profile (see workflowDefinitionReference as
  defined by the XDW Profile; [see ITI TF-3: 5.4.2.2](https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_TF_Rev15.0_Vol3_FT_2018-07-24.pdf)).

- If the file submitted is a Patient Privacy Policy (see ITI TF-1:
  19.2.1 Basic Patient Privacy Consent), the type element should be
  valued with the LOINC code 57017-6 "Privacy policy Organization
  Document" as shown in [ValueSet: NPFS DocumentReference category](ValueSet-DocumentReferenceCategory.html).

- If the file submitted is a Stylesheet, the type element will be valued
  with a codeable concept defined by local policy that classifies the
  type of the stylesheet. The codeable concept of the type element shall
  be defined by both a code and a system (e.g., code= "laboratory"
  system="http://localdomain.org/stylesheetstype").

###### 2:3.87.4.1.2.3 File relationships 

The relatesTo element holds relationships that the file has with other
non-patient files. The DocumentReference.relatesTo element allows for
the creation of those relationships (i.e., replacement, sign, transform,
or append).

###### 2:3.87.4.1.2.4 MasterIdentifier element

This section identifies specific requirements for the masterIdentifier
element, if used:

- If the file submitted is a Workflow Definition template, the
  masterIdentifier element shall be valued with the
  workflowDefinitionReference as defined by the XDW Profile ([see ITI TF-3: 5.4.2.2](https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_TF_Rev15.0_Vol3_FT_2018-07-24.pdf)) .

- If the file submitted is a Patient Privacy Policy ([see ITI TF-1: 19.2.1 Basic Patient Privacy Consent](https://profiles.ihe.net/ITI/TF/Volume1/ch-19.html)), the masterIdentifier element
  shall be valued with the associated Patient Privacy Policy Identifier.

Local policies should define how to handle this element in case of
file’s revision, update or replacement.

###### 2:3.87.4.1.2.5 Create File request message example

For an example of a Create File Request Bundle see <a href="Bundle-ex-CreateDocumentBundle.html">Example Bundle: Create Document Bundle</a>

##### 2:3.87.4.1.3 Expected Actions

The File Manager shall support all the media-types defined in [ITI TF-2: Appendix Z.6](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.6-populating-the-expected-response-format) (currently in the Appendix Z on HL7 FHIR Trial
Implementation Supplement).

On receipt of the Create File Request, the File Manager shall validate
the Resources and respond with one of the HTTP codes defined in [Section 3.87.4.4.2 Message Semantics](ITI-87.html#2387442-message-semantics).

The File Manager shall process the Bundle atomically.

The File Manager shall support Create File Request messages that contain
one Binary Resource and one DocumentReference Resource. The File Manager
shall store these resources and make them available for further
processing, e.g., file update or replacement \[ITI-87\], file metadata
update \[ITI-89\], search \[ITI-88\], and retrieve \[ITI-109\].

If the File Manager receives a Create File Request message that contains
resources other than the required ones, it may respond to the File
Source with a failure (see [Section 3.87.4.4.2](ITI-87.html#2387442-message-semantics)).

#### 2:3.87.4.2 Update File Request Message

The File Source uses this message to update a file already existing on
the File Manager.

This message is used when there is a prior file that does not need to be
preserved.

The File Manager is not required to support FHIR resource versioning
(<https://www.hl7.org/fhir/R4/versions.html>.)

##### 2:3.87.4.2.1 Trigger Events

The File Source needs to update a file that exists on the File Manager.

Prior to sending the update, the File Source shall discover the resource
ids of the existing DocumentReference Resource and the Binary Resource
to be updated.

##### 2:3.87.4.2.2 Message Semantics

The File Source shall issue an HTTP request according to requirements
defined in the HL7<sup>®</sup> FHIR<sup>®</sup> standard for "update"
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
  constraints on the DocumentReference Resource are listed in [Resource Profile: NPFS DocumentReference](StructureDefinition-IHE.NPFS.DocumentReference.html).

The File Source shall submit FHIR resources in either XML format or JSON
format. Values for media-type of the request message are defined in the
[ITI TF-2: Appendix Z.6](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.6-populating-the-expected-response-format) (currently in the Appendix Z on HL7 FHIR Trial
Implementation Supplement)*.*

###### 2:3.87.4.2.2.1 Update File Request message example

For an example of a Update File Request Bundle see <a href="Bundle-ex-UpdateDocumentBundle.html">Example Bundle: Update Document Bundle</a>

##### 2:3.87.4.2.3 Expected Actions

The File Manager shall support all the media-type defined in [ITI TF-2: Appendix Z.6](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.6-populating-the-expected-response-format) (currently in the Appendix Z on HL7 FHIR Trial
Implementation Supplement).

On receipt of the Update File Request, the File Manager shall respond
with one of the HTTP codes defined in [Section 3.87.4.4.2 Message Semantics](ITI-87.html#2387442-message-semantics).

The File Manager shall process the Bundle atomically.

The File Manager shall support Update File Request messages that contain
one Binary Resource and one DocumentReference Resource. The File Manager
shall store these resources and make them available for further
processing, e.g., file update or replacement \[ITI-87\], file metadata
update \[ITI-89\], search \[ITI-88\], and retrieve \[ITI-109\]

The previous content in the updated Binary and DocumentReference
Resources will be no longer accessible, and the new file will be
retrievable using the same bundle.entry.fullUrl as the previous one.

If the File Manager receives an Update File Request message that
contains resources other than the required ones, it may respond to the
File Source with a failure (see [Section 3.87.4.4.2](ITI-87.html#2387442-message-semantics)).

#### 2:3.87.4.3 Replace File Request Message

The File Source uses this message to replace a file already existing on
the File Manager.

This message is used when there is a prior file that needs to be
preserved, so the existing Binary and Document Reference Resources will
be superseded (i.e., deprecated).

The File Manager is not required to support FHIR resource versioning
(<https://www.hl7.org/fhir/R4/versions.html>.)

##### 2:3.87.4.3.1 Trigger Events

The File Source needs to replace a file that exists on the File Manager.

The replace mechanism will be handled by creating a new file and
updating the previous DocumentReference Resource in one message.

##### 2:3.87.4.3.2 Message Semantics

This message uses an HTTP POST to submit a FHIR Bundle that contains the
new Binary and DocumentReference Resources and also the prior
DocumentReference Resource that needs to be replaced.

The Bundle Resource shall contain:

- one Binary Resource representing the new file, valued according to
  [Section 3.87.4.1.2](ITI-87.html#2387412-message-semantics), with the bundle.entry.request.method element set
  to POST

- one DocumentReference Resource with metadata for the new file, where
  the DocumentReference.status shall be set to "current", the
  relatesTo.code shall be set to "replaces", and the relatesTo.target to
  the URL of the previous DocumentReference Resource, and the
  bundle.entry.request.method element set to POST

- one DocumentReference Resource with metadata of the previous file,
  valued as specified in [Section 3.89.4.1.1](ITI-89.html#2389411-trigger-events) with the
  bundle.entry.request.method element set to PUT and the
  DocumentReference.status to "superseded".

##### 2:3.87.4.3.3 Expected Actions

The File Manager shall support all the media-types defined in [ITI TF-2: Appendix Z.6](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.6-populating-the-expected-response-format) (currently in the Appendix Z on HL7 FHIR Trial
Implementation Supplement).

On receipt of the Replace File Request, the File Manager shall validate
the Resources and respond with one of the HTTP codes defined in [Section 3.87.4.4.2 Message Semantics](ITI-87.html#2387442-message-semantics).

The File Manager shall process the Bundle atomically.

The File Manager shall store these resources and make the new file
available for further processing, e.g., file update or replacement
\[ITI-87\], file metadata update \[ITI-89\], search \[ITI-88\], and
retrieve \[ITI-109\].

If the File Manager receives a Replace File Request message that
contains resources other than the required ones, it may respond to the
File Source with a failure ([see Section 3.87.4.4.2](ITI-87.html#2387442-message-semantics)).

#### 2:3.87.4.4 Submit File Response Message

The File Manager sends a Submit File Response message in response to a
Create File Request, an Update File Request, or a Replace File Request
Message.

##### 2:3.87.4.4.1 Trigger Events

When the File Manager has finished creating or updating the file and
metadata received from the File Source, the File Manager sends this
message to the File Source acknowledging the result of the create,
update or replace request.

##### 2:3.87.4.4.2 Message Semantics

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

- When the FHIR Resource DocumentReference.type is not supported by the File Manager.

- If the Bundle Resource contains resources other than Binary, DocumentReference Resources and the resources referenced by the DocumentReference Resource.

The File Manager can return other status codes 4xx or 5xx in accordance
to internal business rules that are out of scope for this transaction.

##### 2:3.87.4.4.3 Expected Actions

The File Source processes the response according to application-defined
rules.

#### 2:3.87.4.5 CapabilityStatement Resource

File Managers implementing this transaction shall provide a CapabilityStatement Resource as described in [ITI TF-2: Appendix Z.3](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.3-capabilitystatement-resource) indicating the transaction has been implemented.

- Requirements CapabilityStatement for [File Source](CapabilityStatement-IHE.NPFS.FileSource.html)
- Requirements CapabilityStatement for [File Source implementing Update DocumentReference](CapabilityStatement-IHE.NPFS.FileSourceOption.html)
- Requirements CapabilityStatement for [File Manager](CapabilityStatement-IHE.NPFS.FileManager.html)

### 2:3.87.5 Security Considerations

See [NPFS Security Considerations](volume-1.html#1475-npfs-security-considerations).

The files are not Patient specific, but they may have other needs for security controls, such as business knowledge restrictions. Thus the use of Security may be applicable.
Actors involved in this transaction should be aware that even if the
Resources exchanged do not contain PHI or other private information,
actions such creating, updating, or replacing those Resources could
compromise patient care or have other legal ramifications. For general
security considerations, see [ITI TF-2: Appendix Z.8](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.8-mobile-security-considerations) (currently in the
Appendix Z on HL7 FHIR Trial Implementation Supplement).

#### 2:3.87.5.1 Security Audit Considerations

The File Source, when grouped with [ATNA](https://profiles.ihe.net/ITI/TF/Volume1/ch-9.html) Secure Node or Secure Application Actor, shall be able to record a [Submit File Source Audit Event Log](StructureDefinition-IHE.NPFS.SubmitFile.Audit.Source.html).

The File Manager, when grouped with [ATNA](https://profiles.ihe.net/ITI/TF/Volume1/ch-9.html) Secure Node or Secure Application Actor, shall be able to record a [Submit File Manager Audit Event Log](StructureDefinition-IHE.NPFS.SubmitFile.Audit.Manager.html).

The File Source and File Manager may also record fundamental AuditEvents for each individual resource Created or Updated, using the [BALP](https://profiles.ihe.net/ITI/BALP/index.html) [basic profile for REST events](https://profiles.ihe.net/ITI/BALP/content.html#3573-restful-activities).
