Profile: MyPractitioner
Parent: Practitioner
Title: "Practitioner"
* ^status = #active
* ^experimental = false
* identifier ^slicing.discriminator[0].type = #pattern
* identifier ^slicing.discriminator[0].path = "system"
* identifier ^slicing.rules = #open
* identifier contains 
    UID 1..1
* identifier[UID] only UID
* identifier[UID] ^short = "UID of the Practitioner"
* identifier[UID] ^patternIdentifier.system = "http://example.org/uid"

Instance: MyPractitionerInstance
InstanceOf: MyPractitioner
Usage: #example
Title: "MyPractitionerInstance"
Description: "Practitioner instance with a UID identifier and prefix extension."
* identifier[UID].value = "asdf:240622125003672"
* identifier[UID].extension[prefix].valueString = "asdf"

Profile: SampleDocumentReference
Parent: DocumentReference


* insert AdditionalBinding(SampleDocumentReference, type, DocumentReference.category, 371531000, VS_DocType_371531000, required)
//* insert AdditionalBinding(SampleDocumentReference, type, DocumentReference.category, 371531000, http://example.org/ValueSet/vs-doctype-371531000, required)
* insert AdditionalBinding(SampleDocumentReference, type, DocumentReference.category, 721927009, VS_DocType_721927009, required)
* insert AdditionalBinding(SampleDocumentReference, type, DocumentReference.category, 721963009, VS_DocType_721963009, required)
* insert AdditionalBinding(SampleDocumentReference, type, DocumentReference.category, 422735006, VS_DocType_422735006, required)
* insert AdditionalBinding(SampleDocumentReference, type, DocumentReference.category, 371525003, VS_DocType_371525003, required)
* insert AdditionalBinding(SampleDocumentReference, type, DocumentReference.category, 734163000, VS_DocType_734163000, required)
* insert AdditionalBinding(SampleDocumentReference, type, DocumentReference.category, 440545006, VS_DocType_440545006, required)
* insert AdditionalBinding(SampleDocumentReference, type, DocumentReference.category, 184216000, VS_DocType_184216000, required)
* insert AdditionalBinding(SampleDocumentReference, type, DocumentReference.category, 371537001, VS_DocType_371537001, required)
* insert AdditionalBinding(SampleDocumentReference, type, DocumentReference.category, 371538006, VS_DocType_371538006, required)
* insert AdditionalBinding(SampleDocumentReference, type, DocumentReference.category, 722160009, VS_DocType_722160009, required)
* insert AdditionalBinding(SampleDocumentReference, type, DocumentReference.category, 722216001, VS_DocType_722216001, required)
* insert AdditionalBinding(SampleDocumentReference, type, DocumentReference.category, 772790007, VS_DocType_772790007, required)
* insert AdditionalBinding(SampleDocumentReference, type, DocumentReference.category, 405624007, VS_DocType_405624007, required)
* insert AdditionalBinding(SampleDocumentReference, type, DocumentReference.category, 417319006, VS_DocType_417319006, required)
* insert AdditionalBinding(SampleDocumentReference, type, DocumentReference.category, 2171000195109, VS_DocType_2171000195109, required)
* insert AdditionalBinding(SampleDocumentReference, type, DocumentReference.category, 419891008, VS_DocType_419891008, required)


* category ^requirements = "Code is required and must be selected from the bound value set."
* category from http://fhir.ch/ig/ch-term/ValueSet/DocumentEntry.classCode
* category ^binding.description = "Valueset to describe the actual problem experienced by the patient"

Alias: $add-binding = http://hl7.org/fhir/tools/StructureDefinition/additional-binding

// from https://github.com/HL7/fhir-sdoh-clinicalcare/blob/master/input/fsh/profiles/SDOHCCCondition.fsh#L120 and 
//https://github.com/HL7/fhir-sdoh-clinicalcare/blob/56de4b7eefbd12d0cec1eadfeeeadc65196bfb6b/input/fsh/aliases.fsh
// also see https://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/StructureDefinition-SDOHCC-Condition.html

//https://build.fhir.org/ig/hl7ch/ch-term/ConceptMap-DocumentEntryClassCodeToDocumentEntryTypeCode.html
//https://build.fhir.org/ig/hl7ch/ch-term/ValueSet-DocumentEntry.classCode.html

RuleSet: AdditionalBinding(profile, elementPath, usagePath, usageCategory, valueSet, binding)
* {elementPath} ^binding.extension[+].url = $add-binding
* {elementPath} ^binding.extension[=].extension[0].url = "purpose"
* {elementPath} ^binding.extension[=].extension[=].valueCode = #{binding}
* {elementPath} ^binding.extension[=].extension[+].url = "valueSet"
* {elementPath} ^binding.extension[=].extension[=].valueCanonical = Canonical({valueSet})
* {elementPath} ^binding.extension[=].extension[+].url = "usage"
* {elementPath} ^binding.extension[=].extension[=].valueUsageContext.code.system = Canonical({profile})
* {elementPath} ^binding.extension[=].extension[=].valueUsageContext.code.code = #{usagePath}
* {elementPath} ^binding.extension[=].extension[=].valueUsageContext.valueCodeableConcept = $sct#{usageCategory} // This is not official display. Need to support display? "{profile} {usageCategory} ValueSet"
* {elementPath} ^binding.extension[=].extension[=].valueUsageContext.valueCodeableConcept.text = "{usageCategory}"


