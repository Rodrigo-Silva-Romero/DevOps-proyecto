# 1. Introducción

 ## Objetivo del proyecto

El objetivo principal de este proyecto es diseñar, implementar y documentar una arquitectura completa para un sistema de microservicios desplegado sobre AWS utilizando prácticas modernas de DevOps, Infraestructura como Código y automatización continua. El propósito es construir una solución robusta, escalable y reproducible que integre diferentes tecnologías —Docker, ECS Fargate, Terraform, GitHub Actions y servicios serverless como AWS Lambda— demostrando la capacidad de orquestar múltiples componentes para ofrecer un sistema productivo realista y alineado con estándares profesionales.

Este proyecto busca no solo desplegar microservicios funcionales (API Gateway, Product Service, Inventory Service, Redis, Postgres), sino también generar una capa de infraestructura altamente automatizada que permita gestionar entornos completos de manera declarativa. La infraestructura está definida íntegramente en Terraform, permitiendo crear desde cero la red, el balanceo de carga, los repositorios de imágenes, los servicios de contenedores y todos los recursos asociados. Esto garantiza consistencia, reproducibilidad y simplifica enormemente el mantenimiento a largo plazo.

Otro de los objetivos clave es implementar una cadena de CI/CD basada en GitHub Actions capaz de automatizar tanto la construcción y publicación de imágenes Docker en ECR como el proceso de despliegue de la infraestructura y los servicios en ECS Fargate. De esta manera, cualquier cambio en el código o la configuración puede ser puesto en producción mediante pipelines claros, trazables y seguros, eliminando pasos manuales y reduciendo riesgos operativos.

Finalmente, el proyecto incorpora un componente serverless mediante una Lambda que se integra con EventBridge y SNS para generar notificaciones automáticas cada vez que se produce un despliegue en ECS. Esta funcionalidad responde al objetivo de incluir mecanismos de monitoreo y observabilidad que acompañen al ciclo de vida de la aplicación, aportando valor agregado y cerrando el círculo de automatización requerido para un entorno moderno de microservicios.

En conjunto, el proyecto demuestra el diseño, la construcción y la puesta en marcha de una plataforma completa de microservicios basada en las mejores prácticas de infraestructura en la nube, automatización, seguridad y operación continua, cumpliendo plenamente con los requisitos académicos y replicando escenarios reales del ámbito profesional.

------

# 2. Planificación y Seguimiento

La planificación y el seguimiento del proyecto se estructuraron a partir de un flujo de trabajo por etapas diseñado en Miro, donde cada fase del proceso fue representada con un código de color distintivo. Este esquema visual permitió definir de manera ordenada el recorrido completo de una etapa, desde su inicio hasta su finalización.

