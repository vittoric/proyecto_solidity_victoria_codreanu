# Desarrollo de un contrato inteligente en solidity 
## que permita generar y administrar votaciones, para la distribución equitativa de recursos en comunidades desfavorecidas. En muchos casos, estas comunidades no tienen acceso a los recursos y servicios básicos que necesitan, como agua potable, energía, educación y atención médica. <br><br>

Equipo
* Victoria Codreanu<br>
* Jennifer Giraldo Hernández<br>
* Valeska Rios Zegarra<br>
<hr>


Este código es un contrato de Ethereum escrito en lenguaje de programación Solidity.

El contrato es llamado "Voting" y está diseñado para llevar a cabo una votación. Hay varios componentes principales en este contrato:

Estructura "Resource": esta estructura se utiliza para almacenar información sobre los recursos que se están votando. Incluye el nombre del recurso, su identificación única y el número de votos que ha recibido.

Arreglo "resources": este es un arreglo público que se utiliza para almacenar los recursos. Cada elemento en el arreglo es una instancia de la estructura "Resource".

Diccionario "authorizedVoters": este es un mapeo público que se utiliza para almacenar información sobre los votantes autorizados. La clave es la dirección de Ethereum de un votante y el valor es un valor booleano que indica si están autorizados o no.

Variable "votingDeadline": esta es una variable pública que se utiliza para almacenar el tiempo límite de la votación. Se establece en el momento actual en segundos desde el epoch time (01/01/1970) más 5 días.

Variable "owner": esta es una variable pública que se utiliza para almacenar la dirección Ethereum del propietario del contrato. El propietario del contrato es la dirección que lo desplegó y se almacena en la variable "owner".

Constructor: esta función es el constructor del contrato y se ejecuta cuando se crea el contrato. Establece la dirección Ethereum del remitente del mensaje como el propietario del contrato.

Función "authorizeVoter": esta función se utiliza para autorizar a los votantes. Solo el propietario del contrato puede ejecutar esta función.

Función "registerResource": esta función se utiliza para registrar un nuevo recurso para la votación. Solo el propietario del contrato puede ejecutar esta función.

Función "vote": esta función se utiliza para votar por un recurso específico. Verifica si el votante está autorizado y si la votación todavía está en curso antes de aumentar el número de votos para el recurso específico.

Función "getWinner": esta función se utiliza para obtener el recurso ganador de la votación. Recorre el arreglo de recursos y encuentra el recurso con el número más alto de votos.
