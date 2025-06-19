Extension: PrefixExtension
Id: Prefix
Title: "Prefix"
Description: "Extension for Prefix in UID's"
Context: Identifier
* ^status = #active
* ^experimental = false
* valueString 1..1
* value[x] only string
* obeys PrefixInvariant

Invariant: PrefixInvariant
Description: "Validation logic for the prefix extension."
Severity: #error
Expression: "value.matches('^[A-z0-9]+$')"