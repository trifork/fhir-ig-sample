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

RuleSet: AdditionalBinding(profile, elementPath, usagePath, usageCategory, valueSet, binding)
* {elementPath} ^binding.extension[+].url = $add-binding
* {elementPath} ^binding.extension[=].extension[0].url = "purpose"
* {elementPath} ^binding.extension[=].extension[=].valueCode = #{binding}
* {elementPath} ^binding.extension[=].extension[+].url = "valueSet"
* {elementPath} ^binding.extension[=].extension[=].valueCanonical = {valueSet}
* {elementPath} ^binding.extension[=].extension[+].url = "usage"
* {elementPath} ^binding.extension[=].extension[=].valueUsageContext.code.system = Canonical({profile})
* {elementPath} ^binding.extension[=].extension[=].valueUsageContext.code.code = #{usagePath}