function handler(event) {
    var request = event.request;
    var headers = request.headers;
    var uri = request.uri;
    var mainDomain = "domainame.com";

    if (headers.host.value !== mainDomain) {
        return {
            statusCode: 301,
            statusDescription: "Moved Permanently",
            headers: {
                location: { value: "https://" + mainDomain + uri },
            },
        };
    }

    return request;
}
