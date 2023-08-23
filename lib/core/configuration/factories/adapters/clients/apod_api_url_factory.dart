String apodApiUrlFactory(
        {required String apiKey, required String requestPath}) =>
    'https://api.nasa.gov/planetary/apod?api_key=$apiKey$requestPath';