Alias: $sct = http://snomed.info/sct

// Group 1 — 371531000 Report of clinical encounter
ValueSet: VS_DocType_371531000
Id: vs-doctype-371531000
Title: "Targets for classCode 371531000 (Report of clinical encounter)"
* ^status = #active
* $sct#371530004
* $sct#371529009
* $sct#371532007
* $sct#419891008

// Group 2 — 721927009 Referral note
ValueSet: VS_DocType_721927009
Id: vs-doctype-721927009
Title: "Targets for classCode 721927009 (Referral note)"
* ^status = #active
* $sct#419891008

// Group 3 — 721963009 Order
ValueSet: VS_DocType_721963009
Id: vs-doctype-721963009
Title: "Targets for classCode 721963009 (Order)"
* ^status = #active
* $sct#721965002
* $sct#721966001
* $sct#2161000195103
* $sct#419891008

// Group 4 — 422735006 Summary clinical document
ValueSet: VS_DocType_422735006
Id: vs-doctype-422735006
Title: "Targets for classCode 422735006 (Summary clinical document)"
* ^status = #active
* $sct#373942005
* $sct#371535009
* $sct#721912009
* $sct#736378000
* $sct#419891008

// Group 5 — 371525003 Clinical procedure report
ValueSet: VS_DocType_371525003
Id: vs-doctype-371525003
Title: "Targets for classCode 371525003 (Clinical procedure report)"
* ^status = #active
* $sct#371526002
* $sct#4241000179101
* $sct#371528001
* $sct#4201000179104
* $sct#900000000000471006
* $sct#787148009
* $sct#419891008

// Group 6 — 734163000 Care plan
ValueSet: VS_DocType_734163000
Id: vs-doctype-734163000
Title: "Targets for classCode 734163000 (Care plan)"
* ^status = #active
* $sct#737427001
* $sct#773130005
* $sct#736055001
* $sct#761931002
* $sct#419891008

// Group 7 — 440545006 Prescription record
ValueSet: VS_DocType_440545006
Id: vs-doctype-440545006
Title: "Targets for classCode 440545006 (Prescription record)"
* ^status = #active
* $sct#761938008
* $sct#765492005
* $sct#419891008

// Group 8 — 184216000 Patient record type
ValueSet: VS_DocType_184216000
Id: vs-doctype-184216000
Title: "Targets for classCode 184216000 (Patient record type)"
* ^status = #active
* $sct#722446000
* $sct#41000179103
* $sct#419891008

// Group 9 — 371537001 Consent report
ValueSet: VS_DocType_371537001
Id: vs-doctype-371537001
Title: "Targets for classCode 371537001 (Consent report)"
* ^status = #active
* $sct#419891008

// Group 10 — 371538006 Advance directive report
ValueSet: VS_DocType_371538006
Id: vs-doctype-371538006
Title: "Targets for classCode 371538006 (Advance directive report)"
* ^status = #active
* $sct#419891008

// Group 11 — 722160009 Audit trail report
ValueSet: VS_DocType_722160009
Id: vs-doctype-722160009
Title: "Targets for classCode 722160009 (Audit trail report)"
* ^status = #active
* $sct#419891008

// Group 12 — 722216001 Emergency medical identification record
ValueSet: VS_DocType_722216001
Id: vs-doctype-722216001
Title: "Targets for classCode 722216001 (Emergency medical identification record)"
* ^status = #active
* $sct#419891008

// Group 13 — 772790007 Organ donor card
ValueSet: VS_DocType_772790007
Id: vs-doctype-772790007
Title: "Targets for classCode 772790007 (Organ donor card)"
* ^status = #active
* $sct#419891008

// Group 14 — 405624007 Administrative documentation
ValueSet: VS_DocType_405624007
Id: vs-doctype-405624007
Title: "Targets for classCode 405624007 (Administrative documentation)"
* ^status = #active
* $sct#772786005
* $sct#419891008

// Group 15/16 — 417319006 Record of health event
ValueSet: VS_DocType_417319006
Id: vs-doctype-417319006
Title: "Targets for classCode 417319006 (Record of health event)"
* ^status = #active
* $sct#445300006
* $sct#445418005
* $sct#82291000195104
* $sct#419891008

// Group 17 — 2171000195109 Obstetrical record
ValueSet: VS_DocType_2171000195109
Id: vs-doctype-2171000195109
Title: "Targets for classCode 2171000195109 (Obstetrical record)"
* ^status = #active
* $sct#419891008

// Group 18 — 419891008 Record artifact (self-map)
ValueSet: VS_DocType_419891008
Id: vs-doctype-419891008
Title: "Targets for classCode 419891008 (Record artifact)"
* ^status = #active
* $sct#419891008



Instance:   exDoc1
InstanceOf: SampleDocumentReference
* status = #current
* category = $sct#371531000
* type = $sct#371530004
* content.attachment.contentType = #text/plain
* content.attachment.url = "http://example.com/nowhere.txt"

Instance:   exDoc2-invalid
InstanceOf: SampleDocumentReference
* status = #current
* category = $sct#371531000
* type = $sct#721965002
* content.attachment.contentType = #text/plain
* content.attachment.url = "http://example.com/nowhere.txt"