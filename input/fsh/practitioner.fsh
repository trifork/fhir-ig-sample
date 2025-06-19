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