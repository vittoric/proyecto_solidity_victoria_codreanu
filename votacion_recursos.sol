//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Voting {
    // Estructura para almacenar los recursos
    struct Resource {
        string name;
        uint id;
        uint votes;
    }
    
    // Arreglo de recursos
    Resource[] public resources;
    
    // Diccionario para almacenar los votantes autorizados
    mapping(address => bool) public authorizedVoters;
    
    // Tiempo límite de la votación obteniendo el momento actual en segundos desde el epoch time (01/01/1970) + 5 dias que durara la validez del contrato
    uint public votingDeadline = block.timestamp + 5 days;
    
    // Propietario del contrato
    address public owner;
    
    // Constructor
     constructor () {
        owner = msg.sender;
    }
    
    // Función para autorizar a los votantes
    function authorizeVoter(address voter) public {
        require(msg.sender == owner, "Solo el dueno del contrato puede autorizar a los votantes");
        authorizedVoters[voter] = true;
    }
    
    // Función para registrar los recursos
    function registerResource(string memory name, uint id) public {
        require(msg.sender == owner, "Solo el dueno del contrato puede registrar recursos");
        resources.push(Resource(name, id, 0));
    }
    
    // Función para votar por un recurso
    function vote(uint resourceId) public {
        require(authorizedVoters[msg.sender], "El votante no esta autorizado");
        require((block.timestamp) <= votingDeadline, "La votacion ha finalizado");
        
        // Verificar si el recurso existe
        uint resourceIndex;
        for (uint i = 0; i < resources.length; i++) {
            if (resources[i].id == resourceId) {
                resourceIndex = i;
                break;
            }
        }
        require(resourceIndex < resources.length, "El recurso no existe");
        
        // Aumentar el número de votos para el recurso
        resources[resourceIndex].votes++;
    }
    
    // Función para obtener el recurso ganador
    function getWinner() public view returns (uint winningResourceId) {
        uint maxVotes = 0;
        for (uint i = 0; i < resources.length; i++) {
            if (resources[i].votes > maxVotes) {
                maxVotes = resources[i].votes;
                winningResourceId = resources[i].id;
            }
        }
    }
}
