# Satellite Dynamics: Simulador Orbital 3D

Este repositorio contiene un simulador desarrollado en MATLAB que calcula y grafica la trayectoria tridimensional de un satélite en órbita terrestre baja (LEO). El modelo matemático utiliza los elementos orbitales de Kepler y aplica matrices de rotación espacial para proyectar la trayectoria desde el plano orbital hacia el sistema geocéntrico ecuatorial.

## Características Principales

* **Cálculo Perifocal:** Resolución de la posición del satélite en su propio plano orbital utilizando la anomalía verdadera, el semieje mayor y la excentricidad.
* **Transformación 3D:** Implementación de matrices de rotación de Euler para ajustar la Longitud del Nodo Ascendente (RAAN), la Inclinación y el Argumento del Perigeo.
* **Visualización Geocéntrica:** Renderizado 3D interactivo que incluye un modelo esférico de la Tierra a escala para proporcionar contexto espacial inmediato de la órbita.

## Requisitos

* MATLAB (probado en versiones recientes).
* No requiere la instalación de *Toolboxes* adicionales, funciona con las funciones base del sistema.

## Cómo usar este simulador

1. Clona este repositorio o descarga la carpeta en tu entorno local.
2. Abre MATLAB y configura la carpeta del repositorio como tu **Current Folder**.
3. Abre el archivo principal `simulador_orbital.m`.
4. (Opcional) Modifica los parámetros en la sección `Elementos Orbitales de Kepler` para experimentar con distintas trayectorias. Por ejemplo:
   * Aumenta la excentricidad (`e = 0.5`) para ver una órbita altamente elíptica.
   * Cambia la inclinación (`i = deg2rad(90)`) para generar una órbita polar.
5. Ejecuta el script. Se abrirá una figura con la simulación 3D que puedes rotar y analizar libremente con el ratón.
