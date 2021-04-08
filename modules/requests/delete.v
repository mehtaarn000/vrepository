module requests

import net.http

pub fn delete(auth_key string, url string) int {
	// Build a request with an auth header
	mut requester := http.Request{
		method: http.Method.delete, 
		url: url
	}

	// Add the authorization token
	requester.add_header("Authorization", "token " + auth_key)

	// Add the accept header
	requester.add_header("Accept", "application/vnd.github.v3+json")

	// Send the request
	response := requester.do() or { panic("Request to API failed.") }
	//raw_json := json2.raw_decode(response.text) or { panic('Invalid JSON sent by server.') }

	// Errors are sent through the "message" key
	// If error, then panic
	//if raw_json.as_map()["message"].str() != "" {
		//eprint(raw_json.as_map()["message"])
	//}

	return response.status_code
}