![Aspose Words 9986df04-c16e-4362-91e4-5250e7d621d5 001](https://github.com/user-attachments/assets/ed3f5a57-3ee8-49ac-b4b7-1850be4ce15f)

Posteriormente, esta codificación se trasladó a Trello, donde cada tarjeta incorporó el color correspondiente a su etapa del flujo. De esta forma, la herramienta no solo centraliza la gestión operativa, sino que también mantiene la coherencia visual del proceso definido en Miro, facilitando la lectura del estado de avance y la toma de decisiones durante la ejecución del proyecto.

<img width="363" height="243" alt="Aspose Words 9986df04-c16e-4362-91e4-5250e7d621d5 002" src="https://github.com/user-attachments/assets/d016785f-26ae-4d14-9ed5-ca255c4c8fa0" />


El tablero está organizado en columnas que representan el estado de cada actividad (Pendiente, En Progreso, En Revisión y Completado). Cada tarjeta incluye la descripción de la tarea y etiquetas.\
A lo largo del proyecto se capturaron distintos estados del tablero, lo que permite evidenciar cómo evolucionó la carga de trabajo y el avance del equipo. 

<img width="367" height="259" alt="Aspose Words 9986df04-c16e-4362-91e4-5250e7d621d5 003" src="https://github.com/user-attachments/assets/53474021-dd13-4b9e-87e2-d41d6d90023b" />

Esta metodología facilita la coordinación, la identificación temprana de bloqueos y el seguimiento continuo del progreso. 

Además, dentro de cada tarjeta se definió un **listado de subtareas**, lo que permite desglosar actividades más grandes en pasos concretos y facilitar su seguimiento.

<img width="415" height="267" alt="Aspose Words 9986df04-c16e-4362-91e4-5250e7d621d5 004" src="https://github.com/user-attachments/assets/77ecf770-612a-47a8-ac85-c80576f5fc76" />

------

3. # Control de versiones 

El proyecto utiliza **GitHub** como plataforma central de control de versiones, permitiendo la gestión del código fuente, la colaboración entre desarrolladores y el seguimiento histórico de cambios. Para organizar el trabajo se aplica una estrategia de ramas, **Trunk-Based Development**. 

<img width="602" height="296" alt="Aspose Words 9986df04-c16e-4362-91e4-5250e7d621d5 005" src="https://github.com/user-attachments/assets/23c294a9-f24d-498b-b4be-5974bdb85dd9" />

La rama principal (main) se mantiene estable, mientras que las nuevas funcionalidades y mejoras se desarrollan en ramas específicas que luego se integran mediante Pull Requests y revisiones.

La elección de Trunk-Based Development se basó en su adecuación a la dimensión del equipo y a la dinámica de trabajo del proyecto. Al contar con un número reducido de integrantes, esta estrategia facilita la integración continua, reduce la complejidad en la gestión de ramas y minimiza conflictos, permitiendo mantener un flujo de desarrollo ágil y coordinado.

Durante el desarrollo del proyecto se decidió restringir el push directo a la rama main, adoptando un flujo basado en Pull Requests y validación entre pares para asegurar mayor calidad y trazabilidad en los cambios. 

Sin embargo, al tratarse de un equipo de solo dos integrantes, no siempre ambos estaban disponibles para revisar y aprobar los PR, lo que generó bloqueos y retrasos en el avance. Por ese motivo, se optó por desactivar esta restricción para permitir un flujo de trabajo más ágil.


## CI/CD (GitHub Actions)

La automatización del ciclo de integración y despliegue continuo se implementa mediante **GitHub Actions**. A través de flujos de trabajo configurados en el repositorio, cada cambio enviado a las ramas relevantes dispara procesos automáticos de **CI/CD**, que incluyen compilación, pruebas, validaciones y despliegues hacia los entornos definidos. Esto asegura que el código sea verificado de forma constante y que los entregables se mantengan consistentes, confiables y listos para su despliegue.
### *Pipelines*

### *Deploy Only - main.yml* 

<img width="2524" height="204" alt="image" src="https://github.com/user-attachments/assets/71c8881c-0e06-4aca-a0ad-ea58e0bb2be7" />

### *Terraform Deploy - terraform-apply.yml*

<img width="2396" height="484" alt="image" src="https://github.com/user-attachments/assets/d813eeca-ec5c-4dfb-bba9-240b2f7080af" />

#### *terraform-destroy.yml*

<img width="1964" height="204" alt="image" src="https://github.com/user-attachments/assets/d0be83ff-a142-4309-a054-e2ea09c4f351" />


#### *storage-apply.yml*

<img width="2004" height="444" alt="image" src="https://github.com/user-attachments/assets/c086648d-aa76-4eba-a335-f95219af00d7" />


## **Estrategia de pipelines: Apply / Deploy de app / Destroy / Storage Deploy**

Se diseñaron cuatro pipelines distintos, cada uno con responsabilidades bien definidas:

1. **Terraform Storage Deploy**: pipeline dedicado a la creación y gestión inicial del storage compuesto por los ecr y el bucket s3 

2. **Terraform Apply**: despliegue de la infraestructura principal del proyecto para el entorno seleccionado (VPC, ECS, ALB, RDS, etc.).

3. **Deploy Only (Build & Deploy)**: testing de código, análisis de calidad, construcción de imágenes Docker, push a ECR y actualización del servicio ECS para cada entorno.

4. **Terraform Destroy**: eliminación controlada y segura de toda la infraestructura seleccionada.



**Disparadores configurados**

Terraform Storage Deploy / Terraform Apply / Terraform Destroy : workflow\_dispatch (ejecución manual seleccionando environment: dev/staging/prod).

Pipeline de deploy de App (main.yml),  se dispara automáticamente con Merge a main.

## **Motivos de la decisión**

Los pipelines se separaron para garantizar **seguridad, control y claridad**, ya que esto permite desacomplar cada etapa permitiendo levantar o destruir el entorno deseado sin afectar los demas.

- **Responsabilidades independientes:**  
  Cada pipeline cumple un rol específico.  
  - *Terraform Apply* y *Terraform Destroy* administran la infraestructura principal.  
  - *Deploy Only* gestiona la construcción y despliegue de contenedores sin tocar la infraestructura.  
  - *Terraform Storage Deploy* se encarga exclusivamente de crear los recursos base iniciales (S3 para tfstate y repositorios ECR).  
  Esta separación evita mezclar procesos, riesgos y permisos.

- **Mayor trazabilidad:**  
  Cada tipo de cambio queda auditado en su propio pipeline:  
  - Cambios de storage base  
  - Cambios de infraestructura  
  - Cambios de aplicación  
  Esto permite identificar claramente dónde ocurrió cada modificación.

- **Evita errores de dependencia:**  
  La secuencia es segura: primero *Storage Deploy*, luego *Apply*, y recién después los despliegues de contenedores.  
  Esto garantiza que los repositorios ECR y el bucket S3 existan antes de los demás pipelines.

- **Destrucción de infra controlada:**  
  *Terraform Destroy* se mantiene como un pipeline manual e independiente para minimizar el riesgo de eliminaciones accidentales y asegurar un proceso supervisado.

## Secrets necesarios

| Secret              | Rol                                                   | Pipeline(s) donde se usa                                | Dependencia                                                   |
|---------------------|-------------------------------------------------------|---------------------------------------------------------|---------------------------------------------------------------|
| AWS_ACCESS_KEY_ID   | Credencial AWS para autenticación                      | Todos los pipelines                                     | Necesario desde el inicio                                     |
| AWS_SECRET_ACCESS_KEY | Credencial AWS para autenticación                    | Todos los pipelines                                     | Necesario desde el inicio                                     |
| AWS_SESSION_TOKEN   | Token temporal AWS (si usás STS)                       | Todos los pipelines                                     | Necesario desde el inicio                                     |
| AWS_REGION          | Región AWS                                             | Deploy Only (como secret), en otros pipelines está hardcodeado us-east-1 | Debe estar definido antes de Deploy Only                      |
| REPO_ADMIN_PAT      | Token de GitHub con permisos para actualizar secrets   | Terraform Storage Deploy                                | Necesario para que se actualicen los secrets de ECR           |
| ECR_API_URL         | URL del repo ECR para api-gateway                      | Se actualiza en Storage Deploy, usado en Deploy Only y Terraform Deploy/Destroy | Debe existir antes de Deploy Only y Terraform Deploy          |
| ECR_PRODUCT_URL     | URL del repo ECR para product-service                  | Igual que arriba                                        | Igual que arriba                                              |
| ECR_INVENTORY_URL   | URL del repo ECR para inventory-service                | Igual que arriba                                        | Igual que arriba                                              |
| SENDER_EMAIL        | Email usado en Terraform (probablemente SES/Lambda)    | Terraform Deploy y Destroy                              | Debe estar definido antes de Deploy Terraform                 |
| APP_PASSWORD        | Password asociado al email (autenticación SMTP/SES)    | Terraform Deploy y Destroy                              | Debe estar definido antes de Deploy Terraform                 |
| SONAR_PROJECT_KEY   | Identificador del proyecto en SonarCloud               | Deploy Only                                             | Necesario para correr análisis de calidad                     |
| SONAR_ORGANIZATION  | Organización en SonarCloud                             | Deploy Only                                             | Necesario para correr análisis de calidad                     |
| SONAR_TOKEN         | Token de autenticación SonarCloud                      | Deploy Only                                             | Necesario para correr análisis de calidad                     |

**Disparadores y flujo operativo.**

- **Cambios en infraestructura**: generar PR → revisar tfplan → ejecutar el pipeline Terraform Apply manualmente (workflow\_dispatch) para el environment objetivo. 

- **Cambios de aplicación**: PR → merge a main → pipeline DEPLOY ONLY  construye imágenes, Sonar + tests, las sube a ECR y actualiza ECS automáticamente de los entornos.

- **Destrucción de entornos**: ejecutar Terraform Destroy manualmente mediante workflow\_dispatch únicamente cuando sea necesario.

Separar la creación de la infraestructura, el deploy de la app, y destrucción de la infraestructura permite mejor seguridad, mayor velocidad en CI, mayor control y trazabilidad, y previene errores críticos al exigir acciones conscientes para cambios infraestructurales y destrucciones.

------------
# 4. Testing y Calidad


**Quality Checks con SonarCloud.**

Con el objetivo de asegurar un estándar mínimo de calidad en el código antes de permitir cualquier despliegue automático, se incorporó un proceso de Quality Checks basado en SonarCloud dentro del pipeline principal (main.yml).

La decisión de integrar SonarCloud surge de la necesidad de contar con un mecanismo automático que evalúe métricas críticas —como bugs, vulnerabilidades, duplicación de código y cobertura de pruebas— y que determine si un cambio puede avanzar hacia los entornos de integración y despliegue. Esto evita que código defectuoso o no mantenible llegue a ambientes superiores, y establece un control formal de calidad alineado con buenas prácticas de CI/CD.

El job ejecuta un análisis estático sobre los diferentes microservicios del proyecto y consulta el estado del quality gate definido en SonarCloud. Si la calidad no alcanza los umbrales establecidos, el pipeline se detiene, obligando al desarrollador a corregir los problemas antes de continuar. Si el análisis aprueba, el pipeline sigue su curso normal y habilita la etapa de build y despliegue.

**Aclaración sobre los Quality Gates en SonarCloud**	

En la versión gratuita de SonarCloud no es posible crear Quality Gates personalizados. Solo se puede utilizar el Quality Gate predeterminado que viene configurado por la plataforma. Para definir reglas propias o modificar los umbrales es necesario un plan pago. Aun así, el Quality Gate por defecto cubre las validaciones esenciales para asegurar la calidad del código.

Este enfoque permite incorporar calidad desde las primeras fases del desarrollo, automatizar revisiones que de otra forma serían manuales y asegurar consistencia a lo largo de todos los cambios que ingresan al repositorio.

**Python Health Test**

Como parte del pipeline de validación previa al despliegue, se incorporó un job de Python Health Test que ejecuta pruebas automatizadas sobre el microservicio *Product Service*. La decisión de incluir este paso surge de la necesidad de verificar que el servicio funcione correctamente antes de generar las imágenes y desplegarlas en ECS, evitando enviar a producción código que no pase pruebas básicas.

Este control actúa como una verificación preventiva adicional que complementa el análisis estático de SonarCloud, asegurando que el servicio esté operativo y estable antes de continuar con el pipeline.

-----

# 5. Flujo de ejecución

#### Terraform Storage Deploy

 Este pipeline se corre primero. Su función es crear el bucket S3 que se usa como backend para guardar los tfstate de Terraform y crear los repositorios ECR donde más adelante se van a almacenar las imágenes Docker. Además, actualiza los secrets de GitHub (ECR_API_URL, ECR_PRODUCT_URL, ECR_INVENTORY_URL) con las URLs reales de los repositorios ECR. Es importante que esos secrets ya existan previamente en GitHub (aunque sea vacíos), porque este pipeline los actualiza, no los crea.

#### Terraform Deploy
 Una vez que el storage y los repositorios ECR están listos, se ejecuta este pipeline para levantar la infraestructura completa en AWS. Se debe seleccionar el entorno (dev, staging o prod) que se quiere desplegar.

#### Deploy Only

 Luego, cuando se realiza un cambio en el código (por ejemplo en index.html) y ese cambio es aprobado en un Pull Request y mergeado a main, se dispara este pipeline. Su función es construir las imágenes Docker, correr los tests de calidad y desplegar los contenedores en ECS. 
 
 ##### ⚠️ Algo importante:
   este pipeline está configurado para actualizar los tasks y levantar los contenedores en todos los entornos. Por lo tanto, previamente tienen que estar levantados todos los entornos con el pipeline de Terraform Deploy.

 #### Terraform Destroy
  Finalmente, si se desea eliminar un entorno específico, se corre este pipeline seleccionando el ambiente (dev, staging o prod) que se quiere destruir.

### Prerequisitos en la ejecucion

#### Terraform Storage Deploy

Rol: crea el bucket S3 para el backend y los repositorios ECR.

Secrets necesarios antes de correrlo:

AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, AWS_SESSION_TOKEN → credenciales AWS.

REPO_ADMIN_PAT → token GitHub con permisos para actualizar secrets.

ECR_API_URL, ECR_PRODUCT_URL, ECR_INVENTORY_URL → ya deben existir en GitHub (aunque vacíos o iniciales), porque este pipeline los actualiza con los valores reales.

#### Terraform Deploy

Rol: levanta la infraestructura (ECS, Lambda, etc.).

Secrets necesarios antes de correrlo:

AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, AWS_SESSION_TOKEN.

SENDER_EMAIL, APP_PASSWORD → usados para SES/Lambda.

ECR_API_URL, ECR_PRODUCT_URL, ECR_INVENTORY_URL → ya actualizados en el paso anterior.

#### Deploy Only

Rol: construye imágenes, corre tests y despliega contenedores en ECS.

Secrets necesarios antes de correrlo:

AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, AWS_SESSION_TOKEN, AWS_REGION.

ECR_API_URL, ECR_PRODUCT_URL, ECR_INVENTORY_URL → ya actualizados en Storage Deploy.

SONAR_PROJECT_KEY, SONAR_ORGANIZATION, SONAR_TOKEN → para análisis de calidad en SonarCloud.

#### Terraform Destroy

Rol: destruye la infraestructura levantada en el paso 2.

Secrets necesarios antes de correrlo:

AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, AWS_SESSION_TOKEN.

SENDER_EMAIL, APP_PASSWORD.

ECR_API_URL, ECR_PRODUCT_URL, ECR_INVENTORY_URL.


---------------
# 6. Arquitectura del Sistema

### *6.1 Arquitectura funcional (microservicios)*

La arquitectura del proyecto se basa en un enfoque de **microservicios**, donde cada componente del sistema se implementa como un servicio independiente, aislado y con una responsabilidad claramente definida. Cada microservicio expone su funcionalidad a través de APIs y se comunica con el resto del ecosistema mediante protocolos livianos, lo que permite una mayor flexibilidad, escalabilidad y facilidad de mantenimiento.

Este modelo favorece el despliegue y la actualización individual de cada servicio sin afectar al resto del sistema, además de facilitar la detección de fallos y la optimización de componentes específicos. La separación modular también permite asignar tecnologías, recursos y pipelines independientes para cada microservicio, de acuerdo con las necesidades de su funcionalidad.

**Networking desplegado**
Para soportar la arquitectura basada en microservicios se diseñó y desplegó una infraestructura de red en AWS que garantiza conectividad segura, balanceo de carga y alta disponibilidad:

**VPC dedicada:** Se creó una Virtual Private Cloud (VPC) con soporte de DNS y hostnames, lo que permite aislar el tráfico de la aplicación y mantener control sobre la segmentación de red.

**Subnets públicas distribuidas en múltiples Availability Zones:** Se configuraron subredes públicas en distintas zonas de disponibilidad, asegurando redundancia y tolerancia a fallos.

**Internet Gateway y tabla de ruteo pública:** Se habilitó un Internet Gateway asociado a la VPC y una tabla de ruteo que permite la salida a internet desde las subnets públicas, garantizando accesibilidad externa a los servicios expuestos.

**Application Load Balancer (ALB):** Se desplegó un balanceador de carga de tipo Application que distribuye el tráfico HTTP hacia los microservicios registrados en el target group. Esto asegura escalabilidad horizontal y resiliencia en la capa de entrada.

**Security Groups:**

Un grupo de seguridad para el ALB que permite tráfico HTTP desde cualquier origen.

Un grupo de seguridad para los servicios ECS que restringe el acceso únicamente al tráfico proveniente del ALB y al tráfico interno dentro de la VPC.

### **6.1a Justificación de la elección**
La infraestructura de red se diseñó con criterios de simplicidad, seguridad y escalabilidad, lo que la convierte en la base ideal para un ecosistema de microservicios:

**Aislamiento y control:** La creación de una VPC dedicada permite separar el tráfico de la aplicación del resto de la nube, garantizando un entorno controlado y seguro.

**Acceso externo seguro y centralizado:** El Application Load Balancer (ALB) actúa como único punto de entrada, distribuyendo el tráfico hacia los microservicios y evitando que cada servicio tenga que exponerse directamente a internet.

**Alta disponibilidad:** Las subnets públicas distribuidas en múltiples Availability Zones aseguran que los servicios sigan funcionando incluso si una zona falla.

**Protección granular:** Los Security Groups limitan el acceso externo únicamente a través del ALB y permiten comunicación interna controlada dentro de la VPC, reduciendo la superficie de ataque.

**Escalabilidad transparente:** El ALB y los target groups permiten añadir o quitar instancias de microservicios sin necesidad de modificar la configuración de red, lo que facilita el crecimiento del sistema.

### 6.1b Arquitectura de despliegue (AWS)

<img width="551" height="469" alt="Aspose Words 9986df04-c16e-4362-91e4-5250e7d621d5 008" src="https://github.com/user-attachments/assets/3b0fbbc2-85d8-40be-bd43-82ebfefd2eb2" />


### *6.2 Estructura del repositorio (tree)*

        .
        ├── api-gateway
        │   ├── Dockerfile
        │   ├── go.mod
        │   ├── go.sum
        │   ├── main.go
        │   └── static
        │       └── index.html
        ├── docker-compose.yml
        ├── documentos
        │   ├── Informe-de-Análisis-SonarQube.MD
        │   ├── Obligatorio - Agosto 2025.pdf
        │   └── recomendaciones.md
        ├── infra
        │   ├── ecs-task
        │   │   ├── task-definition-dev.json
        │   │   ├── task-definition-prod.json
        │   │   └── task-definition-staging.json
        │   ├── infra-storage
        │   │   ├── ecr
        │   │   │   ├── main.tf
        │   │   │   ├── outputs.tf
        │   │   │   └── variables.tf
        │   │   ├── main.tf
        │   │   ├── outputs.tf
        │   │   ├── S3
        │   │   │   ├── main.tf
        │   │   │   ├── outputs.tf
        │   │   │   └── variables.tf
        │   │   └── variables.tf
        │   └── terraform
        │       ├── dev.tfvars
        │       ├── main.tf
        │       ├── modules
        │       │   ├── alb
        │       │   │   ├── main.tf
        │       │   │   ├── outputs.tf
        │       │   │   └── variables.tf
        │       │   ├── ecs-cluster
        │       │   │   ├── main.tf
        │       │   │   ├── outputs.tf
        │       │   │   └── variables.tf
        │       │   ├── ecs-service
        │       │   │   ├── main.tf
        │       │   │   ├── outputs.tf
        │       │   │   └── variables.tf
        │       │   ├── lambda
        │       │   │   ├── handler.py
        │       │   │   ├── main.tf
        │       │   │   ├── outputs.tf
        │       │   │   └── variables.tf
        │       │   ├── security-group
        │       │   │   ├── main.tf
        │       │   │   ├── outputs.tf
        │       │   │   └── variables.tf
        │       │   └── vpc
        │       │       ├── main.tf
        │       │       ├── outputs.tf
        │       │       └── variables.tf
        │       ├── outputs.tf
        │       ├── prod.tfvars
        │       ├── staging.tfvars
        │       └── variables.tf
        ├── init.sql
        ├── inventory-service
        │   ├── Dockerfile
        │   ├── go.mod
        │   ├── go.sum
        │   └── main.go
        ├── product-service
        │   ├── Dockerfile
        │   ├── main.py
        │   └── requirements.txt
        ├── README.md
        └── tests
            └── test_product_service.py

------
# 7. Infraestructura como Código (Terraform)
### *6.1 Estructura de carpetas de Terraform*

        .
        ├── ecs-task
        │   ├── task-definition-dev.json
        │   ├── task-definition-prod.json
        │   └── task-definition-staging.json
        ├── infra-storage
        │   ├── ecr
        │   │   ├── main.tf
        │   │   ├── outputs.tf
        │   │   └── variables.tf
        │   ├── main.tf
        │   ├── outputs.tf
        │   ├── S3
        │   │   ├── main.tf
        │   │   ├── outputs.tf
        │   │   └── variables.tf
        │   └── variables.tf
        └── terraform
            ├── dev.tfvars
            ├── main.tf
            ├── modules
            │   ├── alb
            │   │   ├── main.tf
            │   │   ├── outputs.tf
            │   │   └── variables.tf
            │   ├── ecs-cluster
            │   │   ├── main.tf
            │   │   ├── outputs.tf
            │   │   └── variables.tf
            │   ├── ecs-service
            │   │   ├── main.tf
            │   │   ├── outputs.tf
            │   │   └── variables.tf
            │   ├── lambda
            │   │   ├── handler.py
            │   │   ├── main.tf
            │   │   ├── outputs.tf
            │   │   └── variables.tf
            │   ├── security-group
            │   │   ├── main.tf
            │   │   ├── outputs.tf
            │   │   └── variables.tf
            │   └── vpc
            │       ├── main.tf
            │       ├── outputs.tf
            │       └── variables.tf
            ├── outputs.tf
            ├── prod.tfvars
            ├── staging.tfvars
            └── variables.tf

### *7.2 Módulos implementados*

VPC

Security Group

ECR (Elastic Container Registry)

ECS Cluster

ECS Service

ALB (Application Load Balancer)

LAMBDA 

ECS Task Definition *(fuera del directorio de módulos, pero parte de la infraestructura)*

- Define los contenedores del sistema:
  - API Gateway
  - Product Service
  - Inventory Service
  - PostgreSQL
  - Redis

INFRA-STORAGE


### *7.3 Backend Remoto en Amazon S3*

El proyecto utiliza un bucket S3 como backend remoto de Terraform, con el objetivo de almacenar el archivo de estado (terraform.tfstate) de forma centralizada, segura y accesible para todo el equipo de trabajo y los pipelines de CI/CD. Esta práctica es fundamental para garantizar consistencia en la infraestructura desplegada y evitar conflictos en el manejo del estado.

-------
### *7.4 Outputs importantes y su Función*


### **vpc_id** 

**Qué devuelve:** El ID de la VPC creada.

**Función:** Permite identificar y reutilizar la VPC en la que se desplegarán los recursos. Es esencial para asociar subnets, security groups y otros componentes de red.

### public_subnet_ids

**Qué devuelve:** Los IDs de las subnets públicas dentro de la VPC.

**Función:** Se usan para ubicar recursos que necesitan acceso a internet (por ejemplo, el ALB o servicios ECS que deben ser accesibles externamente).

### cluster_id

**Qué devuelve:** El ID del cluster ECS creado.

**Función:** Identifica el cluster donde se ejecutan los microservicios en contenedores. Es necesario para gestionar tareas y servicios dentro de ECS.

### alb_dns

**Qué devuelve:** El DNS público del Application Load Balancer.

**Función:** Es la dirección que los clientes utilizan para acceder a la aplicación. Centraliza el tráfico y lo distribuye hacia los microservicios.

### ecs_service_names

**Qué devuelve:** Los nombres de los servicios ECS desplegados.

**Función:** Permite identificar cada servicio dentro del cluster, útil para monitoreo, escalado y administración de los microservicios.

### lambda_url

**Qué devuelve:** La URL pública de la función Lambda desplegada.

**Función:** Expone la función como endpoint HTTP, lo que facilita su integración con otros servicios o clientes externos.


-------
# 8. Arquitectura Serverless (Lambda)
### *8.1 Objetivo de la Lambda*

La función Lambda es invocada automáticamente al finalizar el pipeline de creación de la infraestructura (Terraform Apply). Durante la ejecución del workflow, el pipeline obtiene la URL pública de la Lambda (Lambda Function URL), la almacena en una variable y una vez completado el terraform apply, realiza un POST HTTP hacia dicha URL. 

Este POST actúa como el disparador de la función, provocando que la Lambda procese la solicitud y envíe el correo electrónico de notificación. 

De esta manera, cada despliegue de infraestructura queda registrado y comunicado sin intervención manual, asegurando una trazabilidad completa de los cambios aplicados.

-------

# *9 IAM Roles*

En la definición de tareas (Task Definition) se incluyó de forma estática el ARN del rol de IAM

        "arn:aws:iam::851725322802:role/LabRole"

Este valor corresponde al ID de cuenta y rol de usuario que se utilizó para las pruebas iniciales. Se dejó hardcodeado por cuestiones de tiempo, pero para que la ejecución de los tasks no falle al momento de desplegar, es necesario modificar este valor y configurarlo correctamente según el rol de IAM que se utilice en cada entorno.

Este aspecto está identificado como un punto a corregir, ya que lo ideal es reemplazarlo por una referencia dinámica (por ejemplo, mediante Secrets Manager o Parameter Store) en lugar de mantenerlo fijo en la configuración.


------

# 10. Observabilidad y Monitoreo
### *10.1 CloudWatch Logs*
  Dashboard de Monitoreo en AWS CloudWatch

![WhatsApp Image 2025-11-30 at 15 41 58](https://github.com/user-attachments/assets/df2725a5-179d-4789-8576-07b8d8ff93ce)


En el marco del proyecto se desarrolló un dashboard personalizado en Amazon CloudWatch con el objetivo de centralizar la observabilidad del sistema e integrar en una única vista las métricas más relevantes de los servicios utilizados. Este panel permite monitorear el rendimiento, detectar anomalías y evaluar el estado general de la infraestructura desplegada.

### *10.2 Objetivo del Dashboard*

El propósito del dashboard es ofrecer una visión unificada y en tiempo real del comportamiento del sistema, abarcando componentes críticos como:

    Elastic Container Registry (ECR)
    Application Load Balancer (ALB)
    AWS Lambda
    Métricas de tráfico y actividad HTTP

Con esta información es posible validar el uso de recursos, analizar patrones de acceso y anticipar potenciales problemas operativos.

### *10.3 Secciones del Dashboard*
#### Rendimiento de ECR

El panel incluye dos métricas fundamentales para evaluar el rendimiento del Elastic Container Registry:

    CPUUtilization (%)
    MemoryUtilization (%)

Estas métricas permiten monitorear el uso de recursos vinculado a las imágenes y tareas asociadas a contenedores. Los valores observados se mantienen en rangos bajos, lo que indica estabilidad y un consumo eficiente de recursos.

#### Balanceador de Carga (ALB)

El dashboard presenta diversas métricas asociadas al Application Load Balancer, entre ellas:

      Pico de LCU
      Nuevas conexiones
      Conexiones activas
      Bytes procesados
      Conteo de respuestas HTTP 400

Estas métricas permiten analizar la demanda de tráfico, evaluar la eficiencia del balanceo y detectar posibles comportamientos anómalos en las solicitudes. Los datos reflejan cargas bajas y un funcionamiento estable.

#### Métricas de AWS Lambda

El panel dedicado a Lambda incluye las métricas operativas más importantes:

    Concurrencia utilizada
    Concurrencia no reservada
    Duración de ejecución
    Errores
    Cantidad de invocaciones
    Throttles
    Latencia de solicitudes

Esta sección permite verificar el rendimiento y comportamiento de las funciones Lambda, asegurando que no existan fallos, cuellos de botella o saturación. En los resultados obtenidos no se presentan errores ni throttling.

#### Beneficios del Dashboard

- Permite un monitoreo centralizado de los servicios involucrados en el proyecto.
- Facilita la detección temprana de fallas o degradaciones en el rendimiento.
- Proporciona datos clave para la toma de decisiones relacionadas con escalabilidad y optimización.
- Refuerza la estabilidad operativa del proyecto al brindar métricas en tiempo real.
- Simplifica la validación del comportamiento de los componentes durante pruebas o despliegues.

El dashboard implementado en Amazon CloudWatch constituye una herramienta fundamental para la observabilidad del proyecto, permitiendo monitorear métricas críticas de ejecución, tráfico y rendimiento. Su estructura clara y su enfoque orientado a los componentes principales aseguran una supervisión eficiente durante todo el ciclo de vida del sistema.

### *Alarmas*

Alarmas Configuradas en CloudWatch

<img width="715" height="143" alt="image" src="https://github.com/user-attachments/assets/cf95f576-deaf-49e2-b55c-c041cefa9e30" />

Se definieron tres alarmas clave para monitorear el estado de la infraestructura:

#### 1. ECS – CPUUtilization alta

Se configuró una alarma para detectar cuando la CPU del servicio ECS supera el 80% durante 25 minutos (5 puntos de datos consecutivos).
Esto permite identificar sobrecarga en las tareas y actuar antes de que el servicio se degrade.

#### 2. Lambda – Duración elevada

La alarma se dispara cuando la duración de la Lambda supera los 1500 ms dentro de un período de 5 minutos.
Esto ayuda a detectar procesos lentos, cuellos de botella o necesidad de aumentar memoria/optimizar código.

#### 3. ALB – PeakLCUs cercano al límite

LCU es la unidad que usa el ALB para medir cuánta carga está manejando, según conexiones, tráfico y reglas evaluadas.
Se monitorea el consumo de LCUs del Application Load Balancer. La alarma se activa si PeakLCUs > 8 en un intervalo de 5 minutos.
Esta métrica permite anticipar picos de tráfico, comportamientos anómalos o posibles incrementos de costo.

### *Evidencia de Notificacion por Mail de Alarma*

<img width="544" height="390" alt="image" src="https://github.com/user-attachments/assets/2cea6401-3859-48ed-873a-954f110f9c9e" />


---------
# 11. Conclusiones del proyecto

A lo largo del proyecto pudimos diseñar e implementar una arquitectura basada en microservicios, integrando componentes como API Gateway, Product Service, Inventory Service, Redis y Postgres. En paralelo, desarrollamos la infraestructura completa en AWS utilizando Terraform, lo que incluyó la creación de la VPC, subredes, balanceador de carga, servicios ECS Fargate, repositorios ECR y bases de datos administradas. Este proceso nos permitió comprender en profundidad la importancia de la infraestructura como código y las ventajas que ofrece en términos de control, organización y reproducibilidad.

También configuramos un backend remoto en S3 para gestionar el terraform.tfstate y trabajamos con módulos reutilizables, fortaleciendo buenas prácticas de diseño modular. En la gestión del código adoptamos GitHub con un enfoque inicial de Trunk-Based Development, y a partir de esta experiencia aprendimos que ciertas prácticas ideales requieren adaptación cuando el equipo es reducido.

Además, creamos pipelines de CI/CD segmentados por responsabilidad, integrando herramientas como SonarCloud y pruebas automatizadas para asegurar la calidad del código. Implementamos funciones Lambda, EventBridge y SNS para notificaciones automáticas post-deploy y construimos un dashboard en CloudWatch para centralizar métricas de los servicios. En conjunto, este proyecto nos permitió aplicar conocimientos técnicos avanzados y reflexionar sobre decisiones prácticas en contextos reales de desarrollo y operación.

12 
