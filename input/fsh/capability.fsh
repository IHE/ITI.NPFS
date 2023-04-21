Instance: IHE.NPFS.FileConsumer
InstanceOf: CapabilityStatement
Title: "File Consumer (client)"
Usage: #definition
* description = "IHE ITI Non-patient File Sharing (NPFS) - File Consumer (client)"
* url = "https://profiles.ihe.net/ITI/NPFS/CapabilityStatement/IHE.NPFS.FileConsumer"
* name = "IHE_NPFS_FileConsumer"
* title = "File Consumer (client)"
* status = #active
* experimental = false
* date = "2022-10-27"
* kind = #requirements
* fhirVersion = #4.0.1
* format[+] = #application/fhir+xml
* format[+] = #application/fhir+json
* rest
  * mode = #client
  * documentation = "CapabilityStatement for File Consumer"
  * security
    * description = "Recommend [ATNA](https://profiles.ihe.net/ITI/TF/Volume1/ch-9.html), encouraged [IHE-IUA](https://profiles.ihe.net/ITI/IUA/index.html) or [SMART-app-launch](http://www.hl7.org/fhir/smart-app-launch/)"
  * resource[+]
    * type = #DocumentReference
    * profile = "https://profiles.ihe.net/ITI/NPFS/StructureDefinition/IHE.NPFS.DocumentReference"
    * interaction[+].code = #read
    * interaction[+].code = #search-type
    * searchParam[+]
      * name = "_id"
      * type = #token
      * documentation = "Logical id of this artifact"
    * searchParam[+]
      * name = "identifier"
      * type = #token
      * documentation = "Logical identifier of this artifact"
    * searchParam[+]
      * name = "patient:exists"
      * type = #token
      * documentation = "This parameter shall always be used in this transaction to find resources that do not have the patient element valued"
    * searchParam[+]
      * name = "date"
      * type = #date
      * documentation = "when the file, to which the DocumentReference refers, was submitted"
    * searchParam[+]
      * name = "author.identifier"
      * type = #token
      * documentation = "The author that has submitted the file"
    * searchParam[+]
      * name = "format"
      * type = #token
      * documentation = "File's format"
    * searchParam[+]
      * name = "language"
      * type = #token
      * documentation = "The language of the file"
    * searchParam[+]
      * name = "location"
      * type = #uri
      * documentation = "Where the file can be found"
    * searchParam[+]
      * name = "status"
      * type = #token
      * documentation = "The status of the file"
    * searchParam[+]
      * name = "relatesto"
      * type = #reference
      * documentation = "One or more existing DocumentReference Resources that have been replaced by the submitted DocumentReference Resource"
    * searchParam[+]
      * name = "relation"
      * type = #token
      * documentation = "The type of relation that the file being searched has with the targeted file specified in the relatesTo parameter"
    * searchParam[+]
      * name = "relationship"
      * type = #composite
      * documentation = "The combination of the relatesTo and relation search parameter."
  * interaction.code = #search-system


