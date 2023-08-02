<div markdown="1" class="stu-note">

This Test Plan page is a prototype. We expect the maturity of the content will improve over time.  For now, we summarize high level testing scope and available tools. Comments are welcome.
</div>

## Introduction

NPFS is an API between three actors. The transactions between actors specify semantics of the data exchanged. The NPFS test plan focuses on these semantics and on the expected actions on the actors (File Manager, File Source and File Consumer).

Specific capabilities that different systems are expected to have are defined into CapabilityStatement resources.

## High-level Test Scope

### Submit File [ITI-87] 

- File Source publishes non-patient file
- File Manager receives and responds as appropriate 

### Search File [ITI-88] 

- File Consumer requests query for DocumentReference
- File Manager responds to query as appropriate

### Options

### Update DocumentReference [ITI-89] 

- File Source publishes an updated DocumentReference resource
- File Manager receives and responds as appropriate

### Retrieve File [ITI-109] 

- File Consumer requests query for retrieve file
- File Manager retrieve as appropriate
<div><br></div>

## Unit Test Procedure

Unit Tests in this context is where a SUT is tested against a simulator or validator.  A simulator is a implementation of an actor that is designed specifically to test the opposite pair actor. The simulator might be a reference implementation or may be a specially designed test-bench. Where a reference implementation is used the negative tests are harder to simulate. A validator is a implementation that can check conformance. A validator may be a simulator, but may also be a standalone tool used to validate only a message encoding. Some reference implementations may be able to validate to a StructureDefinition profile, but often these do not include sufficient constraints given the overall actor conformance criteria. 

## Integration Test Procedure

Integration Testing in this context is where two SUT of paired actors test against each other. Integration testing is often limited by the capability of the client (Document Source or Document Consumer), which may support only a subset of the semantics required to be supported by the server (Document Recipient or Document Responder). Full message semantics and failure-modes are more thoroughly exercised with unit (conformance) tests.

The tests listed below are defined in [Gazelle Master Model](https://gazelle.ihe.net/GMM) and are performed by systems testing NPFS at IHE Connectathons.

<div markdown="1" class="stu-note">
In the Gazelle platform, there are tests with reference to ITI-68 pending the replacement with ITI-109 that occurred during the conversion of the NPFS profile to IG.
</div>

### File Source --> File Manager Interoperability Tests

- NPFSm_15_Resource_Check_EVS
- NPFSm_20_Create_Upd_File_JSON
- NPFSm_21_Update_Metadata_ITI-89
- NPFSm_20_Create_Upd_File_XML

### File Consumer --> File Manager Interoperability Tests

- NPFSm_31_Read_XML_ITI-68
- NPFSm_31_Read_JSON_ITI-68
- NPFSm_30_Search_XML_ITI-88
- NPFSm_30_Search_JSON_ITI-88


