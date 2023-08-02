### 2:3.88.1 Scope

The transaction is used by the File Consumer to find DocumentReference
Resources that are stored and managed by a File Manager. The
DocumentReference Resources represent files that are not associated with
patient.

### 2:3.88.2 Actor Roles

<table border="1" borderspacing="0"
    style="border: 1px solid black; border-collapse: collapse">
    <caption style="text-align:left">
        <b> Table 2:3.88.2-1: Actor Roles </b>
    </caption>
    <tbody>
        <tr>
            <td style="padding:3px"><b>Actor:</b></td>
            <td><a href="volume-1.html#147112-file-consumer">File Consumer</a></td>
        </tr>
       <tr>
            <td><b>Role:</b></td>
            <td>Searches for a list of DocumentReference Resources based on a set of search parameters</td>
        </tr>
        <tr>
            <td><b>Actor:</b></td>
            <td><a href="volume-1.html#147111-file-manager">File Manager</a></td>
        </tr>
        <tr>
            <td><b>Role:</b></td>
            <td>Returns a list of DocumentReference Resources that match the search parameters provided</td>
        </tr>
    </tbody>
</table>
<br>

### 2:3.88.3 Referenced Standards

<table border="1" borderspacing="0"
    style="border: 1px solid black; border-collapse: collapse">
    <tbody>
        <tr>
            <td style="padding:3px">HL7 FHIR</td>
            <td><a href="http://hl7.org/fhir/R4/index.html">HL7 FHIR Release 4.0</a></td>
        </tr>
    </tbody>
</table>


### 2:3.88.4 Messages

<div>
{%include ITI-88-seq.svg%}
<p><b>Figure 2:3.88.4-1: Search File Interactions</b></p>
</div>
<br clear="all">


#### 2:3.88.4.1 Search File Request Message

This message is a parametrized HTTP GET that allows a File Consumer to
search for a list of the FHIR DocumentReference Resources managed by the
File Manager, based on a set of search parameters.

##### 2:3.88.4.1.1 Trigger Events

A File Consumer sends this message to the File Manager when it needs to
discover DocumentReference Resources for non-patient-related files.

##### 2:3.88.4.1.2 Message Semantics

The File Consumer executes an HTTP GET against the File Manager. This
request shall comply with requirements specified in the HL7<sup>®</sup>
FHIR<sup>®</sup> standard <http://hl7.org/fhir/R4/http.html#search>.

The search target URL follows the FHIR HTTP specification, addressing
the DocumentReference Resource <http://hl7.org/fhir/R4/http.html>:

> \[base\]/DocumentReference?\[Parameters\]

