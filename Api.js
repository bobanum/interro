export default class Api {
    static async fetch(sub, credentials = true) {
        var options = {
            method: 'GET',
            // redirect: 'manual',
            credentials: credentials ? "include" : "omit",
            headers: {
                'Accept': 'application/json',
            }
        };
        let url = this.url;
        if (sub) url += '/' + sub;
        const response = await fetch(url, options);
        const data = await response.json();

        if (response.ok) return data;
        switch (response.status) {
            case 400:
                return this.fetch('?app_key=' + this.app_key, true);
            case 401:
                throw new Error('Unauthorized access - invalid app_key');
            case 403:
                switch (data.status) {
                    case 'redirect':
                        if (data.location) {
                            // Redirect to the specified location
                            window.location.href = data.location;
                        } else {
                            throw new Error('Redirect location not provided');
                        }
                        break;
                    case 'choose':
                        // Display the HTML content for choosing a provider
                        let mod = document.body.appendChild(document.createElement('div'));
                        mod.innerHTML = data.html;
                        break;
                    default:
                        throw new Error(`Forbidden access - ${data.error || 'Unknown error'}`);
                }
                return;
            default:
                throw new Error(`Fetch failed with status ${response.status}`);
        }
    }
    static callProvider(provider) {
        return this.fetch('?app_key=' + this.app_key + '&provider=' + provider).then(data => {
            console.log(data);
            // Handle the data returned from the API
        });
    }
}
window.Api = Api;