// Display webpage showing "404 Not Found" if the request is not for the main domain.
function handler(event) {
    var request = event.request;
    var headers = request.headers;
    var uri = request.uri;
    var mainDomain = "website.com";

    if (headers.host.value !== mainDomain) {
        return {
            statusCode: 404,
            statusDescription: "Not Found",
            headers: {
                "content-type": {
                    value: "text/html"
                }
            },
            body: "<html><body><h1>404 Not Found</h1></body></html>"
        };
    }
    return request;
}
