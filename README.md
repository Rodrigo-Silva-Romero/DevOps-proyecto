# Introducción
##
1. ## Objetivo del proyecto

El objetivo principal de este proyecto es diseñar, implementar y documentar una arquitectura completa para un sistema de microservicios desplegado sobre AWS utilizando prácticas modernas de DevOps, Infraestructura como Código y automatización continua. El propósito es construir una solución robusta, escalable y reproducible que integre diferentes tecnologías —Docker, ECS Fargate, Terraform, GitHub Actions y servicios serverless como AWS Lambda— demostrando la capacidad de orquestar múltiples componentes para ofrecer un sistema productivo realista y alineado con estándares profesionales.

Este proyecto busca no solo desplegar microservicios funcionales (API Gateway, Product Service, Inventory Service, Redis, Postgres), sino también generar una capa de infraestructura altamente automatizada que permita gestionar entornos completos de manera declarativa. La infraestructura está definida íntegramente en Terraform, permitiendo crear desde cero la red, el balanceo de carga, los repositorios de imágenes, los servicios de contenedores y todos los recursos asociados. Esto garantiza consistencia, reproducibilidad y simplifica enormemente el mantenimiento a largo plazo.

Otro de los objetivos clave es implementar una cadena de CI/CD basada en GitHub Actions capaz de automatizar tanto la construcción y publicación de imágenes Docker en ECR como el proceso de despliegue de la infraestructura y los servicios en ECS Fargate. De esta manera, cualquier cambio en el código o la configuración puede ser puesto en producción mediante pipelines claros, trazables y seguros, eliminando pasos manuales y reduciendo riesgos operativos.

Finalmente, el proyecto incorpora un componente serverless mediante una Lambda que se integra con EventBridge y SNS para generar notificaciones automáticas cada vez que se produce un despliegue en ECS. Esta funcionalidad responde al objetivo de incluir mecanismos de monitoreo y observabilidad que acompañen al ciclo de vida de la aplicación, aportando valor agregado y cerrando el círculo de automatización requerido para un entorno moderno de microservicios.

En conjunto, el proyecto demuestra el diseño, la construcción y la puesta en marcha de una plataforma completa de microservicios basada en las mejores prácticas de infraestructura en la nube, automatización, seguridad y operación continua, cumpliendo plenamente con los requisitos académicos y replicando escenarios reales del ámbito profesional.

------

2. ## Planificación y Seguimiento

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

<img width="532" height="44" alt="Aspose Words 9986df04-c16e-4362-91e4-5250e7d621d5 006" src="https://github.com/user-attachments/assets/ec841d85-e711-479b-b038-6fa2464feb09" />


### *Terraform Deploy - terraform-apply.yml*

<img width="520" height="106" alt="Aspose Words 9986df04-c16e-4362-91e4-5250e7d621d5 007" src="https://github.com/user-attachments/assets/2146d5c7-ec01-48ec-949e-6c79af450a1b" />



#### *terraform-destroy.yml*

#### *storage-apply.yml*



## **Estrategia de pipelines: Apply / Deploy de app / Destroy / Storage Deploy**

Se diseñaron cuatro pipelines distintos, cada uno con responsabilidades bien definidas:

1. **Terraform Apply**: despliegue de la infraestructura principal del proyecto (VPC, ECS, ALB, RDS, etc.).

2. **Deploy Only (Build & Deploy)**: testing de código, análisis de calidad, construcción de imágenes Docker, push a ECR y actualización del servicio ECS.

3. **Terraform Destroy**: eliminación controlada y segura de toda la infraestructura desplegada.

4. **Terraform Storage Deploy**: pipeline dedicado a la creación y gestión inicial del storage del 

**Disparadores configurados**

Terraform Apply / Destroy : workflow\_dispatch (ejecución manual seleccionando environment: dev/staging/prod).

Pipeline de deploy de App (main.yml),  se dispara automáticamente con Merge a main.

## **Motivos de la decisión**

Los pipelines se separaron para garantizar **seguridad, control y claridad**, especialmente al incorporar el nuevo pipeline de *Storage Deploy*:

- **Responsabilidades independientes:**  
  Cada pipeline cumple un rol específico.  
  - *Terraform Apply* y *Terraform Destroy* administran la infraestructura principal.  
  - *Deploy Only* gestiona la construcción y despliegue de contenedores sin tocar la infraestructura.  
  - *Terraform Storage Deploy* se encarga exclusivamente de crear los recursos base iniciales (S3 para tfstate y repositorios ECR).  
  Esta separación evita mezclar procesos, riesgos y permisos.

- **Ciclos de vida distintos:**  
  La infraestructura base (S3, ECR) se crea una sola vez; la infraestructura operativa cambia poco; las imágenes de la app cambian constantemente.  
  Mantener pipelines aislados evita aplicar Terraform innecesariamente en etapas donde no corresponde.

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


**Disparadores y flujo operativo.**

**Precondiciones**

                                                                          (  **Poner acá todo lo que hay que cargar en secrets** 
                                                                            
                                                                            `	`**AWS credenciales 3**) 

- **Cambios en infraestructura**: generar PR → revisar tfplan → ejecutar el pipeline Terraform Apply manualmente (workflow\_dispatch) para el environment objetivo. 

- **Cambios de aplicación**: PR → merge a main → pipeline DEPLOY ONLY  construye imágenes, Sonar + tests, las sube a ECR y actualiza ECS automáticamente.

