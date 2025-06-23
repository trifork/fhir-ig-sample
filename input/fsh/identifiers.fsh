Profile: UID
Parent: Identifier
Id: UID
Title: "UID Identifier"
Description: "Unique IDentifier"
* ^status = #active
* ^experimental = false
* system 1..
* system = "http://example.org/uid" (exactly)
* value 1..
* extension contains PrefixExtension named prefix 1..1
* obeys UIDValueInvariant and UIDPrefixMatches

Invariant: UIDValueInvariant
Description: "Validation logic for the value element."
Severity: #error
Expression: "value.matches('^[A-z0-9]+:[a-z0-9\\\\.-]+$')"

Invariant: UIDPrefixMatches
Description: "The prefix (before the ':') must match the PrefixExtension value."
Severity: #error
Expression: "value.startsWith(%context.extension.where(url='http://example.org/StructureDefinition/Prefix').first().value & ':')"
