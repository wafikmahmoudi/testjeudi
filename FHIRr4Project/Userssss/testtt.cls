Class Userssss.testtt Extends Ens.BusinessService
{

Parameter ADAPTER = "Ens.InboundAdapter";

Method OnProcessInput(pInput As %RegisteredObject, Output pResponse As HS.Message.FHIR.Response) As %Status
{
	
		$$$LOGINFO("1111111111111111111111111111111111111111111111111111111111111111111111")
	
	try {
			
			$$$LOGINFO("wafik")
	    	
	    	set textPatient = {"resourceType":"Patient","id":"95172150","identifier":[{"type":{"coding":[{"code":"MR","display":"MR"}],"text":"MR"},"system":"urn:oid:1.3.6.1.4.1.21367.2010.1.2.300.2.3","value":"19503240"}],"active":true,"name":[{"use":"usual","family":"Glod3","given":["Ely3"],"prefix":["M"]}],"telecom":[{"system":"phone","value":"777","use":"home"},{"system":"phone","value":"4444","use":"work"}],"gender":"female","birthDate":"2020-04-02","deceasedBoolean":false,"address":[{"use":"home","line":["street test"],"city":"city of angels","state":"california","postalCode":"78456132"}],"multipleBirthBoolean":false,"communication":[{"language":{"coding":[{"code":"en","display":"English"}],"text":"English"},"preferred":true}]}
	    		//set textPatient = {"resourceType":"Patient","id":"95172150","identifier":[{"type":{"coding":[{"code":"MR","display":"MR"}],"text":"MR"},"system":"urn:oid:1.3.6.1.4.1.21367.2010.1.2.300.2.3","value":"19503240"}],"active":true,"name":[{"use":"usual","family":"Glod3","given":["Ely3"],"prefix":["M"]}],"telecom":[{"system":"phone","value":"777","use":"home"},{"system":"phone","value":"4444","use":"work"}],"gender":"female","birthDate":"2020-04-02","deceasedBoolean":false,"address":[{"use":"home","line":["street test"],"city":"city of angels","state":"california","postalCode":"78456132"}],"multipleBirthBoolean":false,"communication":[{"language":{"coding":[{"code":"en","display":"English"}],"text":"English"},"preferred":true}],"resource": {"resourceType": "Observation","category": [{"coding": [{"code": "laboratory","system": "http://hl7.org/fhir/observation-category"}]}]}}
	
	    	set xxl = ##class(HS.Message.FHIR.Request).%New()
	        set xxl.BaseURL = "http://a4b402f69775:52773/csp/healthshare/dacetablissementfhir/fhir/stu3"
	        set xxl.Type = "Patient"
	        set xxl.FHIRVersion="STU3"
	        set xxl.Interaction="create"
	        //set xxl.Interaction="update"
	        set xxl.ContentType = "application/fhir+json"
	        //set xxl.Id = 95172150
	        set xxl.Payload = xxl.Payload.Write(textPatient.%ToJSON())
			set sc=..SendRequestSync("HS.FHIR.REST.Operation",xxl,.pResponse)
			
		
       		set dynamicObject = {}.%FromJSON(pResponse.Payload)
      
       		//$$$LOGINFO("status : "_dynamicObject.status_" ; "_"sessionids : "_dynamicObject.sessionids)
       		$$$LOGINFO("message : "_dynamicObject.%ToJSON())
			
	
	
		}Catch ex {	Set tSC=ex.AsStatus()}
		$$$LOGINFO("22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222")
	
   
		Quit 1
}

}