- **Destrucción de entornos**: ejecutar Terraform Destroy manualmente mediante workflow\_dispatch únicamente cuando sea necesario.

Separar la creación de la infraestructura, el deploy de la app, y destrucción de la infraestructura permite mejor seguridad, mayor velocidad en CI, mayor control y trazabilidad, y previene errores críticos al exigir acciones conscientes para cambios infraestructurales y destrucciones.

------------

4. ## Testing y Calidad


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

5. ## Arquitectura del Sistema

### *5.1 Arquitectura funcional (microservicios)*

La arquitectura del proyecto se basa en un enfoque de **microservicios**, donde cada componente del sistema se implementa como un servicio independiente, aislado y con una responsabilidad claramente definida. Cada microservicio expone su funcionalidad a través de APIs y se comunica con el resto del ecosistema mediante protocolos livianos, lo que permite una mayor flexibilidad, escalabilidad y facilidad de mantenimiento.

Este modelo favorece el despliegue y la actualización individual de cada servicio sin afectar al resto del sistema, además de facilitar la detección de fallos y la optimización de componentes específicos. La separación modular también permite asignar tecnologías, recursos y pipelines independientes para cada microservicio, de acuerdo con las necesidades de su funcionalidad.

### 5.1a Arquitectura de despliegue (AWS)

<img width="551" height="469" alt="Aspose Words 9986df04-c16e-4362-91e4-5250e7d621d5 008" src="https://github.com/user-attachments/assets/3b0fbbc2-85d8-40be-bd43-82ebfefd2eb2" />

### 5.1b Diagrama de arquitectura

### 5.1c Flujo de comunicación entre componentes

### *5.2 Estructura del repositorio (tree)*
TODO

------
## 6\. Infraestructura como Código (Terraform)
### *6.1 Estructura de carpetas de Terraform*

      TODO

### *6.2 Módulos implementados*

VPC

Security Group

ECR (Elastic Container Registry)

ECS Cluster

ECS Service

ALB (Application Load Balancer)

ECS Task Definition *(fuera del directorio de módulos, pero parte de la infraestructura)*

- Define los contenedores del sistema:
  - API Gateway
  - Product Service
  - Inventory Service
  - PostgreSQL
  - Redis
- Incluye variables, outputs y la plantilla JSON usada por GitHub Actions.

### *6.3 Variables por entorno y secrets*

    TODO
-------
### *6.4 Backend Remoto en Amazon S3*
####
El proyecto utiliza un bucket S3 como backend remoto de Terraform, con el objetivo de almacenar el archivo de estado (terraform.tfstate) de forma centralizada, segura y accesible para todo el equipo de trabajo y los pipelines de CI/CD. Esta práctica es fundamental para garantizar consistencia en la infraestructura desplegada y evitar conflictos en el manejo del estado.

-------
### *6.5 Outputs importantes*

- URLs ECR
- ARN Task
- DNS ALB
-------
## 7\. Arquitectura Serverless (Lambda + SNS + EventBridge)
### *7.1 Objetivo de la Lambda*

La función Lambda es invocada automáticamente al finalizar el pipeline de creación de la infraestructura (Terraform Apply). Durante la ejecución del workflow, el pipeline obtiene la URL pública de la Lambda (Lambda Function URL), la almacena en una variable y una vez completado el terraform apply, realiza un POST HTTP hacia dicha URL. 

Este POST actúa como el disparador de la función, provocando que la Lambda procese la solicitud y envíe el correo electrónico de notificación. 

De esta manera, cada despliegue de infraestructura queda registrado y comunicado sin intervención manual, asegurando una trazabilidad completa de los cambios aplicados.

-------
## 9\. Despliegue
### *9.2 Despliegue con Terraform*
### *9.3 Despliegue continuo con GitHub Actions*
### *9.4 Rollover de ECS Task Definition*
### *9.5 Acceso al sistema (URL del ALB)*
------
## 10\. Seguridad
### *10.1 IAM Roles*
### *10.2 Security Groups*
### *10.3 Policies mínimas necesarias*
### *10.4 Manejo de secretos*
- GitHub Secrets
- Variables de entorno
- Política de no almacenar passwords en código
------
## 11\. Observabilidad y Monitoreo
### *11.1 CloudWatch Logs*
  Dashboard de Monitoreo en AWS CloudWatch

![WhatsApp Image 2025-11-30 at 15 41 58](https://github.com/user-attachments/assets/df2725a5-179d-4789-8576-07b8d8ff93ce)


En el marco del proyecto se desarrolló un dashboard personalizado en Amazon CloudWatch con el objetivo de centralizar la observabilidad del sistema e integrar en una única vista las métricas más relevantes de los servicios utilizados. Este panel permite monitorear el rendimiento, detectar anomalías y evaluar el estado general de la infraestructura desplegada.

### *11.2 Objetivo del Dashboard*

El propósito del dashboard es ofrecer una visión unificada y en tiempo real del comportamiento del sistema, abarcando componentes críticos como:

    Elastic Container Registry (ECR)
    Application Load Balancer (ALB)
    AWS Lambda
    Métricas de tráfico y actividad HTTP

Con esta información es posible validar el uso de recursos, analizar patrones de acceso y anticipar potenciales problemas operativos.

### *11.3Secciones del Dashboard*
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

####  Métricas ECS*
####  Healthchecks*

---------
## 12\. Conclusiones del proyecto