Instance: IHE.NPFS.FileConsumerOption
InstanceOf: CapabilityStatement
Title: "File Consumer (client) implementing Retrieve Document"
Usage: #definition
* description = "IHE ITI Non-patient File Sharing (NPFS) - File Consumer (client) - with ITI-68 Retrieve Document"
* url = "https://profiles.ihe.net/ITI/NPFS/CapabilityStatement/IHE.NPFS.FileConsumerOption"
* name = "IHE_NPFS_FileConsumerOption"
* title = "File Consumer (client) implementing Retrieve Document"
* status = #active
* experimental = false
* date = "2022-10-27"
* kind = #requirements
* fhirVersion = #4.0.1
* format[+] = #application/fhir+xml
* format[+] = #application/fhir+json
* rest
  * mode = #client
  * documentation = "CapabilityStatement for File Consumer implementing Retrieve Document"
  * security
    * description = "Recommend [ATNA](https://profiles.ihe.net/ITI/TF/Volume1/ch-9.html), encouraged [IHE-IUA](https://profiles.ihe.net/ITI/IUA/index.html) or [SMART-app-launch](http://www.hl7.org/fhir/smart-app-launch/)"
  * resource[+]
    * type = #DocumentReference
    * profile = "https://profiles.ihe.net/ITI/NPFS/StructureDefinition/IHE.NPFS.DocumentReference"
    * interaction[+].code = #read
    * interaction[+].code = #search-type
    * searchParam[+]
      * name = "_id"
      * type = #token
      * documentation = "Logical id of this artifact"
    * searchParam[+]
      * name = "identifier"
      * type = #token
      * documentation = "Logical identifier of this artifact"
    * searchParam[+]
      * name = "patient"
      * type = #token
      * documentation = "This parameter shall always be used in this transaction to find resources that do not have the patient element valued, e.g., patient:missing=true"
    * searchParam[+]
      * name = "date"
      * type = #date
      * documentation = "when the file, to which the DocumentReference refers, was submitted"
    * searchParam[+]
      * name = "author.identifier"
      * type = #token
      * documentation = "The author that has submitted the file"
    * searchParam[+]
      * name = "format"
      * type = #token
      * documentation = "File's format"
    * searchParam[+]
      * name = "language"
      * type = #token
      * documentation = "The language of the file"
    * searchParam[+]
      * name = "location"
      * type = #uri
      * documentation = "Where the file can be found"
    * searchParam[+]
      * name = "status"
      * type = #token
      * documentation = "The status of the file"
    * searchParam[+]
      * name = "relatesto"
      * type = #reference
      * documentation = "One or more existing DocumentReference Resources that have been replaced by the submitted DocumentReference Resource"
    * searchParam[+]
      * name = "relation"
      * type = #token
      * documentation = "The type of relation that the file being searched has with the targeted file specified in the relatesTo parameter"
    * searchParam[+]
      * name = "relationship"
      * type = #composite
      * documentation = "The combination of the relatesTo and relation search parameter."
  * resource[+]
    * type = #Binary
    * interaction[+].code = #read
  * interaction.code = #search-system

Instance: IHE.NPFS.FileSource
InstanceOf: CapabilityStatement
Title: "File Source (client)"
Usage: #definition
* description = "IHE ITI Non-patient File Sharing (NPFS) - File Source (client)"
* url = "https://profiles.ihe.net/ITI/NPFS/CapabilityStatement/IHE.NPFS.FileSource"
* name = "IHE_NPFS_FileSource"
* title = "File Source (client)"
* status = #active
* experimental = false
* date = "2022-10-27"
* kind = #requirements
* fhirVersion = #4.0.1
* format[+] = #application/fhir+xml
* format[+] = #application/fhir+json
* rest
  * mode = #client
  * documentation = "CapabilityStatement for File Source"
  * security
    * description = "Recommend [ATNA](https://profiles.ihe.net/ITI/TF/Volume1/ch-9.html), encouraged [IHE-IUA](https://profiles.ihe.net/ITI/IUA/index.html) or [SMART-app-launch](http://www.hl7.org/fhir/smart-app-launch/)"
  * interaction[+]
    * code = #transaction
    * documentation = "https://profiles.ihe.net/ITI/NPFS/StructureDefinition/IHE.NPFS.CreateDocumentBundle"
  * interaction[+]
    * code = #transaction
    * documentation = "https://profiles.ihe.net/ITI/NPFS/StructureDefinition/IHE.NPFS.UpdateDocumentBundle"
  * interaction[+]
    * code = #transaction
    * documentation = "https://profiles.ihe.net/ITI/NPFS/StructureDefinition/IHE.NPFS.ReplaceDocumentBundle"