The Parameters element represents a series of encoded name-value pairs
representing the filter for the query, as specified in [Section 3.88.4.1.2.1](ITI-88.html#23884121-query-search-parameters), as well as control parameters to modify the behavior of
the File Manager such as response format, or pagination.

###### 2:3.88.4.1.2.1 Query Search Parameters

The File Consumer may supply and the File Manager shall support all the
query parameters listed below:

- **identifier**

This parameter, of type token, allows the File Consumer to search on the
logical identifier of the resource.

- **\_id**

  This parameter, of type token, allows the File Consumer to search on
  the logical id assigned to the resource.

- **patient**

This parameter shall always be used in this transaction to find
resources that do not have the patient element valued. To achieve that,
this parameter shall be used with the exists modifier (e.g.,
patient:exists=false).

The File Consumer shall not use the query parameter **subject** with a
reference to a Patient Resource.

- **date**

This parameter, of type date, specifies the time when the file, to which
the DocumentReference refers, was submitted. The File Consumer shall use
the date and interval mechanism described in HL7 FHIR
(<http://hl7.org/fhir/R4/search.html#date>) to indicate a specific date,
or a date that lies within the range specified by the parameter.

- **author.identifier**

This parameter, of type token, specifies the identifier of the author
that has submitted the file. See [ITI TF-2: Appendix Z.2.2](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.2.2-token-parameters) (currently in
the Appendix Z on HL7 FHIR Trial Implementation Supplement) for use of
the token data type.

- **format**

This parameter, of type token, specifies the file’s format.

- **language**

This parameter, of type token, specifies the language of the file.

- **location**

This parameter, of type uri, specifies the URI where the file can be
found.

- **status**

This parameter, of type token, specifies the status of the file.

- **relatesto**

This parameter, of type reference, specifies one or more existing
DocumentReference Resources that have been replaced by the submitted
DocumentReference Resource.

- **relation**

This parameter, of type token**,** specifies the type of relation that
the file being searched has with the targeted file specified in the
relatesTo parameter, see
<http://hl7.org/fhir/R4/valueset-document-relationship-type.html> for
the type of relation allowed.

- **relationship**

This parameter, of type composite, is the combination of the
**relatesTo** and **relation** search parameter.

###### 2:3.88.4.1.2.2 Populating Expected Response Format

See [ITI TF-2: Appendix Z.6](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.6-populating-the-expected-response-format) (currently in the Appendix Z on HL7 FHIR
Trial Implementation Supplement) for details.

##### 2:3.88.4.1.3 Expected Actions

The File Manager shall process the query to discover DocumentReference
Resources that are not associated to any patient and that match the
search parameters. The File Manager shall send a Search File Response
message containing matching results.

The File Manager may return DocumentReference Resources that are not
constrained as specified in [Resource Profile: NPFS DocumentReference](StructureDefinition-IHE.NPFS.DocumentReference.html).

#### 2:3.88.4.2 Search File Response Message

The File Manager returns a HTTP Status code appropriate to the
processing as well as a list of the matching DocumentReference
Resources.

##### 2:3.88.4.2.1 Trigger Events

The File Manager has completed the processing of the Search File Request
message.

##### 2:3.88.4.2.2 Message Semantics

Based on the query results, the File Manager shall either return an
error or success.

Guidance on handling Access Denied related to use of 200, 403 and 404
can be found in [ITI TF- 2: Appendix Z.7](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.7-guidance-on-access-denied-results) (currently in the Appendix Z on
HL7 FHIR Trial Implementation Supplement).

When the File Manager needs to report an error, it shall use HTTP error
response codes and should include a FHIR OperationOutcome with more
details on the failure. See FHIR <http://hl7.org/fhir/R4/http.html> and
<http://hl7.org/fhir/R4/operationoutcome.html>.

If the Search File Request message is processed successfully, whether or
not any matching DocumentReference Resources are found, the HTTP status
code shall be 200. The Search File Response message shall be a Bundle
Resource containing zero or more DocumentReference Resources. If the
File Manager is responding with warnings, the Bundle Resource shall also
contain an OperationOutcome Resource that contains those warnings.

The response shall adhere to the FHIR Bundle constraints specified in
[ITI TF-2: Appendix Z.1](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.1-resource-bundles) (currently in the Appendix Z on HL7 FHIR Trial
Implementation Supplement).

##### 2:3.88.4.2.3 Expected Actions

The File Consumer shall process the results according to
application-defined rules.

If a File Consumer cannot automatically recover from an error condition,
it should, at a minimum, display the error to the user.

#### 2:3.88.4.3 CapabilityStatement Resource

File Managers implementing this transaction shall provide a CapabilityStatement Resource as described in [ITI TF-2: Appendix Z.3](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.3-capabilitystatement-resource) indicating the transaction has been implemented. 
- Requirements CapabilityStatement for [File Consumer](CapabilityStatement-IHE.NPFS.FileConsumer.html)
- Requirements CapabilityStatement for [File Consumer implementing Retrieve File](CapabilityStatement-IHE.NPFS.FileConsumerOption.html)
- Requirements CapabilityStatement for [File Manager](CapabilityStatement-IHE.NPFS.FileManager.html)

### 2:3.88.5 Security Considerations

See [NPFS Security Considerations](volume-1.html#1475-npfs-security-considerations).

The files are not Patient specific, but they may have other needs for security controls, such as business knowledge restrictions. Thus the use of Security may be applicable.
Actors involved in this transaction should be aware that even if the
Resources exchanged do not contain PHI or other private information,
exchange of those Resources could compromise patient care or have other
legal ramifications. For general security considerations, see [ITI TF-2: Appendix Z.8](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.8-mobile-security-considerations).

#### 2:3.88.5.1 Security Audit Considerations

The File Consumer when grouped with [ATNA](https://profiles.ihe.net/ITI/TF/Volume1/ch-9.html) Secure Node or Secure Application Actor shall be able to record a [Search File Consumer Audit Event Log](StructureDefinition-IHE.NPFS.SearchFile.Audit.Consumer.html).

The File Manager when grouped with [ATNA](https://profiles.ihe.net/ITI/TF/Volume1/ch-9.html) Secure Node or Secure Application Actor shall be able to record a [Search File Manager Audit Event Log](StructureDefinition-IHE.NPFS.SearchFile.Audit.Manager.html).
