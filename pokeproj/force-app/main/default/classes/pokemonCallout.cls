public with sharing class pokemonCallout {
    public static void pokemonCallout(Contact Contact) {
        Integration__mdt pokemonAPISettings = [SELECT endpoint__c, Method__c FROM Integration__mdt];
        String endPointPokemon = pokemonAPISettings.endpoint__c + Contact.FavoritePokemon__c;

        Http http = new http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endPointPokemon);
        request.setMethod(pokemonAPISettings.Method__c);

        HttpResponse response = http.send(request);
        String jasonBody = response.getBody();

        if(response.getStatusCode() == 200){
            system.debug('jasonBody' + jasonBody);
        }


    }
}
