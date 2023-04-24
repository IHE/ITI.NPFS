### 3.89.1 Scope

This transaction allows a File Source to update a DocumentReference
Resource previously submitted. The DocumentReference Resource represents
metadata for a file that is not associated with a patient.

The File Manager is not required to support FHIR resource versioning
(see <https://www.hl7.org/fhir/R4/http.html#history>).

### 3.89.2 Actor Roles

<div>
<table border="1" borderspacing="0"
    style="border: 1px solid black; border-collapse: collapse">
    <caption style="text-align:left">
        <b> Table 3.89.2-1: Actor Roles </b>
    </caption>
    <tbody>
        <tr>
            <td style="padding:3px"><b>Actor:</b></td>
            <td><a href="volume-1.html#47113-file-source">File Source</a></td>
        </tr>
       <tr>
            <td><b>Role:</b></td>
            <td>Sends an update to an existing DocumentReference Resource.</td>
        </tr>
        <tr>
            <td><b>Actor:</b></td>
            <td><a href="volume-1.html#47111-file-manager">File Manager</a></td>
        </tr>
        <tr>
            <td><b>Role:</b></td>
            <td>Updates and maintains DocumentReference Resources.</td>
        </tr>
    </tbody>
</table>
</div>
<br>

### 3.89.3 Referenced Standards

<table border="1" borderspacing="0"
    style="border: 1px solid black; border-collapse: collapse">
    <tbody>
        <tr>
            <td style="padding:3px">HL7 FHIR</td>
            <td><a href="http://hl7.org/fhir/R4/index.html">HL7 FHIR Release 4.0</a></td>
        </tr>
    </tbody>
</table>

### 3.89.4 Messages

<div>
{%include ITI-88-seq.svg%}
<p><b>Figure 3.89.4-1: Interaction Diagram</b></p>
</div>
<br clear="all">

#### 3.89.4.1 Update DocumentReference Request Message

The File Source uses this message to update a FHIR DocumentReference
Resource already stored on the File Manager.

##### 3.89.4.1.1 Trigger Events

The File Source needs to update one DocumentReference Resource managed
in the File Manager.

Prior to sending the update, the File Source shall discover the id of
the existing DocumentReference Resource.

##### 3.89.4.1.2 Message Semantics

The File Source shall issue an HTTP request according to requirements
defined in HL7<sup>®</sup> FHIR<sup>®</sup> standard for “update”
interaction (<http://hl7.org/fhir/R4/http.html#update>).

The File Source shall use an HTTP PUT method to submit to the File
Manager a DocumentReference Resource. The DocumentReference Resource
conveys to the File Manager the update to a file’s metadata.

This message shall convey one DocumentReference Resource. The id of the
DocumentReference Resource shall be valued with the id of the
DocumentReference Resource to be updated; see Table 3.87.4.1.2-1 for
other constraints upon the DocumentReference Resource.

The File Source shall submit the DocumentReference Resource in either
XML format or JSON format. Values accepted for media-type of the request
message are defined in the ITI TF-2x: Appendix Z.6 (currently in the
Appendix Z on HL7 FHIR Trial Implementation Supplement).

###### 3.89.4.1.2.1 Update DocumentReference Request message example 

<table style="width:70%; border:1px solid black">
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th style="padding:5px; font-weight:normal">{<br />
"resourceType": "DocumentReference",<br />
"id": "112345",<br />
"contained": [<br />
{<br />
"resourceType": "Organization",<br />
"id": "org1",<br />
"identifier": [{<br />
"system": "urn:oid:1.12.234.56",<br />
"value": "IHE Facility"<br />
}]<br />
}<br />
],<br />
"status": "current",<br />
"type": {"coding": [{<br />
"system": "urn:oid:1.3.6.1.4.1.19376.1.5.3.1.5.1",<br />
"code": "eReferral workflow"<br />
}]},<br />
"class": {"coding": [{<br />
"system": "urn:ihe:iti:npfs:2017:class-codes",<br />
"code": "WORKFLOW_DEFINITION"<br />
}]},<br />
"created": "2017-04-17T10:30:00",<br />
"indexed": "2017-04-17T11:00:00",<br />
"author": [{"reference": "#org1"}],<br />
"content": [{<br />
"attachment": {<br />
"contentType": "application/pdf",<br />
"language": "en-US",<br />
"url": "http://ihe-npfs.com/214",<br />
"size": "3456",<br />
"hash":
"07ae8b27c7596b3314601736f32d5f0ed17fc8c0e27a0475e8ea2d8b2c788436"<br />
},<br />
"format": [{"code": "application/pdf"}]<br />
}]<br />
}</th>
</tr>
</thead>
<tbody>
</tbody>
</table>

##### 3.89.4.1.3 Expected Actions

The File Manager shall support all the media-type listed in ITI TF-2x:
Appendix Z.6 (currently in the Appendix Z on HL7 FHIR Trial
Implementation Supplement).

On receipt of the DocumentReference Update Request, the File Manager
shall validate and update the existing resource and respond with one of
the HTTP codes defined in Section 3.89.4.2.2 Message Semantics.

#### 3.89.4.2 Update DocumentReference Response Message

The File Manager returns a HTTP Status code appropriate to the
processing.

##### 3.89.4.2.1 Trigger Events

When the File Manager has updated the DocumentReference Resource, the
File Manager sends this message to the File Source acknowledging the
result of the update request.

##### 3.89.4.2.2 Message Semantics

When the File Manager has processed the request, it shall return an HTTP
response with an overall status code.

The File Manager returns a HTTP status code appropriate to the
processing, conforming to the transaction specification requirements as
specified in <https://www.hl7.org/fhir/R4/http.html#update>.

##### 3.89.4.2.3 Expected Actions

The File Source processes the results according to application-defined
rules.

### 3.89.5 Security Considerations

Actors involved in this transaction should be aware that even if the
Resources exchanged do not contain PHI or other private information,
updating those Resources could compromise patient care or have other
legal ramifications. For general security considerations, see ITI TF-2x:
Appendix Z.8 (currently in the Appendix Z on HL7 FHIR Trial
Implementation Supplement).

#### 3.89.5.1 Security Audit Considerations

This transaction does not require the actor involved to send audit
messages to an Audit Record Repository because does not convey PHI.
However, the auditing of the update operation is suggested in order to
avoid malicious update of the metadata for files associated with the
care of the patient. The audit message for the Update DocumentReference
transaction shall comply with the structure defined in DICOM PS3.15
Annex A.5.1

