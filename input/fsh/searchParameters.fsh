Instance: uid-prefix
InstanceOf: SearchParameter
Usage: #definition
* url = "http://example.org/SearchParameter/uid-prefix"
* name = "uid-prefix"
* status = #active
* description = "Search for practitioners or organizations by their UID prefix"
* purpose = "This search parameter is used to find practitioners or organizations based on their UID prefix, which is the first part of the UID identifier."
* code = #uid-prefix
* base[0] = #Practitioner
* type = #string
* expression = "identifier.where(system='http://example.org/uid').extension.where(url='http://example.org/StructureDefinition/Prefix').value"
