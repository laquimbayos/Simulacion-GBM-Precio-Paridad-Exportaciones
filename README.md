# Simulacion-GBM-Precio-Paridad-Exportaciones
Ejemplo caso de estudio: Simulación de Precios de Paridad de Exportaciones mediante Movimiento Browniano Geométrico en R

Este código en R se utiliza para calcular el Precio de Paridad de Exportaciones (PPE) mediante la simulación de trayectorias del Movimiento Browniano Geométrico (GBM) para los precios de referencia de gasolina UNL87 y Nafta. También realiza análisis estadísticos y visualización de los resultados.



Para ejecutar este código, asegúrate de tener instalados los siguientes paquetes de R:

- `tidyverse`- `xts`-`readxl`-`quantmod`

### Instrucciones de Uso

1. Clona este repositorio en tu máquina local.
2. Carga los datos de entrada desde el archivo Excel `datos_gasolina_nafta.xlsx`.
3. Ejecuta el código para realizar la simulación y análisis.
4. Los resultados se mostrarán en la consola y se generará una representación gráfica de las series de tiempo.
5. Finalmente se creará una carpeta de resultados donde se guardará en un archivo csv con los valores de la simulación y gráficas.

### Entrada de Datos

Los datos necesarios para este código deben estar en el archivo Excel `datos_gasolina_nafta.xlsx`. Asegúrate de que los datos históricos de UNL87 y Nafta estén presentes en el archivo.

### Resultados

El código calculará el Precio de Paridad de Exportaciones (PPE) y proporcionará análisis estadísticos como la media y la desviación estándar. También generará gráficos de las series de tiempo.


