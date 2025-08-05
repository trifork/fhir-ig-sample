// This is a simple example of a FSH file.
// This file can be renamed, and additional FSH files can be added.
// SUSHI will look for definitions in any file using the .fsh ending.
Profile: MyPatient
Parent: Patient
Description: "An example profile of the Patient resource."
* name 1..* MS

Instance: PatientExample
InstanceOf: MyPatient
Description: "An example of a patient with a license to krill."
* name
  * given[0] = "James"
  * family = "Pond"

Profile: SomeGroup
Parent: Group


Extension: SomeGroupExtension
Context: SomeGroup
* ^status = #active
* ^experimental = false
* value[x] only Reference(MyPatient)

Extension: SomeExtension
Context: SomeGroupExtension
* ^status = #active
* ^experimental = false
* value[x] only string

Profile: ExampleSchedule
Parent: Schedule
Title: "Example Schedule"
Description: "Example base profile for Schedules."

* extension contains http://hl7.org/fhir/5.0/StructureDefinition/extension-Schedule.name named name 0..1

Instance: exampleSchedule
InstanceOf: ExampleSchedule
Usage: #example
* identifier.use = #usual
* identifier.system = "http://example.org/scheduleid"
* identifier.value = "45"
* active = true
* serviceCategory = #17 "General Practice"
* serviceType = #57 "Immunization"
* specialty = #408480009 "Clinical immunology"
* actor = Reference(Location/138803) "Burgers UMC, South Wing, second floor"
* planningHorizon.start = "2013-12-25T09:15:00Z"
* planningHorizon.end = "2013-12-25T09:30:00Z"
* comment = "The slots attached to this schedule should be specialized to cover immunizations within the clinic"
* extension.url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-Schedule.name"
* extension.valueString = "Example Name"

Profile: ExampleObservationDefinition
Title: "Example Observation Definition"
Parent: ObservationDefinition
Description: "Core Observation Definition for Observation Templates in the Example"
* code 1..
* permittedDataType 0..1
* extension contains
    http://hl7.org/fhir/5.0/StructureDefinition/extension-ObservationDefinition.title named title 0..1
     and
     http://hl7.org/fhir/5.0/StructureDefinition/extension-ObservationDefinition.component named component 0..
* modifierExtension contains
    http://hl7.org/fhir/5.0/StructureDefinition/extension-ObservationDefinition.status named status 0..1 ?!
* modifierExtension[http://hl7.org/fhir/5.0/StructureDefinition/extension-ObservationDefinition.status] ^isModifierReason = "Status change is modifying the meaning"

