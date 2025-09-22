public with sharing class CepService {
    

    public static CepDTO getEnderecoCep(String cep){


        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://viacep.com.br/ws/'+ cep + '/json/');
        request.setMethod('GET');

        HttpResponse response = http.send(request);

        CepDTO CepDTO = (CepDTO) JSON.deserialize(response.getBody(),CepDTO.class);
        System.debug('o retorno foi: ' + CepDTO.logradouro);

        return CepDTO;

    }
}