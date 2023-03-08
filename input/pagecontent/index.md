##  Introduction to this Supplement

<table style="border:1px solid #d0d7de">
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: center; padding: 6px 13px"><p style="font-weight: bold">Whenever possible, IHE profiles are based on established and
stable underlying standards. However, if an IHE domain determines that
an emerging standard has high likelihood of industry adoption, and the
standard offers significant benefits for the use cases it is attempting
to address, the domain may develop IHE profiles based on such a
standard. During Trial Implementation, the IHE domain will update and
republish the IHE profile as the underlying standard evolves.</p>
<p style="font-weight: bold">Product implementations and site deployments may need to be updated
in order for them to remain interoperable and conformant with an updated
IHE profile.</p>
<p style="font-weight: bold">This NPFS Profile is based on Release 4 of the emerging
HL7<sup>®</sup><a href="#fn1" class="footnote-ref" id="fnref1"
role="doc-noteref"><sup>1</sup></a> FHIR<sup>®</sup><a href="#fn2"
class="footnote-ref" id="fnref2" role="doc-noteref"><sup>2</sup></a>
standard. HL7 describes FHIR Change Management and Versioning at <a
href="https://www.hl7.org/fhir/versions.html">https://www.hl7.org/fhir/versions.html</a>.</p>
<p style="font-weight: bold">HL7 provides a rating of the maturity of FHIR content based on the
FHIR Maturity Model (FMM): level 0 (draft) through N (Normative). See <a
href="http://hl7.org/fhir/versions.html#maturity">http://hl7.org/fhir/versions.html#maturity</a>.</p>
<p style="font-weight: bold">The FMM levels for FHIR content used in this profile are:</p>
<table>
<colgroup>
<col style="width: 68%" />
<col style="width: 31%" />
</colgroup>
<thead>
<tr class="header">
<th style="border:1px solid #d0d7de">FHIR Resource Name</th>
<th style="border:1px solid #d0d7de">FMM Level</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="border:1px solid #d0d7de">DocumentReference</td>
<td style="border:1px solid #d0d7de">3</td>
</tr>
<tr class="even">
<td style="border:1px solid #d0d7de">Bundle</td>
<td style="border:1px solid #d0d7de">N</td>
</tr>
<tr class="odd">
<td style="border:1px solid #d0d7de">Binary</td>
<td style="border:1px solid #d0d7de">N</td>
</tr>
<tr class="even">
<td style="border:1px solid #d0d7de">OperationOutcome</td>
<td style="border:1px solid #d0d7de">N</td>
</tr>
</tbody>
</table></th>
</tr>
</thead>
<tbody>
</tbody>
</table>
<section id="footnotes" class="footnotes footnotes-end-of-document"
role="doc-endnotes">
<hr />
<ol>
<li id="fn1"><p>HL7 is the registered trademark of Health Level Seven
International.<a href="#fnref1" class="footnote-back"
role="doc-backlink">↩︎</a></p></li>
<li id="fn2"><p>FHIR is the registered trademark of Health Level Seven
International.<a href="#fnref2" class="footnote-back"
role="doc-backlink">↩︎</a></p></li>
</ol>
</section>


This profile defines how to enable the sharing of non-patient files.

Those files can be created, consumed and updated by many different
systems involved in a wide variety of data sharing workflows (clinical
workflow definition, domain policies sharing, stylesheets management,
etc.). This profile identifies three actors: File Manager, File
Consumer, and File Source. To fulfill use-case requirements, this
profile defines three new transactions (Submit File \[ITI-87\], Search
File \[ITI-88\], and Update DocumentReference \[ITI-89\]) and re-uses an
MHD transaction: Retrieve Document \[ITI-68\].

There are IHE profiles that define the content of files that are not
patient-related; this profile does not require that the actors be able
to process the contents of the files being shared. Understanding this
profile does not require the knowledge of the files shared.

The NPFS Profile specifies transactions for the sharing of files. Any
file type can be shared using this profile; however, specific guidance
is given for three types of files:

- Workflow Definitions: files which define the processing rules for a
  specific clinical/administrative workflow (see ITI TF-1: 30.4.1.1 “XDW
  Workflow Architecture” for additional information).

- Privacy Domain Policies: files which describe a specific privacy
  policy that applies to, or may be agreed by the patient (see ITI TF-1:
  19.2 “Creating Patient Privacy Policies” for further details).

- Stylesheets: structured documents used by user-agents (e.g., Web
  Browsers) to render the content of an XML document.

Local policies may extend the types of files shared using NPFS and that
can be classified using the metadata model described in this profile.

<div markdown="1" class="stu-note">

| [Open and Closed Issues](issues.html) |
{: .grid}

</div>

### Organization of This Guide
This guide is organized into the following sections:

1. Volume 1:
   1. [Introduction](volume-1.html)
   1. [Actors, Transactions, and Content](volume-1.html#471-npfs-actors-transactions-and-content-modules)
   1. [Actor Options](volume-1.html#472-npfs-actor-options)
   1. [Actor Required Groupings](volume-1.html#473-npfs-required-actor-groupings)
   1. [Overview](volume-1.html#474-npfs-overview)
   1. [Security Considerations](volume-1.html#475-npfs-security-considerations)
   1. [Cross Profile Considerations](volume-1.html#476-npfs-cross-profile-considerations)
2. Volume 2: Transaction Detail
   1. [Submit File \[ITI-87\]](ITI-87.html)
   1. [Search File \[ITI-88\]](ITI-88.html)
   1. [Update DocumentReference \[ITI-89\]](ITI-89.html)
   1. [Retrieve Document [ITI-68]](ITI-68.html)
6. Other
   1. [Test Plan](testplan.html)
   1. [Changes to Other IHE Specifications](other.html)
   1. [Download and Analysis](download.html) 

See also the [Table of Contents](toc.html) and the index of [Artifacts](artifacts.html) defined as part of this implementation guide.

### Conformance Expectations

IHE uses the normative words: Shall, Should, and May according to [standards conventions](https://profiles.ihe.net/GeneralIntro/ch-E.html).

#### Must Support

The use of ```mustSupport``` in StructureDefinition profiles equivalent to the IHE use of **R2** as defined in [Appendix Z](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.10-profiling-conventions-for-constraints-on-fhir).

mustSupport of true - only has a meaning on items that are minimal cardinality of zero (0), and applies only to the source actor populating the data. The source actor shall populate the elements marked with MustSupport, if the concept is supported by the actor, a value exists, and security and consent rules permit. 
The consuming actors should handle these elements being populated or being absent/empty. 
Note that sometimes mustSupport will appear on elements with a minimal cardinality greater than zero (0), this is due to inheritance from a less constrained profile.
