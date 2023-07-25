## Significant Changes

### Significant changes from Revision 2.1 (PDF)

- Converted to an IG
- Replaced reference to MHD [ITI-68] Retrieve Document transaction width [ITI-109] Retrieve File transaction 
- Include CapabilityStatements for the actors
- Add defined AuditEvent requirements leveraging BALP when grouped with ATNA
- Integrated CP 1139

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

***[NPFS_013](https://github.com/IHE/ITI.NPFS/issues/8): DocumentReference.subject is set to 0..0; the .subject element may still be useful for subjects that are not patient.Practitioner -- this is individual, so I wonder if we really want NPFS to also be (non practitioner)?
Group -- groups can be made up of Patients. So it is not clear how we would allow Group, but not allow Groups of Patients.
Device -- often a Device is associated with a Patient, although many Devices are just Devices. Allowing Device might be the most clear use-case.
Seems we should have a positive use-case to drive deviation from 0..0. Suggestions are requested.
Note that in the future, using FHIR R5, subject can be a reference to ANY kind of Resource. This is just mentioned as foreshadowing, it should not be part of the current profile.***

### Closed Issues

None.