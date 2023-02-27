This section corresponds to transaction Submit File [ITI-87] of the IHE Technical Framework. Transaction Submit File [ITI-87] is used by the File Source and File Manager Actors.

### Scope

This transaction allows a File Source to publish one or more new files and related metadata. It
also enables update of one or more existing files and metadata by publishing a new version.
This transaction uses the Create File Request message either when there is no prior file, or when the prior needs to be preserved.
This transaction uses the Update File Request message when there is a prior file that doesn’t
need to be preserved. The File Manager is not required to support FHIR resource versioning (see
https://www.hl7.org/fhir/R4/http.html#history).

### Actors Roles

<div align="center">
<img src="ITI87ActorRoles.png" width="40%">
<p><b>Figure: Use Case Diagram</b></p>
<br>
</div>

<div align="center">
<table width="80%" border="1" borderspacing="0"
    style="border: 1px solid black; border-collapse: collapse">
    <caption>
        <b> Table: Actor Roles </b>
    </caption>
    <tbody>
        <tr>
            <td style="padding:6px"><b>Actor:</b></td>
            <td><a href="volume-1.html#47111-file-source">File Source</a></td>
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

### Referenced Standards

**FHIR-R4** [HL7 FHIR Release 4.0](http://www.hl7.org/FHIR/R4)

### Interactions

<div>
{%include domain-Y-seq.svg%}
</div>
<br clear="all">

**Figure: Go Interactions**


#### go Query Message
This message uses the HTTP GET method on the target Server endpoint to convey the query parameters FHIR query.

##### Trigger Events

''TODO: define the triggers''

##### Message Semantics

''TODO: define the message -- usually with a StructureDefintion''

##### Expected Actions

''TODO: define expected actions''

#### Go Response Message

##### Trigger Events

''TODO: define the triggers''

##### Message Semantics

''TODO: define the message -- usually with a StructureDefintion''

##### Expected Actions

''TODO: define expected actions''


### CapabilityStatement Resource

Server implementing this transaction shall provide a CapabilityStatement Resource as described in ITI TF-2x: Appendix Z.3 indicating the transaction has been implemented. 
* Requirements CapabilityStatement for [Client](CapabilityStatement-IHE.ToDo.client.html)
* Requirements CapabilityStatement for [Server](CapabilityStatement-IHE.ToDo.server.html)

### Security Considerations

See [MHD Security Considerations](volume-1.html#security-considerations)

#### Security Audit Considerations

''TODO: The security audit criteria ''

##### Client Audit 

''TODO: the specifics''

##### Server Audit 

''TODO: the specifics''
