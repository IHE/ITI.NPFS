## Significant Changes

### Significant changes from Revision 2.1 (PDF)

- Converted to an IG
- Replaced reference to MHD [ITI-68] Retrieve Document transaction width [ITI-109] Retrieve File transaction 
- Include CapabilityStatements for the actors

## Issues

### Submit an Issue

IHE welcomes [New Issues](https://github.com/IHE/ITI.NPFS/issues/new/choose) from the GitHub community. 
For those without GitHub access, issues may be submitted to the [Public Comment form](https://www.ihe.net/resources/public_comment/).

As issues are submitted they will be managed on the [NPFS GitHub Issues](https://github.com/IHE/ITI.NPFS/issues), where discussion and workarounds may be found. These issues, when critical, will be processed using the normal [IHE Change Proposal](https://wiki.ihe.net/index.php/Category:CPs) management and balloting. 
It is important to note that as soon as a Change Proposal is approved, it carries the same weight as a published Implementation Guide (i.e., it is testable at an [IHE Connectathon](https://www.ihe.net/participate/connectathon/) from the time it is approved, even if it will not be integrated until several months later).

### Open Issues

***[NPFS_010](https://github.com/IHE/ITI.NPFS/issues/5): This document begins the definition of a value set for the
class element. How do we complete the value set for this profile.
Suggestions are requested. How do we coordinate this value set with
other Document Sharing profiles? Suggestions are requested. ***

***[NPFS_012](https://github.com/IHE/ITI.NPFS/issues/6): This document does not require the use of profile tags to
identify compliant resources. Use of profile tags will also allow the
File Consumer to search just for resources that matches this profile in
a FHIR Server that store different types of resources. Readers are
required to provide feedback on this topic.***

### Closed Issues

***NPFS_001: This supplement does not define metadata elements identify
or classify targets for the publication of the file (e.g., intended
recipients or classes of recipients). Readers are asked to provide
feedback on whether this is needed. Should the profile cover the
requirements to identify targets with both identifiers and classes
(e.g., This “document is intended for user 12345,” or “this document is
intended for GPs.”)?***

- *We choose to not address this issue because the use of the
  context.related.ref could open the user to reference any type of
  resource also ones with patient information in it*

***NPFS_002: Confirm the scope, because as requests were received to
cover other documents, in particular, public health report. We are going
to draft three use-cases: Policy Documents, Workflow Definitions,
stylesheets.***

- *This supplement targets specific use cases selected as representative
  of wider classes of use. Feedback on non-patient document sharing uses
  not addressed through the supplement is requested.*

***NPFS_003: What are the metadata that can be used to classify those
files?***

- *ftp://ftp.ihe.net/IT_Infrastructure/iheitiyr15-2017-2018/Technical_Cmte/Workitems/Non-Patient%20Document%20Sharing%20(NPDS)/NPFS%20-%20Technical%20Needs.xlsx*

- *periodValidity metadata: Should it have mandatory start, but optional
  end elements?*

*This issue could be addressed valuating the context.period.start and
context.period.end element of the DocumentReference Resource.*

- *interestedPartiesIdentification metadata has to be a code or an
  identifier?*

This use-case has not been addressed. Check OI NPFS_001

- *Should we let the status metadata be modified by the File Manager
  such we had the most recent status in order to accomplish the release
  management?*

*The Update DocumentReference transaction has been added to fulfill this
issue*

***NPFS_004: How can I know if there is an updated version of the file
or my file is deprecated?***

- *Using a specific metadata, it is possible to search, through the
  replacement association, the latest version of the file. The status of
  the replaced file needs to be changed by the File Source with the
  Update DocumentReference transaction.*

***NPFS_005: FHIR STU3 doesn’t support the "mime-type" search parameter
for the DocumentReference Resource. How can we search for mime-types?***

- *The use-case for which this issue was opened no longer exists. So the
  File Consumer can search for the format of the file and that is
  sufficient.*

***NPFS_006: This version of NPFS supplement define three new actors and
three new transactions. Readers during PC period are asked to provide
feedback on this topic. and transaction names needs to be changed?***

*No particular feedback received during PC, so the committee decided to
maintain the names defined.*

***NPFS_007: We will follow the FHIR approach, should we align this
work-item with MHD? (Option in MHD…)***

- *Keep them separate for many reasons. Although we’ve decided to
  profile the Document Reference Resource, there are some different
  requirements. It is more safe to keep the two work-items separate for
  security requirements and decrease the implementation effort on server
  side.*

***NPFS_008: Is the word “document” the right one? Should we speak about
“Files”?***

- *This profile introduces the concept of “File” in order to mark a
  clear separation with DS\* profiles defined by IHE IT Infrastructure
  domain. A “File” represents a collection of information from the web
  that is stored on a computer as one unit under one specific name. IHE
  IT Infrastructure domain has already defined a suite of profiles aimed
  to share (using different sharing paradigms) documents related to
  patients, so another characteristic of a file (as it is described in
  this profile) is to be non-patient related.*

***NPFS_009: Should we address the Consume process as a fetch?***

- *This profile defines the usage of two distinct transaction to consume
  the file, because in one of our use-case the consumer could just be
  interested to retrieve DocumentReference Resource and not the file
  itself.*

***NPFS_011: Which is the right standard to use?***

- *For this profile, we had a standard selection process between several
  healthcare standards, such FHIR and infoButton, and non-healthcare
  standards such NPI storage and OData. The selection was made starting
  from which metadata shall be addressed by the standard and by IHE
  implementers efforts. The result of this selection was HL7 FHIR. See
  <ftp://ftp.ihe.net/IT_Infrastructure/iheitiyr15-2017-2018/Technical_Cmte/Workitems/Non-Patient%20Document%20Sharing%20(NPDS)/NPFS%20-%20Technical%20Needs.xlsx>.*