# Desarrollo de un contrato inteligente en solidity 
## que permita generar y administrar votaciones, para la distribución equitativa de recursos en comunidades desfavorecidas. En muchos casos, estas comunidades no tienen acceso a los recursos y servicios básicos que necesitan, como agua potable, energía, educación y atención médica. <br><br>

Equipo
* Victoria Codreanu<br>
* Jennifer Giraldo Hernández<br>
* Valeska Rios Zegarra<br>
<hr>

Este código es un contrato de Solidity que implementa un sistema de votación.

El contrato almacena información sobre los recursos que se están votando mediante la estructura "Resource". Cada recurso tiene un nombre, un ID y un número de votos.

El contrato también mantiene un registro de votantes autorizados utilizando un diccionario "mapping".

El contrato tiene una fecha límite de votación que se almacena en la variable "votingDeadline".

El propietario del contrato es la dirección que lo desplegó y se almacena en la variable "owner".

El contrato tiene un constructor que establece el propietario del contrato como la dirección que lo desplegó.

El contrato tiene una función "authorizeVoter" que permite al propietario autorizar a los votantes para que puedan votar.

La función "registerResource" permite al propietario registrar los recursos que se van a votar.

La función "vote" permite a los votantes autorizados votar por un recurso específico. Verifica si el votante está autorizado y si la votación aún está abierta antes de registrar el voto.

La función "getWinner" es una función de vista que devuelve el ID del recurso con más votos.

En general, este contrato permite que los recursos sean registrados y votados por votantes autorizados dentro de un período de tiempo limitado, y devuelve el recurso ganador con el mayor número de votos.
