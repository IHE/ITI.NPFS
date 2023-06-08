
The Non-Patient File Sharing Profile defines how to enable sharing of
non-patient files such as clinical workflow definitions, domain
policies, and stylesheets. Those files can be created and consumed by
many different systems involved in a wide variety of data sharing
workflows.

The NPFS Profile describes a mechanism for sharing non-patient files; it
does not require that the actors be able to process the contents of the
files being shared.

The NPFS Profile specifies transactions for the sharing of files. Any
file type can be shared using this profile; however, specific guidance
is given for three types of files:

- Workflow Definitions: files which define the processing rules for a
  specific clinical/administrative workflow (see [ITI TF-1: 30.4.1.1 “XDW Workflow Architecture”](https://profiles.ihe.net/ITI/TF/Volume1/ch-30.html#30.4.1.1))

- Privacy Domain Policies: files which describe a specific privacy
  policy that applies to, or may be agreed to, by a patient (see [ITI TF-1: 19.2 “Creating Patient Privacy Policies”](https://profiles.ihe.net/ITI/TF/Volume1/ch-19.html#19.2))

- Stylesheets: structured documents that can be used by user-agents
  (e.g., Web Browsers) to render the content of an XML document.

Local policies may extend the types of files that are being shared using
NPFS and that can be classified using the metadata model described in
this profile.

## 47.1 NPFS Actors, Transactions, and Content Modules

This section defines the actors, transactions, and/or content modules in
this profile. General definitions of actors are given in the Technical
Frameworks General Introduction Appendix A at
<https://www.ihe.net/resources/technical_frameworks/#GenIntro>.

Figure 47.1-1 shows the actors directly involved in NPFS Profile and the
relevant transactions between them. If needed for context, other actors
that may be indirectly involved due to their participation in other
related profiles are shown in dotted lines. Actors which have a
mandatory grouping are shown in conjoined boxes.

<div style="text-align:center">
{%include actorDiagram.svg%}
<p><b>Figure 47.1-1: NPFS Actor Diagram</b></p>
</div>

### 47.1.1 Actor Descriptions and Actor Profile Requirements

Most requirements are documented in transactions (Volume 2) and Content
Modules (Volume 3). This section documents any additional requirements
on profile’s actors.

#### 47.1.1.1 File Manager

The File Manager stores files provided by the File Source and maintains
related metadata. The File Manager responds to search and retrieve
requests initiated by the File Consumer. The File Manager responds to
metadata update requests initiated by the File Source.

#### 47.1.1.2 File Consumer 

The File Consumer queries for file metadata meeting certain criteria,
and may retrieve selected files.

#### 47.1.1.3 File Source 

The File Source publishes and updates files produced by either the File
Source or by other systems. It is responsible for sending files and
related metadata to a File Manager. The File Source can send metadata
update requests to the File Manager.

## 47.2 NPFS Actor Options

Options that may be selected for each actor in this profile, if any, are
listed in Table 47.2-1. Dependencies between options when applicable are
specified in notes.

<div>
<table width="50%" border="1" borderspacing="0"
    style="border: 1px solid black; border-collapse: collapse">
    <caption>
        <b> Table 47.2-1: Not-patient File Sharing - Actors and Options </b>
    </caption>
    <thead>
        <tr>
            <th style="text-align:center">Actors</th>
            <th style="text-align:center">Option Name</th>
            <th style="text-align:center">Reference</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td style="padding-left:10px">File Manager</td>
            <td style="padding-left:10px">No options defined</td>
            <td style="padding-left:10px">--</td>
        </tr>
        <tr>
            <td style="padding-left:10px">File Consumer</td>
            <td style="padding-left:10px">File Retrieve</td>
            <td style="padding-left:10px">Section 47.2.1</td>
        </tr>
        <tr>
            <td style="padding-left:10px">File Source</td>
            <td style="padding-left:10px">Update File Metadata</td>
            <td style="padding-left:10px">Section 47.2.2</td>
        </tr>
    </tbody>
</table>
</div>
<br>

### 47.2.1 File Retrieve Option

The File Retrieve Option enables a File Consumer to retrieve a file
stored/managed by the File Manager.

A File Consumer that supports the File Retrieve Option shall support the
Retrieve File \[ITI-109\] transaction.

### 47.2.2 Update File Metadata Option

The Update File Metadata Option enables a File Source to update the
metadata of a file stored/managed by the File Manager.

A File Source that supports the Update File Metadata Option shall
support the Update DocumentReference \[ITI-89\] transaction.

## 47.3 NPFS Required Actor Groupings 

This profile does not mandate the grouping with other actors.

## 47.4 NPFS Overview

### 47.4.1 Concepts – distinguishing files from documents

The NPFS Profile uses the term “**file**” to mark a clear distinction
from the IHE Document Sharing profiles.

A “**file**” represents a collection of information stored on a computer
as one unit. For the purposes of this profile, a file is not
patient-related, as it does not contain patient health identifying
information. It may contain other sensitive information.

Other IHE profiles are used to share (using different sharing paradigms)
information related to patients. In IHE terminology, such
patient-specific content is a “**document**.”

### 47.4.2 Use Cases

#### 47.4.2.1 Use Case \#1: Manage Stylesheets

A technician creates a stylesheet to render the XML of
CDA<sup>®</sup>[^1] Laboratory Reports produced in all the Laboratory
Information System (LIS) involved in the Healthcare Information Exchange
(HIE). The technician wants to make the stylesheet available to all the
LISs involved in the HIE so that they can search for the stylesheet and
reference it as an XSL transformation of the Laboratory Report.

##### 47.4.2.1.1 Manage Stylesheets - Use Case Description

A Healthcare Organization desires to use a stylesheet for uniform
rendering of XML Laboratory Reports produced within the organization.
Mr. Black, a technician of the Healthcare Organization, creates the
stylesheet. Then Mr. Black uses his File Source to publish the
stylesheet file into a system that manages non-patient files (File
Manager) using the Submit File \[ITI-87\] transaction. Now the
stylesheet will be available to all the LISs involved in the
organization.

A Laboratory Information System, according to the HIE policy, should be
able to identify the stylesheet that can be used to render the CDA
document.

Mrs. White uses the LIS to retrieve a patient’s CDA R2 Lab Report
document from the HIE. The LIS also issues a query using the Search File
\[ITI-88\] transaction, to search for a stylesheet file published by the
HIE Organization, in order to discover the resource URL of the
stylesheet applicable to the Laboratory Reports. This URL is used to
reference it as an XSL transformation of the Laboratory Report.

##### 47.4.2.1.2 Stylesheet’s Management Process Flow

- The Health Information System acting as a File Source issues a Submit
  File \[ITI-87\] transaction to the File Manager to submit the
  stylesheet

- The LIS acting as a File Consumer issues a Search File \[ITI-88\]
  transaction to the File Manager, using the class parameter to search
  for stylesheets, and the author.identifier parameter to search for the
  organization that submitted the file. The query response contains the
  URL of the stylesheet, that will be retrieved using a Retrieve
  File \[ITI-109\] transaction.

<div>
{%include useCase1.svg%}
<p><b>Figure 47.4.2.1.2-1: Basic Process Flow in NPFS Profile for Stylesheets management</b></p>
</div>

#### 47.4.2.2 Use Case \#2: Replace Privacy Policies 

In this use case, the hospital’s privacy office creates files that
describe the Privacy Policies that the patient can agree to. When a
patient is admitted, the admitting nurse uses a NPFS File Consumer to
search the File Manager for the current Privacy Policy files available.

Then, when the patient selects a Privacy Policy, the nurse uses a Basic
Patient Privacy Consent (BPPC) Content Creator Actor (see [ITI TF-1: 19](https://profiles.ihe.net/ITI/TF/Volume1/ch-19.html#19))
to create the patient’s Privacy Policy Consent document for the patient.

##### 47.4.2.2.1 Replace Privacy Policies - Use Case Description

A hospital’s privacy office defines a set of Privacy Policies that a
patient can agree to. Mr. Blue, a hospital privacy office employee,
creates a Privacy Policy file using the HIS. Using a Submit File
\[ITI-87\] transaction, the application makes the file available to all
the systems involved in his organization.

Mrs. Black, a nurse of the Goodcare Hospital, wants to search for the
current valid Privacy Policy files that the admitting patient can agree
to. She uses a combined BPPC Content Creator and NPFS File Consumer to
issue a query, a Search File \[ITI-88\] transaction, to search for the
current valid Privacy Policy files and retrieve them. One of the
retrieved Privacy Policy files is used, by the BPPC Content Creator, to
create the Privacy Policy Consent document that the patient can read and
agree to.

Later, a legal health officer informs the Goodcare Hospital that one of
the Privacy Policies has changed. Mr. Blue searches to discover the
Privacy Policy file and its related metadata (including FHIR resource
ids). He thus needs to replace the Privacy Policy file and uses an HIS
to perform the Submit File \[ITI-87\] to replace the Privacy Policy by
submitting a new one (linked to the original file via a replacement
association, using the relatesTo parameter) and updating metadata for
the previous Privacy Policy, changing its status to “superseded”.

This use case is different than Use Case \#3 because here the original
Privacy Policy file needs to be preserved (i.e., it is not overwritten).

##### 47.4.2.2.2 Privacy Domain Policies Process Flow

- The Health Information System, acting as a File Source, issues a
  Submit File \[ITI-87\] (create) transaction to the File Manager to
  submit the original Privacy Policy file and metadata.

- The HIS, acting as a File Consumer, issues a Search File \[ITI-88\]
  transaction to the File Manager. The File Consumer uses the class
  parameter and the status parameter to search for the metadata (i.e.,
  DocumentReference Resources) for current Privacy Policy files. Once
  the DocumentReference Resource is found, the File Consumer issues a
  Retrieve File \[ITI-109\] transaction to the File Manager to
  retrieve the file.

- The HIS, acting as a File Source, issues a Submit File \[ITI-87\]
  (replace) transaction to the File Manager to submit the new Privacy
  Policy file and metadata, and update the metadata of the replaced file
  to “superseded” (deprecated). (The new DocumentReference Resource is
  linked to the previous one via a replacement relationship, using the
  relatesTo parameter; see <a href="http://build.fhir.org/ig/IHE/ITI.NPFS/branches/master/ITI-87.html#387432-message-semantics">ITI TF-2c: 3.87.4.3.2)

<div>
{%include useCase2.svg%}
<p><b>Figure 47.4.2.2.2-1: Basic Process Flow in NPFS Profile for Privacy Policies management</b></p>
</div>

##### 47.4.2.3.1 Manage change to Workflow Definitions - Use Case Description

An HIE decides to design the eReferral Process for all the participants
involved in that workflow. Mr. Smith, a technician at Goodcare Hospital,
records the process in a BPMN Workflow Definition file, and makes it
available using the Submit File \[ITI-87\] transaction.

Dr. Jones, a specialist, uses her HIS to query for the BPMN Workflow
Definition file produced by Goodcare Hospital related to eReferral
workflow, using a Search File \[ITI-88\] transaction. The previously
submitted Workflow Definition file is found and retrieved, and Dr. Jones
can identify the next steps in the eReferral process.

Later the HIE decides that the Workflow Definition file submitted is no
longer valid and wants to use a new Workflow Definition file, so it
updates the previous file using the Submit File \[ITI-87\] transaction.

This use case is different than Use Case \#2 because here the original
Workflow Definition file does not need to be preserved so it is, in
effect, overwritten.

##### 47.4.2.3.2 Workflow Definitions Process Flow

- The Health Information System acting as a File Source issues a Submit
  File \[ITI-87\] (create) transaction to the File Manager to submit the
  original Workflow Definition file.

- Later, to find the Workflow Definition in order to update it, the HIS
  acting as a File Consumer issues a Search File \[ITI-88\] transaction
  to the File Manage. The File Consumer uses the class parameter and the
  type parameter to search for Workflow Definitions related to eReferral
  workflow. Once the Document Reference Resource is found, the HIS
  issues a Retrieve File \[ITI-109\] transaction to the File Manager
  to retrieve it.

- The Health Information System, acting as a File Source, issues a
  Submit File \[ITI-87\] (update) to the File Manager to make available
  the newer Workflow Definition file and metadata (updating the previous
  resources on the File Manager).

<div>
{%include useCase3.svg%}
<p><b>Figure 47.4.2.3.2-1: Basic Process Flow in NPFS Profile for Workflow Definition Documents management</b></p>
</div>

#### 47.4.2.4 Use Case \#4: Update of file’s ownership 

A technician creates a stylesheet to render the XML documents produced
by document producers belonging to Hospital Hope. After some time, the
same stylesheet also needs to be made accessible to Hospital Peace. In
order to accomplish this task, the technician updates metadata that
describe the file in order to extend the ownership also to Hospital
Peace.

##### 47.4.2.4.1 Update of file’s ownership - Use Case Description

Hospital Hope desires uniform rendering of XML documents produced within
the organization, so it creates a stylesheet file. Mr. Black, a
technician of the Hospital Hope, creates the stylesheet. Then Mr. Black
uses his File Source to publish the stylesheet file into a system that
manages non-patient files (File Manager) using the Submit File
\[ITI-87\] transaction. Now the stylesheet will be available to document
producers belonging to Hospital Hope. According to the local policies,
the technician needs to extend the ownership of this file also to
Hospital Peace. In order to do that, Mr. Black executes an update of the
DocumentReference associated with the stylesheet using the Update
DocumentReference \[ITI-89\] transaction. Now the stylesheet’s
DocumentReference reflects the ownership of Hospital Hope and Hospital
Peace.

##### 47.4.2.4.2 Update of file’s ownership Process Flow

- The Health Information System acting as a File Source issues a Submit
  File \[ITI-87\] (create) transaction to the File Manager to submit the
  stylesheet

- The Health Information System acting as a File Source issues an Update
  DocumentReference \[ITI-89\] transaction to the File Manager to modify
  the DocumentReference.author list.

<div>
{%include useCase4.svg%}
<p><b>Figure 47.4.2.4.2-1: Basic Process Flow in NPFS Profile for Update of file’s ownership</b></p>
</div>

## 47.5 NPFS Security Considerations

Non-patient files do not contain Patient Health Information (PHI), but
they may contain other sensitive information such as physician reviews,
work schedules, etc. In addition, those files can be used in conjunction
with patient-related documents in order to satisfy clinical data
consuming/sharing workflows. The reader should know that mistakes will
be made, and these files may convey private information.

Although this profile does not require actors to audit the transactions
that exchange non-patient files, grouping with an ATNA Secure Node or
Secure Application is strongly encouraged in order to track file and
metadata creation and update.
For further considerations about Audit record refer to [BALP profile](https://profiles.ihe.net/ITI/BALP/).

User authentication/authorization represents another important factor to
consider in order to avoid malicious creation/updating of files.
Grouping NPFS actors with actors in the Internet User Authorization
(IUA) Profile enables deployments to mitigate these security issues.

## 47.6 NPFS Cross Profile Considerations

None.

