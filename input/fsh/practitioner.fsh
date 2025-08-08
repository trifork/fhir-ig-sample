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


* insert AdditionalBinding(SampleDocumentReference, category, DocumentReference.type, 734163000, http://fhir.ch/ig/ch-term/ValueSet/DocumentEntry.classCode, extensible)

* category ^requirements = "Code is required and must be selected from the bound value set."
* category ^binding.description = "Valueset to describe the actual problem experienced by the patient"

Alias: $add-binding = http://hl7.org/fhir/tools/StructureDefinition/additional-binding

// from https://github.com/HL7/fhir-sdoh-clinicalcare/blob/master/input/fsh/profiles/SDOHCCCondition.fsh#L120 and 
//https://github.com/HL7/fhir-sdoh-clinicalcare/blob/56de4b7eefbd12d0cec1eadfeeeadc65196bfb6b/input/fsh/aliases.fsh
// also see https://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/StructureDefinition-SDOHCC-Condition.html

RuleSet: AdditionalBinding(profile, elementPath, usagePath, usageCategory, valueSet, binding)
* {elementPath} ^binding.extension[+].url = $add-binding
* {elementPath} ^binding.extension[=].extension[0].url = "purpose"
* {elementPath} ^binding.extension[=].extension[=].valueCode = #{binding}
* {elementPath} ^binding.extension[=].extension[+].url = "valueSet"
* {elementPath} ^binding.extension[=].extension[=].valueCanonical = {valueSet}
* {elementPath} ^binding.extension[=].extension[+].url = "usage"
* {elementPath} ^binding.extension[=].extension[=].valueUsageContext.code.system = Canonical({profile})
* {elementPath} ^binding.extension[=].extension[=].valueUsageContext.code.code = #{usagePath}
//* {elementPath} ^binding.extension[=].extension[=].valueUsageContext.valueCodeableConcept = SDOHCCCodeSystemTemporaryCodes#{usageCategory} // This is not official display. Need to support display? "{profile} {usageCategory} ValueSet"
//* {elementPath} ^binding.extension[=].extension[=].valueUsageContext.valueCodeableConcept.text = "{usageCategory}"