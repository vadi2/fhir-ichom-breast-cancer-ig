// Primary Breast Cancer
Profile: PrimaryBreastCancerCondition
Parent: Condition 
Id: primary-breastcancer
Title: "Primary Breast Cancer Condition"
Description: "Represent the properties of the primary breast cancer diagnosis"
* insert PublicationProfileRuleset
* code = SCT#372137005 "Primary malignant neoplasm of breast"
* subject only Reference(BreastCancerPatient)
* bodySite from LateralityVS (preferred)
* subject and bodySite MS

Instance: PrimaryBreastCancerPatient147
InstanceOf: PrimaryBreastCancerCondition
Description: "Example of the primary breast cancer diagnosis of a patient"
* code = SCT#372137005 "Primary malignant neoplasm of breast"
* clinicalStatus = ConditionStatusCS#recurrence "Recurrence"
* subject = Reference(BreastCancerPatient147)
* bodySite = SCT#80248007 "Left breast"

Mapping: PrimaryBreastCancerConditionToICHOM
Source:	PrimaryBreastCancerCondition
Target: "https://connect.ichom.org/patient-centered-outcome-measures/breast-cancer"
Id: primaryconditionmapping
Title: "Primary condition to ICHOM set"
Description: "Mapping of the primary breast cancer condition to the ICHOM breast cancer PCOM set. To ensure this is the first breast cancer diagnosed in a patient, the application can search for previous conditions." 	
* -> "First breast cancer"
* clinicalStatus -> "Recurrence" 

// Secondary Breast Cancer
Profile: SecondaryBreastCancerCondition
Parent: Condition 
Id: secondary-breastcancer
Title: "Secondary Breast Cancer Condition"
Description: "Represent the properties of the secondary breast cancer diagnosis"
* insert PublicationProfileRuleset
* code = SCT#145501000119108 "Secondary malignant neoplasm of breast"
* subject only Reference(BreastCancerPatient)
* bodySite from LateralityNewCancerVS
* subject and bodySite MS

Instance: SecondaryBreastCancerPatient147
InstanceOf: SecondaryBreastCancerCondition
Description: "Example of the secondary condition breast cancer diagnosed in a patient"
* code = SCT#145501000119108 "Secondary malignant neoplasm of breast"
* clinicalStatus = ConditionStatusCS#active "Active"
* bodySite = SCT#255209002 "Contralateral"
* subject = Reference(BreastCancerPatient147)

Mapping: SecondaryBreastCancerConditionToICHOM
Source:	SecondaryBreastCancerCondition
Target: "https://connect.ichom.org/patient-centered-outcome-measures/breast-cancer"
Id: secondaryconditionmapping
Title: "Secondary condition to ICHOM set"
Description: "Mapping of the secondary breast cancer condition to the ICHOM breast cancer PCOM set. To ensure this is secondary breast cancer diagnosed in a patient, the application can search for previous conditions." 	
* -> "New cancer"
* bodySite -> "New cancer"

// SURIVAL AND DISEASE CONTROL
// Vital status
Profile: DeathAttributableBC
Parent: Observation 
Id: death-attr-bc
Title: "Death attributable to breast cancer"
Description: "Represents if breast cancer was the cause of death"
* insert PublicationProfileRuleset
* code = SCT#419620001:42752001=254837009 "Death where Due to = Malignant tumor of breast"
* value[x] only CodeableConcept 
* value[x] from NoYesUnknownVS (required)
* value[x] MS

Instance: DeathAttributableBCPatient147
InstanceOf: DeathAttributableBC
Description: "Example of death attributable to breast cancer"
* code = SCT#419620001:42752001=254837009 "Death where Due to = Malignant tumor of breast"
* status = ObservationStatusCS#final
* subject = Reference(BreastCancerPatient147)
* valueCodeableConcept = YesNoUnkCS#N

Mapping: DeathAttributableBCToICHOM
Source:	DeathAttributableBC
Target: "https://connect.ichom.org/patient-centered-outcome-measures/breast-cancer"
Id: deathbcmapping
Title: "Death attributable to breast cancer to ICHOM set"
Description: "Mapping of death attributable to breast cancer to the ICHOM breast cancer PCOM set." 	
* value[x] -> "Death attributable to breast cancer"

// Cancer recurrence
Profile: RecurrenceMethod
Parent: Observation 
Id: recr-method
Title: "Recurrence Method"
Description: "The method of confirming recurrence breast cancer"
* insert PublicationProfileRuleset
* focus only Reference(PrimaryBreastCancerCondition)
* code = SCT#103693007 "Diagnostic procedure"
* value[x] only CodeableConcept 
* value[x] from RecurrenceMethodVS (required)
* value[x] MS

Instance: RecurrenceMethodPatient147
InstanceOf: RecurrenceMethod
Description: "Example of method of confirming recurrence breast cancer"
* focus = Reference(PrimaryBreastCancerPatient147)
* code = SCT#103693007 "Diagnostic procedure"
* status = ObservationStatusCS#final
* subject = Reference(BreastCancerPatient147)
* valueCodeableConcept = SCT#67151002 "Histologic"

Mapping: RecurrenceMethodToICHOM
Source:	RecurrenceMethod
Target: "https://connect.ichom.org/patient-centered-outcome-measures/breast-cancer"
Id: recr-methodmapping
Title: "Recurrence method to ICHOM set"
Description: "Mapping of method of confirming recurrence breast cancer to the ICHOM breast cancer PCOM set." 	
* value[x] -> "Recurrence method"
