### **Informe de Recomendaciones — Análisis SonarCloud**
## *1. Introducción*

El análisis realizado con SonarCloud sobre el proyecto DevOps-proyecto permitió identificar bugs, vulnerabilidades, code smells y problemas de mantenibilidad.
El objetivo de este documento es presentar un conjunto de recomendaciones prácticas y priorizadas para mejorar la calidad, seguridad y estabilidad del código.

## *2. Recomendaciones Generales*

Priorizar la corrección de Blockers y Vulnerabilidades antes de cualquier despliegue.

Establecer una política mínima de calidad, incluyendo cobertura de tests, manejo de errores y estándares de codificación.

Integrar SonarCloud al pipeline CI/CD para asegurar que ninguna nueva versión degrade la calidad del código.

## *3. Recomendaciones por categoría del análisis*
## *3.1 Bugs*
Situación

Se detectó 1 bug, relacionado a un tipo en Go que no implementa el método Error() string.

Recomendaciones

Implementar siempre el método Error() string en las estructuras que representen errores personalizados.

Definir una convención interna para manejo de errores en Go.

Agregar pruebas unitarias que verifiquen que los errores se propaguen correctamente.

3.2 Vulnerabilidades
Situación

Se detectaron 3 vulnerabilidades, principalmente:

Uso de contraseñas incrustadas en código.

Dependencias sin versión fija en Docker.

Recomendaciones
🔐 Gestión de credenciales

Eliminar todas las credenciales en código fuente.

Utilizar variables de entorno, AWS Parameter Store, AWS Secrets Manager o similar.

Implementar un archivo .env.template sin valores reales.

📦 Dependencias con versiones fijas

Establecer versiones fijas en Dockerfiles:

FROM python:3.10


Evitar el uso de:

FROM python:latest


Revisar dependencias vulnerables con:

pip-audit
npm audit
trivy fs .

🧪 Seguridad en despliegues

Implementar un escaneo automático de seguridad en el pipeline (Trivy, Snyk o GitHub Dependabot).

Bloquear despliegues si se detectan vulnerabilidades críticas.

3.3 Code Smells
Situación

Se identificaron 56 code smells, incluyendo:

Literales repetidos.

Errores no manejados.

Funciones demasiado largas.

Recomendaciones
📝 1. Reemplazar literales repetidos por constantes

Centralizar cadenas, rutas, claves de header y valores compartidos.

Crear archivos de configuración o constantes:

const CONTENT_TYPE_JSON = "application/json"

⚠️ 2. Manejar siempre los errores

En Go, reemplazar:

result := doSomething()


por:

result, err := doSomething()
if err != nil {
    return err
}

🔧 3. Reducir funciones largas

Dividir funciones extensas en componentes más pequeños.

Aplicar el principio SRP (Single Responsibility Principle).

🏗️ 4. Estandarizar la estructura del proyecto

Aplicar una arquitectura clara (por ejemplo, Clean Architecture o MVC según el lenguaje).

Separar controladores, servicios y lógica de negocio.

4. Recomendaciones sobre métricas clave
4.1 Cobertura 0%
Situación

No existen pruebas unitarias.

Recomendaciones

Definir un objetivo inicial de 40% de cobertura, con incremento gradual a 60–80%.

Crear tests para:

Funciones críticas

Validaciones

Manejo de errores

Lógica de negocio

Integrar pruebas al pipeline (pytest, Go test, Jest, etc.).

Ejemplo en Go
func TestAddProduct(t *testing.T) {
    result := AddProduct("Test")
    if result.Name != "Test" {
        t.Errorf("expected Test, got %s", result.Name)
    }
}

4.2 Duplicación del código
Situación

Se detectaron 36 líneas duplicadas.

Recomendaciones

Identificar patrones repetidos y extraerlos a funciones o módulos reutilizables.

Documentar funciones utilitarias para fomentar su uso.

Realizar revisiones de código obligatorias para evitar duplicación futura.

5. Recomendación global priorizada
🔴 Alta prioridad (Corregir inmediatamente)

Blockers

Vulnerabilidades

Manejo de errores en Go

Eliminación de credenciales en código

Versiones fijadas de imágenes Docker

🟡 Prioridad media (Próximos sprints)

Refactorización de funciones largas

Eliminación de code smells repetitivos

Reducción de duplicaciones

🟢 Prioridad baja (Mejoras continuas)

Normalización de estilos

Revisión periódica de dependencias

Documentación técnica

6. Conclusión

El análisis de SonarCloud muestra un proyecto funcional pero con puntos críticos de seguridad y calidad que deben atenderse cuanto antes.
La aplicación de estas recomendaciones permitirá:

✔ Reducir riesgos de seguridad
✔ Mejorar mantenibilidad del código
✔ Aumentar estabilidad en producción
✔ Facilitar la colaboración entre desarrolladores
✔ Cumplir estándares profesionales de calidad
