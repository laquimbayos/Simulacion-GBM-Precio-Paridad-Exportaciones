# Simulacion-GBM-Precio-Paridad-Exportaciones
Ejemplo caso de estudio: Simulación de Precios de Paridad de Exportaciones mediante Movimiento Browniano Geométrico en R

Este código en R se utiliza para calcular el Precio de Paridad de Exportaciones (PPE) mediante la simulación de trayectorias del Movimiento Browniano Geométrico (GBM) para los precios de referencia de gasolina UNL87 y Nafta. También realiza análisis estadísticos y visualización de los resultados.

Este repositorio contiene el código y los datos necesarios para simular el Precio de Paridad de Exportaciones (PPE) diario para un horizonte de un año (252 días) utilizando el modelo de Movimiento Browniano Geométrico (GBM). Esta simulación se basa en la Resolución 181602 de 30 de septiembre de 2011, que describe la relación entre el PPE y varios factores, como el precio de referencia de gasolina UNL 87, el precio de Nafta, la TRM (Tasa Representativa del Mercado), los costos de fletes marítimos y de transporte por poliducto.

## Descripción del Problema

El PPE se calcula según la siguiente fórmula:

```
PPTt = (0.7 * UNL87t + 0.3 * Naftat - FL - CT) * TRMt
```

Donde:
- `PPTt`: Cotización de la gasolina referencia UNL 87 en dólares por galón.
- `UNL87t`: Cotización de gasolina UNL 87 en dólares por galón.
- `Naftat`: Cotización de Nafta en la costa del Golfo de los EEUU en dólares por galón.
- `FL`: Costo de los fletes marítimos y otros costos de transporte desde el puerto de exportación local de la costa colombiana hasta la Costa del Golfo de EEUU en dólares por galón.
- `CT`: Costo de transporte por poliducto para llevar un galón de gasolina desde la Refinería hasta el puerto de exportación local en dólares por galón.
- `TRM`: Tasa Representativa del Mercado definida en el artículo 96 del Estatuto Orgánico del Sistema Financiero y certificada por la Superintendencia Bancaria.

El objetivo es simular el PPEt diario para un año (252 días) y realizar 1,000 simulaciones utilizando un modelo de Movimiento Browniano Geométrico para UNL87 y Nafta, así como los valores dados para TRM, FL y CT.


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

Si tiene alguna pregunta o encuentra algún problema, no dude en crear un problema en este repositorio o ponerse en contacto con el autor a través de laquimbayos@unal.edu.co

---

¡Disfrute de su simulación de precios de paridad de exportaciones utilizando el modelo de Movimiento Browniano Geométrico!



