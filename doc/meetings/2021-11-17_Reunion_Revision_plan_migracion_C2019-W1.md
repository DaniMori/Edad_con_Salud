---
title: 'Revisión del plan de migración de datos C2019-W1 de Edad con Salud'
date: "17-11-2021"
output: word_document
---

**Asistentes:** Daniel Morillo, Elvira Lara, Jesús Sierralaya

**Transcriptor:** Daniel Morillo

**Horario:** 10:00 - 10:43


# Revisión general y dudas

- Necesidad de considerar con precaución el borrado de versiones en SPSS.


# Datos en versión SPSS

**Discusión**: Hay archivos de datos en versiones de SPSS históricas.

Motivos para NO eliminarlas:

- La empresa adjudicataria los envía en este formato

- Es necesario poder trabajar en SPSS, e.g., en el caso de estudiantes de grado
  y otros colaboradores que pueden no tener licencias de Stata

- NO es recomendable eliminar las versiones históricas.

Motivos para eliminarlas:

- Evitar duplicidad en tareas de conservación de datos

- Interoperabilidad: SPSS puede abrir también archivos de Stata

**Aprobado**: Consultar con IPs, haciendo la siguiente recomendación:
No eliminarlas, pero pasar estas versiones al histórico (`history`) para
dejarlas como no accesibles para los investigadores pero disponer de
un "backup" en caso necesario.


# Subdirectorio "Antiguas" en muestra completa:

- **Aprobado**: Integrar en carpeta `history`.
  

# Versiones de archivos (línea 626):

- **Aprobado**: Usar Stata 13 como formato por defecto
  (usar `saveold` en Stata).

- **Aprobado**: Eliminar versión Stata 14 donde procede
  (submuestra preconfinamiento).


# Responsables de mantenimiento designados:

- **Recomendación** (Dani): Jesús y Dani

- **Aprobado**: Consultar con IPs (JL y JM)

  
# Hacer backup de permisos:

- **Aprobado**: Revisar permisos y copiar a hoja de cálculo estado actual de los
  permisos (Dani)


# Dudas, preguntas

- **Pregunta** *¿Por qué se utiliza el formato de SPSS por defecto?*
  Razones desconocidas; probablemente históricas, de compatibilidad,
  y de interoperabilidad.
  Es probablemente un formato más adecuado para el intercambio de datos que
  e.g. una hoja de cálculo.
