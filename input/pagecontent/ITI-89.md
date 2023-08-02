### 2:3.89.1 Scope

This transaction allows a File Source to update a DocumentReference
Resource previously submitted. The DocumentReference Resource represents
metadata for a file that is not associated with a patient.

The File Manager is not required to support FHIR resource versioning
(see <https://www.hl7.org/fhir/R4/http.html#history>).

### 2:3.89.2 Actor Roles

<div>
<table border="1" borderspacing="0"
    style="border: 1px solid black; border-collapse: collapse">
    <caption style="text-align:left">
        <b> Table 2:3.89.2-1: Actor Roles </b>
    </caption>
    <tbody>
        <tr>
            <td style="padding:3px"><b>Actor:</b></td>
            <td><a href="volume-1.html#147113-file-source">File Source</a></td>
        </tr>
       <tr>
            <td><b>Role:</b></td>
            <td>Sends an update to an existing DocumentReference Resource.</td>
        </tr>
        <tr>
            <td><b>Actor:</b></td>
            <td><a href="volume-1.html#147111-file-manager">File Manager</a></td>
        </tr>
        <tr>
            <td><b>Role:</b></td>
            <td>Updates and maintains DocumentReference Resources.</td>
        </tr>
    </tbody>
</table>
</div>
<br>

### 2:3.89.3 Referenced Standards

<table border="1" borderspacing="0"
    style="border: 1px solid black; border-collapse: collapse">
    <tbody>
        <tr>
            <td style="padding:3px">HL7 FHIR</td>
            <td><a href="http://hl7.org/fhir/R4/index.html">HL7 FHIR Release 4.0</a></td>
        </tr>
    </tbody>
</table>

### 2:3.89.4 Messages

<div>
{%include ITI-89-seq.svg%}
<p><b>Figure 2:3.89.4-1: Update DocumentReference Interactions</b></p>
</div>
<br clear="all">

#### 2:3.89.4.1 Update DocumentReference Request Message

The File Source uses this message to update a FHIR DocumentReference
Resource already stored on the File Manager.

##### 2:3.89.4.1.1 Trigger Events

The File Source needs to update one DocumentReference Resource managed
in the File Manager.

Prior to sending the update, the File Source shall discover the id of
the existing DocumentReference Resource.

##### 2:3.89.4.1.2 Message Semantics

The File Source shall issue an HTTP request according to requirements
defined in HL7<sup>®</sup> FHIR<sup>®</sup> standard for “update”
interaction (<http://hl7.org/fhir/R4/http.html#update>).

The File Source shall use an HTTP PUT method to submit to the File
Manager a DocumentReference Resource. The DocumentReference Resource
conveys to the File Manager the update to a file’s metadata.

This message shall convey one DocumentReference Resource. The id of the
DocumentReference Resource shall be valued with the id of the
DocumentReference Resource to be updated; see [Resource Profile: NPFS DocumentReference](StructureDefinition-IHE.NPFS.DocumentReference.html) for
other constraints upon the DocumentReference Resource.

The File Source shall submit the DocumentReference Resource in either
XML format or JSON format. Values accepted for media-type of the request
message are defined in the [ITI TF-2: Appendix Z.6](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.6-populating-the-expected-response-format) (currently in the
Appendix Z on HL7 FHIR Trial Implementation Supplement).

###### 2:3.89.4.1.2.1 Update DocumentReference Request message example 

For an example of a Update DocumentReference Request see <a href="http://build.fhir.org/ig/IHE/ITI.NPFS/branches/master/DocumentReference-12345.html">Example DocumentReference: DocumentReference for Update</a>

##### 2:3.89.4.1.3 Expected Actions

The File Manager shall support all the media-type listed in [ITI TF-2: Appendix Z.6](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.6-populating-the-expected-response-format) (currently in the Appendix Z on HL7 FHIR Trial
Implementation Supplement).

On receipt of the DocumentReference Update Request, the File Manager
shall validate and update the existing resource and respond with one of
the HTTP codes defined in [Section 3.89.4.2.2 Message Semantics](ITI-89.html#2389422-message-semantics).

#### 2:3.89.4.2 Update DocumentReference Response Message

The File Manager returns a HTTP Status code appropriate to the
processing.

##### 2:3.89.4.2.1 Trigger Events

When the File Manager has updated the DocumentReference Resource, the
File Manager sends this message to the File Source acknowledging the
result of the update request.

##### 2:3.89.4.2.2 Message Semantics

When the File Manager has processed the request, it shall return an HTTP
response with an overall status code.

The File Manager returns a HTTP status code appropriate to the
processing, conforming to the transaction specification requirements as
specified in <https://www.hl7.org/fhir/R4/http.html#update>.

##### 2:3.89.4.2.3 Expected Actions

The File Source processes the results according to application-defined
rules.

#### 2:3.89.4.3 CapabilityStatement Resource

File Managers implementing this transaction shall provide a CapabilityStatement Resource as described in [ITI TF-2: Appendix Z.3](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.3-capabilitystatement-resource) indicating the transaction has been implemented. 
- Requirements CapabilityStatement for [File Consumer implementing Retrieve File](CapabilityStatement-IHE.NPFS.FileConsumerOption.html)
- Requirements CapabilityStatement for [File Manager](CapabilityStatement-IHE.NPFS.FileManager.html)

### 2:3.89.5 Security Considerations

See [NPFS Security Considerations](volume-1.html#1475-npfs-security-considerations).

The files are not Patient specific, but they may have other needs for security controls, such as business knowledge restrictions. Thus the use of Security may be applicable.
Actors involved in this transaction should be aware that even if the
Resources exchanged do not contain PHI or other private information,
updating those Resources could compromise patient care or have other
legal ramifications. For general security considerations, see [ITI TF-2: Appendix Z.8](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.8-mobile-security-considerations).

#### 2:3.89.5.1 Security Audit Considerations

The File Source when grouped with [ATNA](https://profiles.ihe.net/ITI/TF/Volume1/ch-9.html) Secure Node or Secure Application Actor shall be able to record a [Update DocumentReference Source Audit Event Log](StructureDefinition-IHE.NPFS.UpdateDocumentReference.Audit.Source.html).

The File Manager when grouped with [ATNA](https://profiles.ihe.net/ITI/TF/Volume1/ch-9.html) Secure Node or Secure Application Actor shall be able to record a [Update DocumentReference Manager Audit Event Log](StructureDefinition-IHE.NPFS.UpdateDocumentReference.Audit.Manager.html).