Instance: IHE.NPFS.FileSourceOption
InstanceOf: CapabilityStatement
Title: "File Source (client) implementing Update DocumentReference "
Usage: #definition
* description = "IHE ITI Non-patient File Sharing (NPFS) - File Source (client) - with ITI-89 Update DocumentReference"
* url = "https://profiles.ihe.net/ITI/NPFS/CapabilityStatement/IHE.NPFS.FileSourceOption"
* name = "IHE_NPFS_FileSource"
* title = "File Source (client) implementing Update DocumentReference "
* status = #active
* experimental = false
* date = "2022-10-27"
* kind = #requirements
* fhirVersion = #4.0.1
* format[+] = #application/fhir+xml
* format[+] = #application/fhir+json
* rest
  * mode = #client
  * documentation = "CapabilityStatement for File Source implementing Update DocumentReference "
  * security
    * description = "Recommend [ATNA](https://profiles.ihe.net/ITI/TF/Volume1/ch-9.html), encouraged [IHE-IUA](https://profiles.ihe.net/ITI/IUA/index.html) or [SMART-app-launch](http://www.hl7.org/fhir/smart-app-launch/)"
  * interaction[+]
    * code = #transaction
    * documentation = "https://profiles.ihe.net/ITI/NPFS/StructureDefinition/IHE.NPFS.CreateDocumentBundle"
  * interaction[+]
    * code = #transaction
    * documentation = "https://profiles.ihe.net/ITI/NPFS/StructureDefinition/IHE.NPFS.UpdateDocumentBundle"
  * interaction[+]
    * code = #transaction
    * documentation = "https://profiles.ihe.net/ITI/NPFS/StructureDefinition/IHE.NPFS.ReplaceDocumentBundle"
  * resource[+]
    * type = #DocumentReference
    * profile = "https://profiles.ihe.net/ITI/NPFS/StructureDefinition/IHE.NPFS.DocumentReference"
    * interaction[+]
      * code = #update

Instance: IHE.NPFS.FileManager
InstanceOf: CapabilityStatement
Title: "File Manager (server)"
Usage: #definition
* description = "IHE ITI Non-patient File Sharing (NPFS) - File Manager (server)"
* url = "https://profiles.ihe.net/ITI/NPFS/CapabilityStatement/IHE.NPFS.FileManager"
* name = "IHE_NPFS_FileManager"
* title = "File Manager (server)"
* status = #active
* experimental = false
* date = "2022-10-27"
* kind = #requirements
* fhirVersion = #4.0.1
* format[+] = #application/fhir+xml
* format[+] = #application/fhir+json
* rest
  * mode = #server
  * documentation = "CapabilityStatement for File Manager"
  * security
    * description = "Recommend [ATNA](https://profiles.ihe.net/ITI/TF/Volume1/ch-9.html), encouraged [IHE-IUA](https://profiles.ihe.net/ITI/IUA/index.html) or [SMART-app-launch](http://www.hl7.org/fhir/smart-app-launch/)"
  * resource[+]
    * type = #DocumentReference
    * profile = "https://profiles.ihe.net/ITI/NPFS/StructureDefinition/IHE.NPFS.DocumentReference"
    * interaction[+].code = #read
    * interaction[+].code = #search-type
    * interaction[+].code = #update
    * interaction[+].code = #create
    * searchParam[+]
      * name = "_id"
      * type = #token
      * documentation = "Logical id of this artifact"
    * searchParam[+]
      * name = "identifier"
      * type = #token
      * documentation = "Logical identifier of this artifact"
    * searchParam[+]
      * name = "patient:exists"
      * type = #token
      * documentation = "This parameter shall always be used in this transaction to find resources that do not have the patient element valued"
    * searchParam[+]
      * name = "date"
      * type = #date
      * documentation = "when the file, to which the DocumentReference refers, was submitted"
    * searchParam[+]
      * name = "author.identifier"
      * type = #token
      * documentation = "The author that has submitted the file"
    * searchParam[+]
      * name = "format"
      * type = #token
      * documentation = "File's format"
    * searchParam[+]
      * name = "language"
      * type = #token
      * documentation = "The language of the file"
    * searchParam[+]
      * name = "location"
      * type = #uri
      * documentation = "Where the file can be found"
    * searchParam[+]
      * name = "status"
      * type = #token
      * documentation = "The status of the file"
    * searchParam[+]
      * name = "relatesto"
      * type = #reference
      * documentation = "One or more existing DocumentReference Resources that have been replaced by the submitted DocumentReference Resource"
    * searchParam[+]
      * name = "relation"
      * type = #token
      * documentation = "The type of relation that the file being searched has with the targeted file specified in the relatesTo parameter"
    * searchParam[+]
      * name = "relationship"
      * type = #composite
      * documentation = "The combination of the relatesTo and relation search parameter."
  * resource[+]
    * type = #Binary
    * interaction[+].code = #read
  * interaction[+]
    * code = #transaction
    * documentation = "https://profiles.ihe.net/ITI/NPFS/StructureDefinition/IHE.NPFS.FileSource"
  * interaction[+]
    * code = #search-system
