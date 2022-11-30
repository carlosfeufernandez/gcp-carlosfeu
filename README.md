# Google Cloud Platform - Carlos Feu

## Contenido que vamos a encontrar en la práctica

- Empezamos con el diagrama del proyecto

![Diagrama del proyecto](GCP_CarlosFeuFern%C3%A1ndez.jpg.drawio.png)

## Deploy en AppEngine

- En la carpeta de "deploy-gcp" nos encontramos con los archivos que se han utilizado para el despligue. En el app.yaml encontramos la configuración mofificada de la base de datos, con el usuario correspondiente.

## VM de autoescalado del grupo de instancias

- Nos encontramos con la carpeta "estres-vm", su contenido es un script que su función es intentar colapsar la CPU de la maquina del grupo de instancias para que escale el numero de maquinas que necesite.

## Terraform Bonus

- Para finalizar el proyecto vamos a ver un despliegue realizado a través de Terraform. Para ellos nos encontraremos el main.tf y su correspondiente archivo de variables.