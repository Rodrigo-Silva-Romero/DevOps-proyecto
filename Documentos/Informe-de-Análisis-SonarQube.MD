# Análisis SonarCloud (Overview)

## 1. Introducción
SonarCloud es una herramienta de análisis estático que permite identificar **bugs**, **vulnerabilidades** y **malas prácticas** en el código.  
En este informe se documentan los resultados obtenidos en el proyecto **DevOps-proyecto**.

---

## 2. Resumen general del análisis (Overview)

### Datos del análisis
- **Fecha del último análisis:** 29/11/2025
- **Líneas de código analizadas:**
  - HTML → 629
  - Go → 563
  - Python → 150
  - Docker → 60

### Estado del Quality Gate
- **Passed**

### Totales
- **Issues:** 60
- **Cobertura:** 0.0%
- **Duplicaciones:** 2.0% (36 líneas duplicadas)

---

## 3. Hallazgos significativos

### Issues críticos (Blocker y High)
- **Blocker:** 2  
  - Son los más graves, pueden afectar la ejecución o seguridad.  
  - **Recomendación:** deben corregirse de inmediato, antes de cualquier despliegue.
- **High:** 23  
  - Problemas importantes que impactan estabilidad y mantenibilidad.  
  - **Recomendación:** priorizar su resolución en el corto plazo, junto con los Blocker.

### Issues medios y bajos
- **Medium:** 32  
- **Low:** 15  
  - Son problemas menores, generalmente de estilo o mantenibilidad.  
  - **Recomendación:** se pueden planificar como mejoras progresivas, no requieren acción inmediata.

---

## 4. Clasificación por tipo

### Bugs
- **Bug:** 1  
  - Error de lógica o ejecución.  
  - **Recomendación:** corregirlo pronto para evitar fallos en producción.  

**Ejemplo de bug — Método `Error() string` faltante**
- **Qué significa:** En Go, los tipos de error deberían implementar un método `Error() string`.
- **Por qué está mal:** Sin ese método, el error no se muestra bien y es más difícil depurar.
- **Qué hacer:** Implementar el método en el tipo de error.

---

### Vulnerabilidades
- **Vulnerabilities:** 3  
  - Riesgos de seguridad.  
  - **Recomendación:** revisar y mitigar de inmediato, incluso si no son Blocker.

**Ejemplos de vulnerabilidades**
- Contraseña de base de datos escrita en el código (`main.py`).
  - **Problema:** expone credenciales sensibles.
  - **Solución:** usar variables de entorno o gestor de secretos.
- Dependencias en Docker sin versión fija.
  - **Problema:** si la librería se actualiza con un cambio inseguro, la aplicación queda vulnerable.
  - **Solución:** fijar versiones en `Dockerfile` o `requirements.txt`.

---

### Code Smells
- **Code Smells:** 56  
  - Malas prácticas y problemas de mantenibilidad.  
  - **Recomendación:** no hace falta corregir todos ya, pero sí atacar los patrones repetitivos (funciones largas, dependencias sin versión fija, falta de manejo de errores).

**Ejemplos de Code Smells**
- Literales repetidos  
  - **Ejemplo:** `"Content-Type"`, `"application/json"`, rutas como `"/api/products/{id}"`.
  - **Problema:** si hay que cambiar el valor, hay que modificarlo en muchos lugares.
  - **Solución:** definir constantes o variables globales.
- Errores no manejados en Go  
  - **Problema:** la aplicación puede fallar silenciosamente.
  - **Solución:** manejar explícitamente los errores (`if err != nil { … }`).
- Funciones demasiado largas  
  - **Problema:** difícil de leer y mantener.
  - **Solución:** dividir en funciones más pequeñas y específicas.

---

## 5. Hallazgo importante detallado: Manejo insuficiente de errores (High)
- **Qué significa:** En varios lugares del código (sobre todo en Go) hay errores que no se manejan o se ignoran sin explicación.  
  Ejemplo detectado: *“Handle this error explicitly or document why it can be safely ignored”*.
- **Por qué está mal:**  
  Si ocurre un error y no se maneja, la aplicación puede fallar silenciosamente o comportarse de forma inesperada.
- **Qué hacer:**  
  - Implementar manejo explícito de errores (`if err != nil { log.Fatal(err) }`).
  - Documentar claramente por qué un error puede ignorarse, si realmente es seguro hacerlo.

---

## 6. Métricas clave

### Cobertura — 0%
- **Problema:** no hay pruebas unitarias, entonces no sabemos si el código funciona como se espera.
- **Ejemplo:** si alguien cambia la lógica de `main.go`, no hay tests que avisen si rompió algo.
- **Solución:** implementar tests unitarios e integración, apuntando a cubrir al menos 60–80%.

### Duplicaciones — 2% (36 líneas)
- **Problema:** hay código repetido en varios archivos.
- **Ejemplo:** funciones que hacen lo mismo copiadas en distintos servicios.
- **Solución:** refactorizar para reutilizar funciones comunes.