/*
Instance: IHE.ToDo.server
InstanceOf: CapabilityStatement
Title: "ToDo Server Actor"
Usage: #definition
* description = """
CapabilityStatement for Server Actor.

Explain
- blah
- blah
"""
* url = "https://profiles.ihe.net/Domain/Profile/CapabilityStatement/IHE.ToDo.server"
* name = "IHE_ToDo_supplier"
* title = "IHE ToDo Server"
* status = #active
* experimental = false
* date = "2022-10-27"
* kind = #requirements
* fhirVersion = #4.0.1
* format[+] = #application/fhir+xml
* format[+] = #application/fhir+json
* rest
  * mode = #server
  * documentation = "ToDo Client provides capability to blah blah."
  * security
    * description = "Recommend [ATNA](https://profiles.ihe.net/ITI/TF/Volume1/ch-9.html), encouraged [IHE-IUA](https://profiles.ihe.net/ITI/IUA/index.html) or [SMART-app-launch](http://www.hl7.org/fhir/smart-app-launch/)"
  * resource[+]
    * type = #Patient
    * documentation = """
ToDo transaction [ITI-00]
"""
    * interaction[+].code = #read
    * interaction[+].code = #search-type
    * searchParam[+]
      * name = "_lastUpdated"
      * type = #date
      * documentation = "When the resource version last changed"
    * searchParam[+]
      * name = "_id"
      * type = #token
      * documentation = "Logical id of this artifact"
    * searchParam[+]
      * name = "active"
      * type = #token
      * documentation = "Whether the patient record is active"
    * searchParam[+]
      * name = "family"
      * type = #string
      * documentation = "A portion of the family name of the patient"
    * searchParam[+]
      * name = "given"
      * type = #string
      * documentation = "A portion of the given name of the patient"
    * searchParam[+]
      * name = "identifier"
      * type = #token
      * documentation = "A patient identifier"
    * searchParam[+]
      * name = "telecom"
      * type = #token
      * documentation = "The value in any kind of telecom details of the patient"
    * searchParam[+]
      * name = "birthdate"
      * type = #date
      * documentation = "The patient's date of birth"
    * searchParam[+]
      * name = "address-city"
      * type = #string
      * documentation = "A city specified in an address"
    * searchParam[+]
      * name = "address-country"
      * type = #string
      * documentation = "A country specified in an address"
    * searchParam[+]
      * name = "address-postalcode"
      * type = #string
      * documentation = "A postalCode specified in an address"
    * searchParam[+]
      * name = "address-state"
      * type = #string
      * documentation = "A state specified in an address"
    * searchParam[+]
      * name = "gender"
      * type = #token
      * documentation = "Gender of the patient"
    * searchParam[+]
      * name = "mothersMaidenName"
      * definition = "http://hl7.org/fhir/SearchParameter/patient-extensions-Patient-mothersMaidenName"
      * type = #string
      * documentation = "Mother's maiden (unmarried) name, commonly collected to help verify patient identity."
  * interaction.code = #search-system */

